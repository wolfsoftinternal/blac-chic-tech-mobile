import 'dart:ui';

import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/my_icons.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
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
                Container(
                  height: 600,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaY:10,sigmaX:10), //SigmaX and Y are just for X and Y directions
                          child: Image.asset(img_giral_crop,width: double.infinity,height: 500.h,fit: BoxFit.fill,) //here you can use any widget you'd like to blur .
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Positioned(
                          bottom: 25.h,
                          child: Container(
                            height: 115.h,
                            margin: EdgeInsets.only(bottom: 30.h,right: 24),
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

                                Image.asset(iconly_light_heart,width: 25,height: 25,),
                                SizedBox(height: 25.h,),
                                SvgPicture.asset(icon_share),
                              ],
                            ),
                          ),
                        ),
                      ),
                      /*------ Tool bar ------*/
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
/*---- Center Image -----*/
                      Container(
                        width: double.infinity,
                          margin: EdgeInsets.only(top: 85.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(img_giral_crop,width: 220.w,height: 302.h,fit: BoxFit.fill,),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 24.w),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Positioned(
                            child: Text("FADE",style: TextStyle(
                              fontFamily: helvetica_neu_bold,fontSize: 100.sp,
                              color: orange_ff881a,letterSpacing: -10,
                            ),),
                          ),
                        ),
                      ),
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
                      fontWeight: FontWeight.w700,
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
          ),
        ),
      ),
    );
  }
}
