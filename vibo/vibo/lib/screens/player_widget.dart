import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vibo/screens/player_store.dart';
import 'package:video_player/video_player.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({
    Key? key,
    required this.file,
  }) : super(key: key);

  final File file;
  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  PlayerStore _videoStore = GetIt.I<PlayerStore>();
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.asset(widget.file.path);
    controller
      ..setLooping(false)
      ..initialize()
      ..addListener(() => mounted
          ? setState(() {
              int position = controller.value.position.inSeconds;
              int duration = controller.value.duration.inSeconds;
              _videoStore.setDuration(duration: duration);
              _videoStore.setPosition(position: position);
            })
          : null)
      ..play();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => controller.value.isInitialized
      ? Container(
          alignment: Alignment.topCenter,
          child: Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              )
            ],
          ))
      : Container(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );
}
