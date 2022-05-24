import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/VideoCommentsModel.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<VideoCommentsModel> videoCommentsList = [
    VideoCommentsModel(photo_user, 'Jennifer', "Henna Back","2 day ago","Lorem ipsum dolor sit amet,consectetur\nadipiscing elit. Vel vitae malesuada\nfaucibus"),
    VideoCommentsModel(photo_user, 'Jennifer', "Henna Back","2 day ago","Lorem ipsum dolor sit amet,consectetur\nadipiscing elit. Vel vitae malesuada\nfaucibus"),
    VideoCommentsModel(photo_user, 'Jennifer', "Henna Back","2 day ago","Lorem ipsum dolor sit amet,consectetur\nadipiscing elit. Vel vitae malesuada\nfaucibus"),
  ];

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
                margin: EdgeInsets.only(top: 16.h,),
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: videoCommentsList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 24.w,right: 24.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.asset(videoCommentsList[i].imgUser,height: 40.h,width:40.w,fit: BoxFit.fill,),
                                  ),
                                  SizedBox(width: 16.w,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(videoCommentsList[i].tvTitle,style: TextStyle(
                                                  fontFamily: helveticaNeueNeue_medium,color: grey_aaaaaa,
                                                  fontSize: 14.sp
                                              ),),
                                              SizedBox(height: 2.h,),
                                              Text(videoCommentsList[i].tvSubTitle,style: TextStyle(
                                                  fontFamily: helvetica_neu_bold,color:black_121212,
                                                  fontSize: 14.sp),),
                                            ],
                                          ),
                                          Text(videoCommentsList[i].tvDays,style: TextStyle(
                                              fontFamily: roboto_regular,color: grey_aaaaaa,
                                              fontSize: 14.sp),),
                                        ],),
                                      SizedBox(height: 12.h),
                                      Text(videoCommentsList[i].tvComments,style: TextStyle(
                                          fontFamily: roboto_regular,color: grey_3f3f3f,
                                          fontSize: 14.sp),),

                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 12.h),
                              height: 1.5.h,
                              color: grey_f4f6f6,
                            )
                          ],
                        ),
                      );
                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
