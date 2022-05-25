import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';


class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  bool status = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: ToolbarLocation(context,"SETTINGS","assets/images/location_icon.png"),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 44.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffc4c4c4),
                                  spreadRadius: 2,
                                  blurRadius: 15,
                                  offset: Offset(-2, 7),
                                ),
                              ],
                            ),
                              child: Image.asset(setting_girl_img,width: 105.w,height: 143.h,fit: BoxFit.fill,)),
                          SizedBox(width: 24.w,),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Fade Ogunro
                                Row(
                                  children: [
                                    Text(
                                        "Fade Ogunro",
                                        style:  TextStyle(
                                            color:   black_121212,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: "NeueHelvetica",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 18.sp
                                        ),
                                        textAlign: TextAlign.left
                                    ),
                                    SvgPicture.asset(icon_tick_blue,width: 22.w,height: 22.w,)
                                  ],
                                ),
                                SizedBox(height: 10.h,),
                                // fadeogunro@gmail.com
                                Text(
                                    "fadeogunro@gmail.com",
                                    style:  TextStyle(
                                        color:  const Color(0xff3f3f3f),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NeueHelvetica",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                SizedBox(height: 16.h,),
                                Row(
                                  children: [
                                    SvgPicture.asset(icon_location_yellow,width: 12.w,height: 12.h,),
                                    // Edinburgh, United Kingdom
                                    Text(
                                        "Edinburgh, United Kingdom",
                                        style:  TextStyle(
                                            color: grey_aaaaaa,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "NeueHelvetica",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 10.sp
                                        ),
                                        textAlign: TextAlign.left
                                    )
                                  ],
                                ),
                                SizedBox(height: 25.h,),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0x80f5f5f5),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xfff5f5f5)
                                    )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(icon_show,width: 12.w,height: 12.h,),
                                        SizedBox(width: 5.w,),
                                        // Preview profile
                                        Text(
                                            "Preview profile",
                                            style:  TextStyle(
                                                color:  const Color(0xff121212),
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "NeueHelvetica",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 14.sp
                                            ),
                                            textAlign: TextAlign.left
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 24.h,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff1c2535),
                                Color(0xff04080f),
                              ],
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(icon_edit_square,width: 20.w,height: 20.h,),
                              SizedBox(width: 8.w,),
                              // Edit Profile
                              Text(
                                  "Edit Profile",
                                  style:  TextStyle(
                                      color:  white_ffffff,

                                      fontFamily: "NeueHelvetica",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 16.sp
                                  ),
                                  textAlign: TextAlign.left
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h,),
                    ],
                  ),
                ),

                // Rectangle 353
                Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(
                        color:  view_line_f4f6f6
                    )
                ),


                Padding(
                  padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 26.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 42.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                                color: Color(0xfff5f5f5),
                                shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(10.r),
                              child: SvgPicture.asset(icon_icognito,width: 24.w,height: 24.h,),
                            ),

                          ),

                          SizedBox(width: 16.w,),

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Go Incognito
                                          Text(
                                              "Go Incognito",
                                              style:  TextStyle(
                                                  color:  black_121212,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "NeueHelvetica",
                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 16.sp
                                              ),
                                              textAlign: TextAlign.left
                                          ),
                                          SizedBox(height: 5.h,),
                                          // Hide yourself for a while
                                          Text(
                                              "Hide yourself for a while",
                                              style:  TextStyle(
                                                  color: grey_aaaaaa,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "NeueHelvetica",
                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 14.sp
                                              ),
                                              textAlign: TextAlign.left
                                          ),


                                        ],
                                      ),
                                    ),

                                    FlutterSwitch(
                                      width: 40.0,
                                      height: 20.0,
                                      activeColor: Color(0xff38bf49),
                                      inactiveColor: Color(0xffe9ecec),
                                      valueFontSize: 0.0,
                                      toggleSize: 15.0,
                                      value: status,
                                      borderRadius: 15.0,
                                      padding: 2.0,
                                      showOnOff: true,
                                      onToggle: (val) {
                                        setState(() {
                                          status = val;
                                        });
                                      },
                                    ),
                                  ],
                                ),

                                SizedBox(height: 15.h,),

                                Container(
                                    width: double.infinity,
                                    height: 1,
                                    decoration: BoxDecoration(
                                        color:  view_line_f4f6f6
                                    )
                                ),
                              ],
                            ),
                          ),



                        ],
                      ),
                      SizedBox(height: 28.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 42.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                                color: Color(0xfff5f5f5),
                                shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(10.r),
                              child: SvgPicture.asset(icon_about_me,width: 24.w,height: 24.h,),
                            ),

                          ),

                          SizedBox(width: 16.w,),

                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Go Incognito
                                Text(
                                    "About me",
                                    style:  TextStyle(
                                        color:  black_121212,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "NeueHelvetica",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.sp
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                SizedBox(height: 5.h,),
                                // Hide yourself for a while
                                Text(
                                    "Edit your personal information",
                                    style:  TextStyle(
                                        color: grey_aaaaaa,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NeueHelvetica",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                SizedBox(height: 15.h,),

                                Container(
                                    width: double.infinity,
                                    height: 1,
                                    decoration: BoxDecoration(
                                        color:  view_line_f4f6f6
                                    )
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 28.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 42.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                                color: Color(0xfff5f5f5),
                                shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(10.r),
                              child: SvgPicture.asset(icon_rate,width: 24.w,height: 24.h,),
                            ),

                          ),

                          SizedBox(width: 16.w,),

                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Go Incognito
                                  Text(
                                      "Rate our app",
                                      style:  TextStyle(
                                          color:  black_121212,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "NeueHelvetica",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),

                                  SizedBox(height: 28.h,),

                                  Container(
                                      width: double.infinity,
                                      height: 1,
                                      decoration: BoxDecoration(
                                          color:  view_line_f4f6f6
                                      )
                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 28.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 42.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                                color: Color(0xfff5f5f5),
                                shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(10.r),
                              child: SvgPicture.asset(icon_feedback,width: 24.w,height: 24.h,),
                            ),

                          ),

                          SizedBox(width: 16.w,),

                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Go Incognito
                                  Text(
                                      "Feedback & Help",
                                      style:  TextStyle(
                                          color:  black_121212,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "NeueHelvetica",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),

                                  SizedBox(height: 28.h,),

                                  Container(
                                      width: double.infinity,
                                      height: 1,
                                      decoration: BoxDecoration(
                                          color:  view_line_f4f6f6
                                      )
                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 28.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 42.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                                color: Color(0xfff5f5f5),
                                shape: BoxShape.circle
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(10.r),
                              child: SvgPicture.asset(icon_logout,width: 24.w,height: 24.h,),
                            ),

                          ),

                          SizedBox(width: 16.w,),

                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Go Incognito
                                  Text(
                                      "Logout account",
                                      style:  TextStyle(
                                          color:  black_121212,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "NeueHelvetica",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),

                                  SizedBox(height: 28.h,),

                                  Container(
                                      width: double.infinity,
                                      height: 1,
                                      decoration: BoxDecoration(
                                          color:  view_line_f4f6f6
                                      )
                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
        ));
  }
}
