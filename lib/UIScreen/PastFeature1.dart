import 'dart:ui';

import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readmore/readmore.dart';

import '../Screens/Home/FeatureMenu/View/SearchFeaturesScreen.dart';
import '../Screens/Home/FeatureMenu/controller/FeaturedController.dart';
import '../Screens/Home/FeatureMenu/model/FeaturedListModel.dart';
import '../Styles/my_strings.dart';

class PastFeature1 extends StatefulWidget {
  final int selectedPositionFromPrevious;

  const PastFeature1({Key? key,
    required this.selectedPositionFromPrevious
   }) : super(key: key);

  @override
  _PastFeature1State createState() => _PastFeature1State();
}

class _PastFeature1State extends State<PastFeature1> {

  FeaturedController featuredController = Get.put(FeaturedController());
  // Updated

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
    () =>SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 500.h,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(img_giral_crop, fit: BoxFit.cover),
                    ClipRRect(
                      // Clip it cleanly.
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*------ Tool bar ------*/
                            Container(
                              margin: EdgeInsets.only(
                                  top: 45.h, left: 24.w, right: 24.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: SvgPicture.asset(
                                      icon_back_black_arrow,
                                      color: Colors.white,
                                      height: 24.h,
                                      width: 24.h,
                                    ),
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Text(
                                    "Past Features",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontFamily: helvetica_neu_bold),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Get.to(() => SearchFeaturesScreen());
                                    },
                                    child: SvgPicture.asset(
                                      search,
                                      color: Colors.white,
                                      height: 24.h,
                                      width: 24.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /*---- Center Image -----*/
                            Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 35.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: featuredController.featuredList[widget.selectedPositionFromPrevious].image??"",
                                      fit: BoxFit.cover,
                                      width: 220.w,
                                      height: 302.h,
                                      alignment: Alignment.center,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                          SvgPicture.asset(
                                            placeholder,
                                            width: 220.w,
                                            height: 302.h,
                                            fit: BoxFit.cover,
                                          ),
                                      errorWidget: (context, url, error) =>
                                          SvgPicture.asset(
                                            placeholder,
                                            width: 220.w,
                                            height: 302.h,
                                            fit: BoxFit.cover,
                                          ),
                                    ),

                                    // Image.asset(
                                    //   img_giral_crop,
                                    //   width: 220.w,
                                    //   height: 302.h,
                                    //   fit: BoxFit.fill,
                                    // ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0, -15, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 24.w, left: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              featuredController.featuredList[widget.selectedPositionFromPrevious].writer_name??"",
                              style: TextStyle(
                                fontFamily: helvetica_neu_bold,
                                fontSize: 100.sp,
                                color: orange_ff881a,
                                letterSpacing: -10,
                                height: 0.8,
                              ),
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(0, -40, 0),
                            height: 115.h,
                            padding: EdgeInsets.symmetric(horizontal: 17.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0x331c2535), Color(0x4d04080f)],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print("share clicked");
                                  },
                                  child: SvgPicture.asset(
                                    icon_share,
                                    width: 25.w,
                                    height: 25.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (featuredController
                                        .featuredList[widget
                                        .selectedPositionFromPrevious]
                                        .is_like ==
                                        0) {
                                      featuredController.likeFeatureAPI(
                                          context,
                                          featuredController
                                              .featuredList[widget
                                              .selectedPositionFromPrevious]
                                              .id,
                                          widget.selectedPositionFromPrevious);
                                    } else {
                                      featuredController.DisLikeFeatureAPI(
                                          context,
                                          featuredController
                                              .featuredList[widget
                                              .selectedPositionFromPrevious]
                                              .id,
                                          widget.selectedPositionFromPrevious);
                                    }
                                  },
                                  child: featuredController
                                      .featuredList[widget
                                      .selectedPositionFromPrevious]
                                      .is_like ==
                                      0
                                      ? SvgPicture.asset(
                                    icon_heart,
                                    width: 25.w,
                                    height: 25.h,
                                  )
                                      : SvgPicture.asset(
                                    icon_heart,
                                    width: 25.w,
                                    height: 25.h,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin:
                          EdgeInsets.only(top: 2.h, left: 24.w, right: 24.w),
                      child: Text(
                        featuredController.featuredList[widget.selectedPositionFromPrevious].title??"",
                        style: TextStyle(
                            fontFamily: helvetica_neu_bold,
                            fontSize: 24.sp,
                            color: black_121212),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 12.h, left: 24.w, right: 24.w),
                      child: Text(
                        featuredController.featuredList[widget.selectedPositionFromPrevious].sub_text??"",
                        style: TextStyle(
                            fontFamily: poppins_BoldItalic,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                            color: orange_ff881a),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
                      child: ReadMoreText(
                        featuredController.featuredList[widget.selectedPositionFromPrevious].description??"",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: opcity_black_B3121212,
                            fontFamily: roboto_medium),
                        trimLines: 3,
                        // trimLength: 10,
                        // colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'See full article',
                        trimExpandedText: 'See less article',
                        moreStyle: TextStyle(
                            fontSize: 12.sp,
                            color: black_121212,
                            fontFamily: helvetica_neu_bold),
                        lessStyle: TextStyle(
                            fontSize: 12.sp,
                            color: black_121212,
                            fontFamily: helvetica_neu_bold),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 24.h,left: 24.w,right: 24.w),
                    //   child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel vitae malesuada faucibus vitae cursus sed ultricies ",
                    //     style: TextStyle(
                    //         height: 1.3.h,
                    //         fontWeight: FontWeight.w500,
                    //         fontFamily: roboto_medium,fontSize: 12.sp,
                    //         color:opcity_black_B3121212
                    //     ),),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 24.w,top: 10.h,bottom: 10.h),
                    //   child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Text("See full article",
                    //         style: TextStyle(
                    //             fontFamily: helvetica_neu_bold,fontSize: 12.sp,
                    //             color:black_121212
                    //         ),),
                    //       SizedBox(width: 6.w,),
                    //       SvgPicture.asset(icon_next_arrow,color: black_121212,)
                    //     ],),
                    // ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
