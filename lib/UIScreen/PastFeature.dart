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

  // Updated

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:Stack(

            children: [
              Container(
                height: 500,
                child: Stack(
                  children: [
                    ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaY:10,sigmaX:10), //SigmaX and Y are just for X and Y directions
                        child: Image.asset(img_giral_crop,width: double.infinity,height: 500.h,fit: BoxFit.cover,) //here you can use any widget you'd like to blur .
                    ),
                    /*------ Tool bar ------*/
                    Container(
                      margin: EdgeInsets.only(top: 35.h,left: 24.w,right: 24.w),
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
                    /*---- Center Image -----*/
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 100.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(img_giral_crop,width: 220.w,height: 302.h,fit: BoxFit.fill,),
                          ],
                        )),
                  ],
                ),
              ),


              Container(
                // margin: EdgeInsets.only(top: 488.h),
                transform: Matrix4.translationValues(0,475, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      margin: EdgeInsets.only(right: 24,left: 24),
                      transform: Matrix4.translationValues(0, -5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text("FADE",style: TextStyle(
                              fontFamily: helvetica_neu_bold,fontSize: 100.sp,
                              color: orange_ff881a,letterSpacing: -10,
                            ),),
                          ),
                          Container(
                            transform: Matrix4.translationValues(0, -30, 0),
                            height: 115.h,
                            padding: EdgeInsets.symmetric(horizontal: 17.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0x331c2535),
                                  Color(0x4d04080f)
                                ],
                                stops: [5.0, 5.0],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(iconly_light_heart,width: 25,height: 25,),
                                SizedBox(height: 25.h,),
                                SvgPicture.asset(icon_share,width: 25,height: 25,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10.h,left: 24.w,right: 24.w),
                      child: Text("On Growth Hacking Life , Love & Bookings Africa",style: TextStyle(
                          fontFamily: helvetica_neu_bold,fontSize: 24.sp,
                          color: black_121212
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12.h,left: 24.w,right: 24.w),
                      child: Text("123 Fade Ogunro - CEO Bookings Africa",style: TextStyle(
                          fontFamily: poppins_BoldItalic,fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          color: orange_ff881a
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24.h,left: 24.w,right: 24.w),
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel vitae malesuada faucibus vitae cursus sed ultricies ",
                        style: TextStyle(
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            fontFamily: roboto_medium,fontSize: 12.sp,
                            color:opcity_black_B3121212
                        ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 24.w,top: 15.h,bottom: 10.h),
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
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
