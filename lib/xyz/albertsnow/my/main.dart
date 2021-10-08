import 'package:flutter/material.dart';
import 'package:flutter_video/xyz/albertsnow/my/video_player/video_play_page.dart';
import 'package:flutter_video/xyz/albertsnow/my/thumbnail/video_thumbnail_widget.dart';
import 'package:flutter_video/xyz/albertsnow/my/video_player/video_player_thumbnail_page.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  var permissionMessage = 'Permission init';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var videoPathList = <String>[
    '/storage/emulated/0/DCIM/Camera/VID20210906155701.mp4',
    // '/storage/emulated/0/DCIM/Camera/VID20210906112128.mp4',
    // '/storage/emulated/0/DCIM/Camera/VID20210903173456.mp4',
    // '/storage/emulated/0/DCIM/Camera/VID20210903171528.mp4',
    // '/storage/emulated/0/DCIM/Camera/VID20210903171450.mp4',
    // '/storage/emulated/0/DCIM/Camera/VID20210702165520.mp4',
    // '/storage/emulated/0/aserbao/1617011056877.mp4',
    // '/storage/emulated/0/aserbao/1617010964213.mp4',
    // '/storage/emulated/0/aserbao/1617010907549.mp4',
    // '/storage/emulated/0/aserbao/1617010903713.mp4',
    // '/storage/emulated/0/aserbao/1617006478145.mp4',
    // '/storage/emulated/0/aserbao/1617006475678.mp4',
    // '/storage/emulated/0/aserbao/1617006471639.mp4',
    // '/storage/emulated/0/123.mp4',
    // '/storage/emulated/0/aserbaoCamera/videotemp/1617002673582.mp4',
    // '/storage/emulated/0/aserbao/1617002634642.mp4',
    // '/storage/emulated/0/aserbao/1617002586386.mp4',
    // '/storage/emulated/0/aserbao/1617002558492.mp4',
    // '/storage/emulated/0/aserbao/1617002542544.mp4'
  ];

  Future<void> requestPermission() async {
    bool isGrant = await Permission.storage.isGranted;
    if (!isGrant) {
      isGrant = await Permission.storage.request().isGranted;
    }

    widget.permissionMessage = isGrant ? "Get Permission" : "Retry Permission";

    setState(() {});
    debugPrint("Request permission finish");
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
    debugPrint("initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.permissionMessage),
            ElevatedButton(
              onPressed: () {
                requestPermission();
                setState(() {});
              }, child: Text("RequestPermission"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VideoPlayPage();
                }));
              }, child: Text("To video play page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VideoPlayerThumbnailPage();
                }));
              }, child: Text("Display thumbnail by VideoPlayer SDK"),
            ),
            Container(
              width: double.infinity,
              height: 500,
              child: ListView.builder(
                  itemCount: videoPathList.length,
                  itemBuilder: (context, index) {
                    return Container(
                        color: Color.fromARGB(155, 100, 100, 100),
                        height: 300,
                        child: VideoThumbnailView(videoPathList[index]));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
