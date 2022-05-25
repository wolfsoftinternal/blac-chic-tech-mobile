import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              /*------------- Transactions Layout --------------*/
              Container(
                padding: EdgeInsets.symmetric(vertical:16.h,horizontal: 16.w ),
                margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 25.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                  boxShadow: [
                    BoxShadow(
                      color:
                      Color(0x194343b2).withOpacity(0.15),
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Order ID #1313112131311",style: TextStyle(
                          fontFamily: roboto_regular,fontSize: 11.sp,color: black_121212
                        ),),
                        Text("Dec 16 2021 at 11:00 pm",style: TextStyle(
                          fontFamily: roboto_regular,fontSize: 11.sp,color: grey_aaaaaa
                        ),),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("Event Name",style: TextStyle(
                                fontSize: 12.sp,fontFamily: roboto_regular,color: grey_aaaaaa
                              ),),
                              SizedBox(height: 2.h,),
                              Text("UI Meetup",style: TextStyle(
                                  fontSize: 16.sp,fontFamily: roboto_bold,color: black_121212
                              ),),

                            ],
                          ),
                        ),

                        Text("\$1,100",style: TextStyle(
                            fontSize: 16.sp,fontFamily: roboto_bold,color: parrot_1ad04d
                        ),),

                      ],
                    )
                  ],
                ),
              ),
              /*------------- Payouts Layout --------------*/
              Container(
                padding: EdgeInsets.symmetric(vertical:16.h,horizontal: 16.w ),
                margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 25.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                  boxShadow: [
                    BoxShadow(
                      color:
                      Color(0x194343b2).withOpacity(0.15),
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Account",style: TextStyle(
                            fontFamily: roboto_regular,fontSize: 11.sp,color: grey_aaaaaa
                          ),),
                          SizedBox(height: 2.h,),

                          Text("**** 1231",style: TextStyle(
                              fontFamily: roboto_bold,fontSize: 14.sp,color: black_121212
                          ),),
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 2.h,),
                          Text("On",style: TextStyle(
                            fontFamily: roboto_regular,fontSize: 11.sp,color: grey_aaaaaa
                          ),),
                          SizedBox(height: 2.h,),

                          Text("Dec 16 2021 at 11:00 pm",style: TextStyle(
                              fontFamily: roboto_regular,fontSize: 11.sp,color: black_121212
                          ),),
                        ],
                      ),
                      flex: 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        Text("Requested",style: TextStyle(
                          fontFamily: roboto_regular,fontSize: 11.sp,color: orange_ff881a
                        ),),
                        SizedBox(height: 2.h,),

                        Text("\$1000",style: TextStyle(
                            fontFamily: roboto_bold,fontSize: 16.sp,color: black_121212
                        ),),
                      ],
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
