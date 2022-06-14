import 'dart:math';

import 'package:blackchecktech/Screens/Home/FeatureMenu/View/PastFeaturesScreen.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Styles/my_colors.dart';
import '../controller/FeaturedController.dart';
import 'SearchFeaturesScreen.dart';

class FeaturedMainScreen extends StatefulWidget {
  const FeaturedMainScreen({Key? key}) : super(key: key);

  @override
  _FeaturedMainScreenState createState() => _FeaturedMainScreenState();
}

class _FeaturedMainScreenState extends State<FeaturedMainScreen> {
  FeaturedController featuredController = Get.put(FeaturedController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    featuredController.allFeaturedListApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => featuredController.isDataFetched ==true ?
        featuredController.featuredList.length > 0?Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: featuredController.featuredList[0].image??"",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                        SvgPicture.asset(
                          placeholder,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset(
                          placeholder,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                  ),


                  // Image.asset(
                  //   feature_img_1,
                  //   fit: BoxFit.cover,
                  //   width: double.infinity,
                  //   height: double.infinity,
                  //   alignment: Alignment.center,
                  // ),
                  // OSA UX OF LIVING
                   Center(
                    child: Text(featuredController.featuredList[0].writer_name??"",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w900,
                            fontFamily: "NeueHelvetica",
                            fontStyle: FontStyle.normal,
                            fontSize: 40.0),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      icon_cancel,
                      width: 30.w,
                      height: 30.h,
                      color: white_ffffff,
                    ),

                    // Featured
                    Text("Featured",
                        style: TextStyle(
                            color: white_ffffff,
                            fontWeight: FontWeight.w900,
                            fontFamily: "NeueHelvetica",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.sp),
                        textAlign: TextAlign.left),

                    GestureDetector(
                      child: SvgPicture.asset(
                        search,
                        width: 20.w,
                        height: 20.h,
                        color: white_ffffff,
                      ),
                      onTap: (){
                        Get.to(() => SearchFeaturesScreen());

                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50.w, left: 32.w, right: 32.w),
              child: Container(
                // color: Colors.lightBlueAccent,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Get.to(PastFeaturesScreen(featureList: featuredController.featuredList.value,selectedPosition: 1,));

                        // _controller.previousPage(
                        //     duration: _kDuration, curve: _kCurve);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.rotate(
                              angle: 180 * pi / 180,
                              child: SvgPicture.asset(
                                icon_feature_next_arrow,
                                width: 40,
                                height: 15,
                              )),

                          SizedBox(
                            height: 5.h,
                          ),
                          // READ ARTICLE
                          Text("PAST \nFEATURE",
                              style: TextStyle(
                                  color: white_ffffff,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NeueHelvetica",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 24.sp),
                              textAlign: TextAlign.left)
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        // _controller.nextPage(
                        //     duration: _kDuration, curve: _kCurve);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            icon_feature_next_arrow,
                            width: 40,
                            height: 15,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          // READ ARTICLE
                          Text("READ \nARTICLE",
                              style: TextStyle(
                                  color: white_ffffff,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NeueHelvetica",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 24.sp),
                              textAlign: TextAlign.right)
                        ],
                      ),
                    ),
                    // FlatButton(
                    //   child: Text('Prev'),
                    //   onPressed: () {
                    //     _controller.previousPage(
                    //         duration: _kDuration, curve: _kCurve);
                    //   },
                    // ),
                    // FlatButton(
                    //   child: Text('Next'),
                    //   onPressed: () {
                    //     _controller.nextPage(duration: _kDuration, curve: _kCurve);
                    //   },
                    // )
                  ],
                ),
              ),
            ),
          ],
        ):
        Text('No Data Found'):const Center(child: CircularProgressIndicator()),
      ),
    ));
  }
}
