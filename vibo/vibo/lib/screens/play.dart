import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vibo/models/vibo_model.dart.dart';
import 'package:vibo/screens/player_store.dart';
import 'package:vibo/screens/player_widget.dart';

Future<List<File>> downloadFile(List<String> urls) async {
  print(urls.toList());
  Dio dio = Dio();
  List<File> finalUrls = [];
  try {
    var dir = await getExternalStorageDirectory();
    List<FileSystemEntity> entities = await dir!.list().toList();

    await () async {
      urls.forEach((url) async {
        String name = url.substring(url.lastIndexOf("/") + 1);
        var path = "${dir.path}/$name";
        File file = File(path);
        if (await file.exists()) {
          finalUrls.add(file);
        } else {
          await dio.download(url, path, onReceiveProgress: (rec, total) {
            print("Rec: $rec , Total: $total");
          });
          if (await file.exists()) {
            finalUrls.add(file);
            print("Download completed");
          }
        }
      });
    };
    print(finalUrls.toList());
    return finalUrls;
  } catch (e) {
    print("$e ERROS");
    return finalUrls;
  }
}

class PlayScreen extends StatefulWidget {
  final String docId;
  const PlayScreen({Key? key, required this.docId}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  var firebase = FirebaseFirestore.instance.collection('vibo');
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    PlayerStore _store = GetIt.I<PlayerStore>();
    return FutureBuilder<DocumentSnapshot>(
        future: firebase.doc(widget.docId).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
              "Ocorreu um erro!",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ));
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Center(
                child: Text("Imagem não existe",
                    style: TextStyle(fontSize: 20, color: Colors.white)));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            var viboModel = ViboModel.fromMap(data);

            return Container(
              color: Colors.black,
              child: FutureBuilder<List<File>>(
                future: downloadFile(viboModel.images),
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      "Ocorreu um erro!",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ));
                  }

                  if (!snapshot.hasData &&
                      snapshot.connectionState != ConnectionState.done) {
                    return Center(
                        child: Text("Imagem não existe",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)));
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        color: Colors.black,
                        child: Observer(
                          builder: (_) => CarouselSlider(
                            items: snapshot.data!.map((File file) {
                              if (file.path.contains(".mp4")) {
                                return PlayerWidget(file: file);
                              } else {
                                return Image.file(file);
                              }
                            }).toList(),
                            carouselController: _store.carouselController,
                            options: CarouselOptions(
                                autoPlay: _store.autoPlay,
                                enlargeCenterPage: true,
                                viewportFraction: 1,
                                initialPage: 1,
                                autoPlayInterval: _store.time),
                          ),
                        ));
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
