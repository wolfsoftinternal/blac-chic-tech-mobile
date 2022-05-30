import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';


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
          backgroundColor: const Color(0x80f2f2f2),
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
                        color: const Color(0xff1c2535),
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
                    const SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: const Color(0xff1c2535),
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
                        color: const Color(0xff1c2535),
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
                    const SizedBox(width: 10,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: const Color(0xff1c2535),
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
