import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class VideoThumbnail extends StatefulWidget {
  const VideoThumbnail(this.videoPath, {Key key}) : super(key: key);

  final String videoPath;

  @override
  _VideoThumbnailState createState() => _VideoThumbnailState();
}

class _VideoThumbnailState extends State<VideoThumbnail> {
  VideoPlayerController _controller;
  Future _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath));
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          renderVideoThumbnail(),
          Text(
            widget.videoPath,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget renderVideoThumbnail() {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (!mounted) {
          return SizedBox.shrink();
        }

        print(snapshot.connectionState);


        if (snapshot.hasError) print(snapshot.error);
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            width: 200.0,
            height: 200.0,
            child: VideoPlayer(_controller),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

}
