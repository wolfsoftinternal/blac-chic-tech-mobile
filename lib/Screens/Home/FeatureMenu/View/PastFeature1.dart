import 'dart:ui';

import 'package:blackchecktech/Screens/Home/FeatureMenu/View/PastFeatureDetail.dart';
import 'package:blackchecktech/Screens/Home/FeatureMenu/View/SearchFeaturesScreen.dart';
import 'package:blackchecktech/Screens/Home/FeatureMenu/controller/FeaturedController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';

class PastFeature1 extends StatefulWidget {
  final int selectedPositionFromPrevious;

  const PastFeature1({Key? key, required this.selectedPositionFromPrevious})
      : super(key: key);

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
        body: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: featuredController
                            .featuredList[
                                widget.selectedPositionFromPrevious]
                            .image ??
                        "",
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
                                top: 60.h, left: 35.w, right: 35.w),
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
                                  onTap: () {
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
                                  onTap: () {
                                    Get.to(() => SearchFeaturesScreen());
                                  },
                                  child: SvgPicture.asset(
                                    icon_past_search,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: featuredController
                                            .featuredList[widget
                                                .selectedPositionFromPrevious]
                                            .image ??
                                        "",
                                    fit: BoxFit.cover,
                                    width: 220.w,
                                    height: 302.h,
                                    alignment: Alignment.center,
                                    progressIndicatorBuilder: (context,
                                            url, downloadProgress) =>
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
                  Positioned(
                    bottom: -50,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 24.w,
                        ),
                        child: Container(
                          //   transform: Matrix4.translationValues(0, -35, 0),
                          height: 96,
                          padding: EdgeInsets.symmetric(horizontal: 17.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0x331c2535),
                                Color(0x4d04080f)
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Share.share(
                                    'Hey checkout this feature' +
                                        featuredController
                                            .featuredList[widget
                                                .selectedPositionFromPrevious]
                                            .link!,
                                  );
                                },
                                child: SvgPicture.asset(
                                  icon_share,
                                  width: 22.w,
                                  height: 22.h,
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
                                        widget
                                            .selectedPositionFromPrevious);
                                  } else {
                                    featuredController.DisLikeFeatureAPI(
                                        context,
                                        featuredController
                                            .featuredList[widget
                                                .selectedPositionFromPrevious]
                                            .id,
                                        widget
                                            .selectedPositionFromPrevious);
                                  }
                                },
                                child: featuredController
                                            .featuredList[widget
                                                .selectedPositionFromPrevious]
                                            .is_like ==
                                        0
                                    ? SvgPicture.asset(
                                        icon_heart,
                                        width: 22.w,
                                        height: 22.h,
                                      )
                                    : SvgPicture.asset(
                                        icon_heart,
                                        width: 22.w,
                                        height: 22.h,
                                        color: Colors.red,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onVerticalDragStart: (val){
                // Navigator.of(context).push(_createRoute());
              },
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 500.h,
                color: white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 24.w, left: 24.w),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                transform: Matrix4.translationValues(0, -10, 0),
                                child: Text(
                                  featuredController
                                          .featuredList[widget
                                              .selectedPositionFromPrevious]
                                          .writer_name ??
                                      "",
                                  style: TextStyle(
                                    fontFamily: interExtraBold,
                                    fontSize: 100.sp,
                                    color: orange_ff881a,
                                    letterSpacing: -10,
                                    height: 0.8,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // transform: Matrix4.translationValues(0, -35, 0),
                              height: 45,
                              padding: EdgeInsets.symmetric(horizontal: 17.5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(4.r),
                                    bottomLeft: Radius.circular(4.r)),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0x331c2535),
                                    Color(0x4d04080f)
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     Share.share(
                                  //     'Hey checkout this feature' +
                                  //       featuredController.featuredList[widget.selectedPositionFromPrevious].link!,
                                  //     );
                                  //   },
                                  //   child: SvgPicture.asset(
                                  //     icon_share,
                                  //     width: 22.w,
                                  //     height: 22.h,
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 25.h,
                                  // ),
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
                                            widget
                                                .selectedPositionFromPrevious);
                                      } else {
                                        featuredController.DisLikeFeatureAPI(
                                            context,
                                            featuredController
                                                .featuredList[widget
                                                    .selectedPositionFromPrevious]
                                                .id,
                                            widget
                                                .selectedPositionFromPrevious);
                                      }
                                    },
                                    child: featuredController
                                                .featuredList[widget
                                                    .selectedPositionFromPrevious]
                                                .is_like ==
                                            0
                                        ? SvgPicture.asset(
                                            icon_heart,
                                            width: 22.w,
                                            height: 22.h,
                                          )
                                        : SvgPicture.asset(
                                            icon_heart,
                                            width: 22.w,
                                            height: 22.h,
                                            color: Colors.red,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (OverscrollIndicatorNotification overscroll) {
                        overscroll.disallowGlow();
                        return true;
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 2.h, left: 24.w, right: 24.w),
                              child: Text(
                                featuredController
                                        .featuredList[
                                            widget.selectedPositionFromPrevious]
                                        .title ??
                                    "",
                                style: TextStyle(
                                    fontFamily: interBold,
                                    fontSize: 24.sp,
                                    color: black_121212),
                              ),
                            ),
                            Container(
                          margin:
                              EdgeInsets.only(top: 12.h, left: 24.w, right: 24.w),
                          child: Text(
                            featuredController
                                    .featuredList[
                                        widget.selectedPositionFromPrevious]
                                    .sub_text ??
                                "",
                            style: TextStyle(
                                fontFamily: interExtraBoldItalic,
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
                            featuredController
                                    .featuredList[
                                        widget.selectedPositionFromPrevious]
                                    .description ??
                                "",
                            // "DAEsdef\nDFSadds\ndgfnd\nqwrewr\noekrkfr\ndfjrgng\nasdfsfs\nosierfj\nikrsdfjr\naesdfdsf",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: opcity_black_B3121212,
                                height: 1.4,
                                fontFamily: interSemiBold),
                            trimLines: 3,
                            // trimLength: 10,
                            // colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '\nSee Full Article ->',
                            trimExpandedText: '\nSee Less Article',
                            moreStyle: TextStyle(
                                fontSize: 12.sp,
                                color: black_121212,
                                fontFamily: interExtraBold),
                            lessStyle: TextStyle(
                                fontSize: 12.sp,
                                color: black_121212,
                                fontFamily: interExtraBold),
                          ),
                        ),
                          ],
                        ),
                      ),
                )),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(_createRoute());
                          },
                          child: Column(
                            children: [
                              Icon(Icons.keyboard_arrow_up_rounded, color: grey_3f3f3f,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: grey_808080,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 10.h, bottom: 10.h),
                                  child: setHelveticaMedium('Read More', 14.sp, white, FontWeight.w500, FontStyle.normal),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
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
              ),
            ),
            
          ],
        )),
      ),
    );
  }

  Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) => PastFeatureDetail(title: featuredController
                                                .featuredList[widget
                                                    .selectedPositionFromPrevious]
                                                .writer_name, theme: 'white'),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
  
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}


