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


class RegisteredPeople extends StatefulWidget {
  const RegisteredPeople({Key? key}) : super(key: key);

  @override
  _RegisteredPeopleState createState() => _RegisteredPeopleState();
}

class _RegisteredPeopleState extends State<RegisteredPeople> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: ToolbarLocation(context,"REGISTERED PEOPLE","assets/images/location_icon.png"),
          body: Padding(
            padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 40.h),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Color(0xfff5f5f5)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Bronze
                                  Text(
                                      "Bronze",
                                      style:  TextStyle(
                                          fontFamily: "Roboto",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),

                                  SizedBox(width: 8.w,),
                                  // $15
                                  Text(
                                      "\$15",
                                      style:  TextStyle(
                                          color:   Color(0xffaaaaaa),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.sp
                                      ),
                                      textAlign: TextAlign.left
                                  )
                                ],
                              ),
                              SizedBox(height: 12.h,),
                              // 111 Sold
                              Text(
                                  "111 Sold",
                                  style:  TextStyle(
                                      color:   Color(0xff0a84ff),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 16.sp
                                  ),
                                  textAlign: TextAlign.left
                              ),

                              // $1665
                              Text(
                                  "\$1665",
                                  style:  TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 14.sp
                                  ),
                                  textAlign: TextAlign.left
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.5.w,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: Color(0xfff5f5f5)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Bronze
                                  Text(
                                      "Bronze",
                                      style:  TextStyle(
                                          fontFamily: "Roboto",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),

                                  SizedBox(width: 8.w,),
                                  // $15
                                  Text(
                                      "\$15",
                                      style:  TextStyle(
                                          color:   Color(0xffaaaaaa),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.sp
                                      ),
                                      textAlign: TextAlign.left
                                  )
                                ],
                              ),
                              SizedBox(height: 12.h,),
                              // 111 Sold
                              Text(
                                  "111 Sold",
                                  style:  TextStyle(
                                      color:   Color(0xff0a84ff),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 16.sp
                                  ),
                                  textAlign: TextAlign.left
                              ),

                              // $1665
                              Text(
                                  "\$1665",
                                  style:  TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 14.sp
                                  ),
                                  textAlign: TextAlign.left
                              )
                            ],
                          ),
                        ),
                      ),
                    )
,
                  ],
                ),
                SizedBox(height: 16.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: Color(0xfff5f5f5)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Bronze
                                  Text(
                                      "Gold",
                                      style:  TextStyle(
                                          fontFamily: "Roboto",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),

                                  SizedBox(width: 8.w,),
                                  // $15
                                  Text(
                                      "\$15",
                                      style:  TextStyle(
                                          color:   Color(0xffaaaaaa),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.sp
                                      ),
                                      textAlign: TextAlign.left
                                  )
                                ],
                              ),
                              SizedBox(height: 12.h,),
                              // 111 Sold
                              Text(
                                  "111 Sold",
                                  style:  TextStyle(
                                      color:   Color(0xff0a84ff),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 16.sp
                                  ),
                                  textAlign: TextAlign.left
                              ),

                              // $1665
                              Text(
                                  "\$1665",
                                  style:  TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 14.sp
                                  ),
                                  textAlign: TextAlign.left
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.5.w,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: white_ffffff
                        ),

                      ),
                    )
                    ,
                  ],
                ),

              ],
            ),
          ),
        ));
  }
}
