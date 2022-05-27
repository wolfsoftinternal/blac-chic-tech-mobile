import 'dart:ui';

import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class PastFeature extends StatefulWidget {
  const PastFeature({Key? key}) : super(key: key);

  @override
  _PastFeatureState createState() => _PastFeatureState();
}

class _PastFeatureState extends State<PastFeature> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaY:10,sigmaX:10), //SigmaX and Y are just for X and Y directions
                        child: Image.asset(img_girl,width: double.infinity,height: 500.h,fit: BoxFit.fill,) //here you can use any widget you'd like to blur .
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.h,left: 24.w,right: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(icon_back_black_arrow,color: Colors.white,height: 24.h,width: 24.h,),
                          Text("Past Features",style: TextStyle(
                              fontSize: 20.sp,color: Colors.white,fontFamily: helvetica_neu_bold
                          ),),
                          SvgPicture.asset(search,color: Colors.white,height: 24.h,width: 24.h,),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 100.h),
                        child: Center(child: Image.asset(setting_girl_img,width: 220.w,height: 302.h,fit: BoxFit.fill,))),
                  ],
                ),

                Container(
                  transform: Matrix4.translationValues(0, -55, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 24.w,right: 24.w,),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text("FADE",style: TextStyle(
                                    fontFamily: helvetica_neu_bold,fontSize: 100.sp,
                                    color: orange_ff881a,letterSpacing: -10,
                                ),),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 30.h),
                              padding: EdgeInsets.symmetric(vertical:20.h,horizontal: 17.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0x331c2535),
                                    Color(0x4d04080f)
                                  ],
                                  stops: [0.0, 5.0],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SvgPicture.asset(icon_light_heart),
                                  SizedBox(height: 35.h,),
                                  SvgPicture.asset(icon_share),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 0.h,left: 24.w,right: 24.w),
                        child: Text("On Growth Hacking Life , Love & Bookings Africa",style: TextStyle(
                            fontFamily: helvetica_neu_bold,fontSize: 24.sp,
                            color: black_121212
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12.h,left: 24.w,right: 24.w),
                        child: Text("Fade Ogunro - CEO Bookings Africa",style: TextStyle(
                            fontFamily: poppins_BoldItalic,fontSize: 12.sp,
                            color: orange_ff881a
                        ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24.h,left: 24.w,right: 24.w),
                        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel vitae malesuada faucibus vitae cursus sed ultricies ",
                          style: TextStyle(
                            height: 1.3,
                              fontFamily: roboto_medium,fontSize: 12.sp,
                              color:opcity_black_B3121212
                          ),),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24.w,top: 15.h,bottom: 0.h),
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("See full article",
                              style: TextStyle(
                                  fontFamily: helvetica_neu_bold,fontSize: 12.sp,
                                  color:black_121212
                              ),),
                            SizedBox(width: 6.w,),
                            SvgPicture.asset(icon_next_arrow,color: black_121212,)
                          ],),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
