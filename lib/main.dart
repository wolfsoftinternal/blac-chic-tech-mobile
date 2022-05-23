import 'package:blackchecktech/SplashScreen.dart';
import 'package:blackchecktech/UIScreen/Connect12.dart';
import 'package:blackchecktech/UIScreen/ListScreen.dart';
import 'package:blackchecktech/UIScreen/Test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'UIScreen/EventList.dart';
import 'Welcome.dart';

GetIt getIt = GetIt.instance;

const Color themeColor = Color(0xff00bc56);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (BuildContext context,child) { 
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
         home: EventList(),
       
        );
      },
    );
  }
}


// import 'package:chewie/chewie.dart';
// import 'package:chewie/src/chewie_player.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() {
//   runApp(
//     MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: ChewieDemo(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class ChewieDemo extends StatefulWidget {
//   ChewieDemo({this.title = 'Chewie Demo'});

//   final String title;

//   @override
//   State<StatefulWidget> createState() {
//     return _ChewieDemoState();
//   }
// }

// class _ChewieDemoState extends State<ChewieDemo> {
//   TargetPlatform? _platform;
//   VideoPlayerController? _videoPlayerController1;
//   VideoPlayerController? _videoPlayerController2;
//   ChewieController? _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController1 = VideoPlayerController.network(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
//     _videoPlayerController2 = VideoPlayerController.asset(
//         'assets/videos/sample.mp4');
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController1!,
//       aspectRatio: 3 / 2,
//       autoPlay: false,
//       looping: true,
//       // Try playing around with some of these other options:

//       // showControls: false,
//       // materialProgressColors: ChewieProgressColors(
//       //   playedColor: Colors.red,
//       //   handleColor: Colors.blue,
//       //   backgroundColor: Colors.grey,
//       //   bufferedColor: Colors.lightGreen,
//       // ),
//       // placeholder: Container(
//       //   color: Colors.grey,
//       // ),
//       // autoInitialize: true,
//     );
//   }

//   @override
//   void dispose() {
//     _videoPlayerController1!.dispose();
//     _videoPlayerController2!.dispose();
//     _chewieController!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: widget.title,
//       theme: ThemeData.light().copyWith(
//         platform: _platform ?? Theme.of(context).platform,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: Center(
//                 child: Chewie(
//                   controller: _chewieController!,
//                 ),
//               ),
//             ),
//             // FlatButton(
//             //   onPressed: () {
//             //     _chewieController!.enterFullScreen();
//             //   },
//             //   child: Text('Fullscreen'),
//             // ),
//             // Row(
//             //   children: <Widget>[
//             //     Expanded(
//             //       child: FlatButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             _chewieController!.dispose();
//             //             /*_videoPlayerController2.pause();
//             //             _videoPlayerController2.seekTo(Duration(seconds: 0));*/

//             //             _chewieController = ChewieController(
//             //               videoPlayerController: _videoPlayerController1!,
//             //               aspectRatio: 3 / 2,
//             //               autoPlay: false,
//             //               looping: true,
//             //             );

//             //             _videoPlayerController1!..initialize().then((_){
//             //               setState(() {
//             //                 _videoPlayerController1!.seekTo(Duration(seconds: 3));
//             //                 _videoPlayerController1!.play();
//             //               });
//             //             });

//             //           });
//             //         },
//             //         child: Padding(
//             //           child: Text("Seek To"),
//             //           padding: EdgeInsets.symmetric(vertical: 16.0),
//             //         ),
//             //       ),
//             //     ),
//             //     Expanded(
//             //       child: FlatButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             _chewieController!.dispose();
//             //             _videoPlayerController2!.pause();
//             //             _videoPlayerController2!.seekTo(Duration(seconds: 0));
//             //             _chewieController = ChewieController(
//             //               videoPlayerController: _videoPlayerController1!,
//             //               aspectRatio: 3 / 2,
//             //               autoPlay: true,
//             //               looping: true,
//             //             );
//             //           });
//             //         },
//             //         child: Padding(
//             //           child: Text("Video 1"),
//             //           padding: EdgeInsets.symmetric(vertical: 16.0),
//             //         ),
//             //       ),
//             //     ),
//             //     Expanded(
//             //       child: FlatButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             _chewieController!.dispose();
//             //             _videoPlayerController1!.pause();
//             //             _videoPlayerController1!.seekTo(Duration(seconds: 0));
//             //             _chewieController = ChewieController(
//             //               videoPlayerController: _videoPlayerController2!,
//             //               aspectRatio: 3 / 2,
//             //               autoPlay: true,
//             //               looping: true,
//             //             );
//             //           });
//             //         },
//             //         child: Padding(
//             //           padding: EdgeInsets.symmetric(vertical: 16.0),
//             //           child: Text("Video 2"),
//             //         ),
//             //       ),
//             //     )
//             //   ],
//             // ),
//             // Row(
//             //   children: <Widget>[
//             //     Expanded(
//             //       child: FlatButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             _platform = TargetPlatform.android;
//             //           });
//             //         },
//             //         child: Padding(
//             //           child: Text("Android controls"),
//             //           padding: EdgeInsets.symmetric(vertical: 16.0),
//             //         ),
//             //       ),
//             //     ),
//             //     Expanded(
//             //       child: FlatButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             _platform = TargetPlatform.iOS;
//             //           });
//             //         },
//             //         child: Padding(
//             //           padding: EdgeInsets.symmetric(vertical: 16.0),
//             //           child: Text("iOS controls"),
//             //         ),
//             //       ),
//             //     )
//             //   ],
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }