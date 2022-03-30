import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vibo/models/vibo_model.dart.dart';
import 'package:vibo/utils/constants.dart';

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
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                color: Colors.black,
                child: CarouselSlider(
                  items: viboModel.images.map((img) {
                    return Image.network(img);
                  }).toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      //aspectRatio: 1,
                      initialPage: 1,
                      //autoPlayAnimationDuration: Duration(seconds: 10),
                      autoPlayInterval: Duration(seconds: 12)),
                ));
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
