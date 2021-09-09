import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailThumbnail extends StatefulWidget {
  const VideoThumbnailThumbnail(this.videoPath, {Key key}) : super(key: key);

  final String videoPath;

  @override
  _VideoThumbnailThumbnailState createState() => _VideoThumbnailThumbnailState();
}

class _VideoThumbnailThumbnailState extends State<VideoThumbnailThumbnail> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // renderVideoThumbnail(),
          Text(
            widget.videoPath,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Future<Uint8List> render() async {
    return await VideoThumbnail.thumbnailData(
      video: widget.videoPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 25,
    );

  }

  Widget renderVideoThumbnail() {
    return FutureBuilder<Uint8List>(
      future: render(),
      builder: (context, snapshot) {
        if (!mounted || snapshot == null) {
          return SizedBox.shrink();
        }

        print(snapshot.connectionState);
        if (snapshot.hasError) print(snapshot.error);

        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            width: 200.0,
            height: 200.0,
            child: Image.memory(snapshot.data),
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
