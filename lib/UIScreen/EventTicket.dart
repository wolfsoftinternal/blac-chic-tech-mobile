import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Layout/MySeparator.dart';


class EventTicket extends StatefulWidget {
  const EventTicket({Key? key}) : super(key: key);

  @override
  _EventTicketState createState() => _EventTicketState();
}

class _EventTicketState extends State<EventTicket> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xfff5f5f5),
          body: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 40.h,bottom: 24.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(icon_cancel,width: 26.w,height: 26.h,),

                      // Your ticket was successfully purchased.
                      Padding(
                        padding: const EdgeInsets.only(left: 50,right: 50),
                        child: Text(
                            "Your ticket was successfully purchased.",
                            style:  TextStyle(
                                color:  black_121212,
                                fontWeight: FontWeight.w900,
                                fontFamily: helveticaNeue,
                                fontStyle:  FontStyle.normal,
                                fontSize: 20.sp
                            ),
                            textAlign: TextAlign.center
                        ),
                      ),
                      SizedBox(height: 16.h,),

                      // Your purchase was successfully processed and has been sent to your email.
                      Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: Text(
                            "Your purchase was successfully processed and has been sent to your email.",
                            style:  TextStyle(
                                color:  const Color(0xff5d5d5d),
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeue,
                                fontStyle:  FontStyle.normal,
                                fontSize: 14.sp
                            ),
                            textAlign: TextAlign.center
                        ),
                      ),

                      SizedBox(height: 32.h,),

                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: white_ffffff,
                              boxShadow: [BoxShadow(
                                  color:  Colors.grey,
                                  offset: Offset(30,0),
                                  blurRadius: 60,
                                  spreadRadius: 5
                              )] ,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Image.asset(setting_girl_img,width: double.infinity,height: 203.h,fit: BoxFit.fill,),

                                      SizedBox(height: 24.h,),

                                      // Startup Bootcamp 2022
                                      Text(
                                          "Startup Bootcamp 2022",
                                          style:  TextStyle(
                                              color:  black_121212,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: helveticaNeue,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 18.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),

                                      SizedBox(height: 16.h,),

                                      Container(
                                        decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius: BorderRadius.circular(3),
                                          border: Border.all(
                                            width: 1,
                                            color: const Color(0xfff5f5f5)
                                          )
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex:1,
                                              child: Padding(
                                                padding:  const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    // NAME
                                                    Text(
                                                        "NAME",
                                                        style:  TextStyle(
                                                            color:  grey_aaaaaa,
                                                            fontWeight: FontWeight.w700,
                                                            fontFamily: helveticaNeue,
                                                            fontStyle:  FontStyle.normal,
                                                            fontSize: 11.sp
                                                        ),
                                                        textAlign: TextAlign.left
                                                    ),

                                                    // Fade Ogunro
                                                    Text(
                                                        "Fade Ogunro",
                                                        style:  TextStyle(
                                                            color:  black_121212,
                                                            fontWeight: FontWeight.w700,
                                                            fontFamily: helveticaNeue,
                                                            fontStyle:  FontStyle.normal,
                                                            fontSize: 12.sp
                                                        ),
                                                        textAlign: TextAlign.left
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),

                                            Container(
                                                width:1,
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                    color:  view_line_f4f6f6
                                                )
                                            ),

                                            Expanded(
                                              flex:1,
                                              child: Padding(
                                                padding:  const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    // NAME
                                                    Text(
                                                        "DATE",
                                                        style:  TextStyle(
                                                            color:  grey_aaaaaa,
                                                            fontWeight: FontWeight.w700,
                                                            fontFamily: helveticaNeue,
                                                            fontStyle:  FontStyle.normal,
                                                            fontSize: 11.sp
                                                        ),
                                                        textAlign: TextAlign.left
                                                    ),

                                                    // Fade Ogunro
                                                    Text(
                                                        "24-26 Dec",
                                                        style:  TextStyle(
                                                            color:  black_121212,
                                                            fontWeight: FontWeight.w700,
                                                            fontFamily: helveticaNeue,
                                                            fontStyle:  FontStyle.normal,
                                                            fontSize: 12.sp
                                                        ),
                                                        textAlign: TextAlign.left
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),

                                            Container(
                                                width:1,
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                    color:  view_line_f4f6f6
                                                )
                                            ),

                                            Expanded(
                                              flex:1,
                                              child: Padding(
                                                padding:  const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    // NAME
                                                    Text(
                                                        "START TIME",
                                                        style:  TextStyle(
                                                            color:  grey_aaaaaa,
                                                            fontWeight: FontWeight.w700,
                                                            fontFamily: helveticaNeue,
                                                            fontStyle:  FontStyle.normal,
                                                            fontSize: 11.sp
                                                        ),
                                                        textAlign: TextAlign.left
                                                    ),

                                                    // Fade Ogunro
                                                    Text(
                                                        "14:00PM",
                                                        style:  TextStyle(
                                                            color:  black_121212,
                                                            fontWeight: FontWeight.w700,
                                                            fontFamily: helveticaNeue,
                                                            fontStyle:  FontStyle.normal,
                                                            fontSize: 12.sp
                                                        ),
                                                        textAlign: TextAlign.left
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 70.h,),

                                      // BARCODE TICKET
                                      Text(
                                          "BARCODE TICKET",
                                          style:  TextStyle(
                                              color:  const Color(0xffaaaaaa),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: helveticaNeue,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 8.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                      SizedBox(height: 12.h,),
                                      Image.asset(barcode,width: double.infinity,height: 70.h,fit: BoxFit.fill,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Padding(
                            padding: EdgeInsets.only(bottom: 125),
                            child: MySeparator(color: Color(0xffeaecec)),
                          ),
                          Positioned(
                              left: -25,
                              child: Padding(
                                padding:  const EdgeInsets.only(bottom: 100),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      color: Color(0xfff5f5f5),
                                      shape: BoxShape.circle
                                  ),
                                ),
                              )),
                          Positioned(
                              right: -25,
                              child: Padding(
                                padding:  const EdgeInsets.only(bottom: 100),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      color: Color(0xfff5f5f5),
                                      shape: BoxShape.circle
                                  ),
                                ),
                              )),
                        ],
                      )

                    ],
                  ),
                ),
              ),

            ],
          ),
        ));
  }




}


