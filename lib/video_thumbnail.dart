import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  // Widget renderVideoThumbnail() {
  //   return FutureBuilder(
  //     future: _initializeVideoPlayerFuture,
  //     builder: (context, snapshot) {
  //       if (!mounted) {
  //         return SizedBox.shrink();
  //       }
  //
  //       print(snapshot.connectionState);
  //       if (snapshot.hasError) print(snapshot.error);
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         return Container(
  //           width: 200.0,
  //           height: 200.0,
  //           child: VideoPlayer(widget.videoPath),
  //         );
  //       } else {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //     },
  //   );
  // }

}
