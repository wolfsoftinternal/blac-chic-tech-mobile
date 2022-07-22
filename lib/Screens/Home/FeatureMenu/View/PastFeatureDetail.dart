import 'package:blackchecktech/Screens/Home/FeatureMenu/View/SearchFeaturesScreen.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

class PastFeatureDetail extends StatefulWidget {
  final title;
  final theme;
  PastFeatureDetail({Key? key, this.title, this.theme}) : super(key: key);

  @override
  State<PastFeatureDetail> createState() => _PastFeatureDetailState();
}

class _PastFeatureDetailState extends State<PastFeatureDetail> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    flutterWebViewPlugin.onUrlChanged.listen((String url) {});
    return Scaffold(
      body: WebviewScaffold(
        url: 'https://www.google.com',
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
              fontFamily: helvetica_neu_bold
            ),
          ),
          actions: [ 
           Padding(
             padding: const EdgeInsets.only(left: 8.0, right: 8.0),
             child: InkWell(
               onTap: () {
                 setState(() {
                   flutterWebViewPlugin.close();
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
            child: Icon(Icons.arrow_back_ios_new_rounded, color: black),
            onTap: () {
              Navigator.pop(context);
              flutterWebViewPlugin.close();
              setState(() {});
            },
          ),
        ),
        // withZoom: true,
        withLocalStorage: true,
        hidden: true,
        initialChild: Container(
          color: white,
          child: const Center(
            child: CircularProgressIndicator(color: black, strokeWidth: 2,)
          ),
        ),
      ),
    );
  }
}