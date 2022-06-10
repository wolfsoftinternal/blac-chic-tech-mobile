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
  final int selectedPosition;




  const PastFeaturesScreen({Key? key,
  required this.featureList,
    required this.selectedPosition
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
  var isSet = false;

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
                  return PastFeature1(featuredData: widget.featureList[index], allFeatures: widget.featureList);
                }else{
                  return PastFeature2(featuredData: widget.featureList[index], allFeatures: widget.featureList);
                }

              },
            ),
          ),

        ],
      ),
    ));
  }
}
