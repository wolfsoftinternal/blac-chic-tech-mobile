import 'dart:ui';

import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/VideoCommentsModel.dart';
import '../Styles/my_colors.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  bool Bg1 = true;
  bool Bg2 = false;
  bool tv1 = true;
  bool tv2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 24.w,right: 24.w,top: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Bg1 = true;
                            Bg2 = false;
                            tv1 = true;
                            tv2 = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: BoxDecoration(
                            color:Bg1?black_121212: grey_f5f5f5,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text("Transactions",style: TextStyle(
                                fontSize: 16.sp,color: tv1?Colors.white: black_121212,
                                fontFamily: roboto_bold
                            ),),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 16.w,),

                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Bg1 = false;
                            Bg2 = true;
                            tv1 = false;
                            tv2 = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          decoration: BoxDecoration(
                            color:Bg2?black_121212: grey_f5f5f5,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text("Payouts",style: TextStyle(
                                fontSize: 16.sp,color:tv2 ?Colors.white: black_121212,
                                fontFamily: roboto_bold
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaY:10,sigmaX:10), //SigmaX and Y are just for X and Y directions
                  child: Image.asset(img_girl,width: double.infinity,height: 200.h,fit: BoxFit.fill,) //here you can use any widget you'd like to blur .
              ),
            ],
          ),
        ),
      ),
    );
  }
}