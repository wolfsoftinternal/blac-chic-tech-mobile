import 'package:blackchecktech/Screens/Home/FeatureMenu/View/SearchFeaturesScreen.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class PastFeatureDetail extends StatefulWidget {
  final title;
  final theme;
  final url;
  PastFeatureDetail({Key? key, this.title, this.theme, this.url}) : super(key: key);

  @override
  State<PastFeatureDetail> createState() => _PastFeatureDetailState();
}

class _PastFeatureDetailState extends State<PastFeatureDetail> {
  @override
  Widget build(BuildContext context) {
    InAppWebViewController? _webViewController;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontFamily: helvetica_neu_bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 24.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    Get.off(SearchFeaturesScreen());
                  });
                },
                child: SvgPicture.asset(
                  icon_past_search,
                  color: Colors.black,
                  height: 20.h,
                  width: 20.h,
                ),
              ),
            ),
          ],
          leading: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Icon(Icons.arrow_back_ios_new_rounded, color: black),
            ),
            onTap: () {
              Navigator.pop(context);
              setState(() {});
            },
          ),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
            child: Container(
              child: InAppWebView(
                  initialUrlRequest:
                      URLRequest(url: Uri.parse(widget.url)),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      mediaPlaybackRequiresUserGesture: false,
                    ),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _webViewController = controller;
                  },
                  androidOnPermissionRequest:
                      (InAppWebViewController controller, String origin,
                          List<String> resources) async {
                    return PermissionRequestResponse(
                        resources: resources,
                        action: PermissionRequestResponseAction.GRANT);
                  }),
            ),
          ),
        ])));
    // flutterWebViewPlugin.onUrlChanged.listen((String url) {});
    // return Scaffold(
    //   body: WebviewScaffold(
    //     url: 'https://window.arian.co.ir',
    //     appBar: AppBar(
    //       backgroundColor: white,
    //       elevation: 0,
    //       centerTitle: true,
    //       title: Text(
    //         widget.title,
    //         style: TextStyle(
    //           fontSize: 20.sp,
    //           color: Colors.black,
    //           fontFamily: helvetica_neu_bold
    //         ),
    //       ),
    //       actions: [
    //        Padding(
    //          padding: const EdgeInsets.only(left: 8.0, right: 24.0),
    //          child: InkWell(
    //            onTap: () {
    //              setState(() {
    //                flutterWebViewPlugin.close();
    //                Get.off(SearchFeaturesScreen());
    //              });
    //            },
    //            child: SvgPicture.asset(
    //              icon_past_search,
    //              color: Colors.black,
    //              height: 20.h,
    //              width: 20.h,
    //            ),
    //          ),
    //        ),
    //       ],
    //       leading: GestureDetector(
    //         child: Padding(
    //           padding: const EdgeInsets.only(left: 12.0),
    //           child: Icon(Icons.arrow_back_ios_new_rounded, color: black),
    //         ),
    //         onTap: () {
    //           Navigator.pop(context);
    //           flutterWebViewPlugin.close();
    //           setState(() {});
    //         },
    //       ),
    //     ),
    //     // withZoom: true,
    //     withLocalStorage: true,
    //     hidden: true,
    //     initialChild: Container(
    //       color: white,
    //       child: const Center(
    //         child: CircularProgressIndicator(color: black, strokeWidth: 2,)
    //       ),
    //     ),
    //   ),
    // );
  }
}


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }

// class PastFeatureDetail extends StatefulWidget {
//   @override
//   _PastFeatureDetailState createState() => new _PastFeatureDetailState();
// }

// class _PastFeatureDetailState extends State<PastFeatureDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: InAppWebViewPage()
//     );
//   }
// }

// class InAppWebViewPage extends StatefulWidget {
//   @override
//   _InAppWebViewPageState createState() => new _InAppWebViewPageState();
// }

// class _InAppWebViewPageState extends State<InAppWebViewPage> {
//   InAppWebViewController? _webViewController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text("InAppWebView")
//       ),
//       body: Container(
//         child: Column(children: <Widget>[
//           Expanded(
//             child: Container(
//               child: InAppWebView(
//                 initialUrlRequest:
//                         URLRequest(url: Uri.parse("https://www.google.com")),
//                 initialOptions: InAppWebViewGroupOptions(
//                   crossPlatform: InAppWebViewOptions(
//                     mediaPlaybackRequiresUserGesture: false,
//                   ),
//                 ),
//                 onWebViewCreated: (InAppWebViewController controller) {
//                   _webViewController = controller;
//                 },
//                 androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
//                   return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
//                 }
//               ),
//             ),
//           ),
//         ])
//       )
//     );
//   }
// }
