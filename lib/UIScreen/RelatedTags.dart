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


class RelatedTags extends StatefulWidget {
  const RelatedTags({Key? key}) : super(key: key);

  @override
  _RelatedTagsState createState() => _RelatedTagsState();
}

class _RelatedTagsState extends State<RelatedTags> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0x80f2f2f2),
          body: Padding(
            padding:  EdgeInsets.only(left: 16.w,right: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h,),

                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Color(0xff1c2535),
                      ),
                      child: // Africans
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 8.h,bottom: 8.h),
                        child: Text(
                            "Africans",
                            style:  TextStyle(
                                color:  white_ffffff,
                                fontWeight: FontWeight.w700,
                                fontFamily: "NeueHelvetica",
                                fontStyle:  FontStyle.normal,
                                fontSize: 12.sp
                            ),
                            textAlign: TextAlign.left
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Color(0xff1c2535),
                      ),
                      child: // Africans
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 8.h,bottom: 8.h),
                        child: Text(
                            "Public Health",
                            style:  TextStyle(
                                color:  white_ffffff,
                                fontWeight: FontWeight.w700,
                                fontFamily: "NeueHelvetica",
                                fontStyle:  FontStyle.normal,
                                fontSize: 12.sp
                            ),
                            textAlign: TextAlign.left
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Color(0xff1c2535),
                      ),
                      child: // Africans
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 8.h,bottom: 8.h),
                        child: Text(
                            "Africans",
                            style:  TextStyle(
                                color:  white_ffffff,
                                fontWeight: FontWeight.w700,
                                fontFamily: "NeueHelvetica",
                                fontStyle:  FontStyle.normal,
                                fontSize: 12.sp
                            ),
                            textAlign: TextAlign.left
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Color(0xff1c2535),
                      ),
                      child: // Africans
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 8.h,bottom: 8.h),
                        child: Text(
                            "Public Health",
                            style:  TextStyle(
                                color:  white_ffffff,
                                fontWeight: FontWeight.w700,
                                fontFamily: "NeueHelvetica",
                                fontStyle:  FontStyle.normal,
                                fontSize: 12.sp
                            ),
                            textAlign: TextAlign.left
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ));
  }
}
