import 'dart:math';

import 'package:blackchecktech/Screens/Home/FeatureMenu/View/FeaturedScreenSecond.dart';
import 'package:blackchecktech/Screens/Home/FeatureMenu/controller/FeaturedController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/UIScreen/PastFeature1.dart';
import 'package:blackchecktech/UIScreen/PastFeature2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/FeaturedListModel.dart';
import 'FeaturedMainScreen.dart';

class PastFeaturesScreen extends StatefulWidget {

  final List<FeaturedList> featureList;

  const PastFeaturesScreen({Key? key,
  required this.featureList
  }) : super(key: key);

  @override
  _PastFeaturesScreenState createState() => _PastFeaturesScreenState();
}

class _PastFeaturesScreenState extends State<PastFeaturesScreen> {
  // final List<Widget> _samplePages = [
  //   const PastFeature1(),
  //   const PastFeature2(),
  // ];
  final _controller = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Flexible(
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.featureList.length,
              itemBuilder: (BuildContext context, int index) {

                if((index % 2) == 0){
                  return PastFeature1(featuredData: widget.featureList[index],);
                }else{
                  return PastFeature2(featuredData: widget.featureList[index],);
                }

              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       SvgPicture.asset(
          //         icon_cancel,
          //         width: 30.w,
          //         height: 30.h,
          //         color: white_ffffff,
          //       ),
          //
          //       // Featured
          //       Text("Featured",
          //           style: TextStyle(
          //               color: white_ffffff,
          //               fontWeight: FontWeight.w900,
          //               fontFamily: "NeueHelvetica",
          //               fontStyle: FontStyle.normal,
          //               fontSize: 20.sp),
          //           textAlign: TextAlign.left),
          //
          //       SvgPicture.asset(
          //         search,
          //         width: 20.w,
          //         height: 20.h,
          //         color: white_ffffff,
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 50.w, left: 32.w, right: 32.w),
          //   child: Container(
          //     // color: Colors.lightBlueAccent,
          //     child: Row(
          //       mainAxisSize: MainAxisSize.max,
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: <Widget>[
          //         GestureDetector(
          //           onTap: () {
          //             _controller.previousPage(
          //                 duration: _kDuration, curve: _kCurve);
          //           },
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Transform.rotate(
          //                   angle: 180 * pi / 180,
          //                   child: SvgPicture.asset(
          //                     icon_feature_next_arrow,
          //                     width: 40,
          //                     height: 15,
          //                   )),
          //
          //               SizedBox(
          //                 height: 5.h,
          //               ),
          //               // READ ARTICLE
          //               Text("PAST \nFEATURE",
          //                   style: TextStyle(
          //                       color: white_ffffff,
          //                       fontWeight: FontWeight.w700,
          //                       fontFamily: "NeueHelvetica",
          //                       fontStyle: FontStyle.normal,
          //                       fontSize: 24.sp),
          //                   textAlign: TextAlign.left)
          //             ],
          //           ),
          //         ),
          //
          //         GestureDetector(
          //           onTap: () {
          //             _controller.nextPage(
          //                 duration: _kDuration, curve: _kCurve);
          //           },
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             crossAxisAlignment: CrossAxisAlignment.end,
          //             children: [
          //               SvgPicture.asset(
          //                 icon_feature_next_arrow,
          //                 width: 40,
          //                 height: 15,
          //               ),
          //               SizedBox(
          //                 height: 5.h,
          //               ),
          //               // READ ARTICLE
          //               Text("READ \nARTICLE",
          //                   style: TextStyle(
          //                       color: white_ffffff,
          //                       fontWeight: FontWeight.w700,
          //                       fontFamily: "NeueHelvetica",
          //                       fontStyle: FontStyle.normal,
          //                       fontSize: 24.sp),
          //                   textAlign: TextAlign.right)
          //             ],
          //           ),
          //         ),
          //         // FlatButton(
          //         //   child: Text('Prev'),
          //         //   onPressed: () {
          //         //     _controller.previousPage(
          //         //         duration: _kDuration, curve: _kCurve);
          //         //   },
          //         // ),
          //         // FlatButton(
          //         //   child: Text('Next'),
          //         //   onPressed: () {
          //         //     _controller.nextPage(duration: _kDuration, curve: _kCurve);
          //         //   },
          //         // )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    ));
  }
}
