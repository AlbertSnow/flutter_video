import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailView extends StatefulWidget {
  const VideoThumbnailView(this.videoPath, {Key key}) : super(key: key);

  final String videoPath;

  @override
  _VideoThumbnailViewState createState() => _VideoThumbnailViewState();
}

class _VideoThumbnailViewState extends State<VideoThumbnailView> {

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
          renderVideoThumbnail(),
          // Text(
          //   widget.videoPath,
          //   maxLines: 3,
          // ),
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
    print("zhao video thumbnail build 2.0........");


    return FutureBuilder<Uint8List>(
      future: render(),
      builder: (context, snapshot) {
        print("zhao video thumbnail build 1.0........");

        if (!mounted || snapshot == null || snapshot.data == null) {
          print("zhao video data null");
          print ("zhao video path: " + widget.videoPath);

          return SizedBox.shrink();
        }

        print(snapshot.connectionState);
        if (snapshot.hasError) print(snapshot.error);

        if (snapshot.connectionState == ConnectionState.done) {
          print ("zhao video success ");


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
