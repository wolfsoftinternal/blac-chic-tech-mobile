import 'dart:math';

import 'package:blackchecktech/Screens/Home/FeatureMenu/View/FeaturedScreenSecond.dart';
import 'package:blackchecktech/Screens/Home/FeatureMenu/View/PastFeature1.dart';
import 'package:blackchecktech/Screens/Home/FeatureMenu/View/PastFeature2.dart';
import 'package:blackchecktech/Screens/Home/FeatureMenu/View/transformer.dart';
import 'package:blackchecktech/Screens/Home/FeatureMenu/controller/FeaturedController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:transformer_page_view/transformer_page_view.dart';
// import 'package:transformer_page_view/transformer_page_view.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            // pageController: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.featureList.length,
            // loop: false,
            // curve: Curves.easeInBack,
            // transformer: transformers[1],
            itemBuilder: (BuildContext context, int index) {
            
              if(!isSet){
                isSet = true;
                return PastFeature1(selectedPositionFromPrevious: widget.selectedPosition);
              }else{
                if((index % 2) == 0){
                  print('past 1');
                  return PastFeature1(selectedPositionFromPrevious: index);
                }else{
                  print('past 2');
                  return PastFeature2(selectedPositionFromPrevious: index);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
