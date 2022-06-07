import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../Model/VideoCommentsModel.dart';
import '../Styles/my_colors.dart';
import '../Utilities/Constant.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({Key? key}) : super(key: key);

  @override
  _VideoCommentsState createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  List<VideoCommentsModel> videoCommentsList = [
    VideoCommentsModel(photo_user, 'Jennifer ', "Henna Back","2 day ago","Lorem ipsum dolor sit amet,consectetur\nadipiscing elit. Vel vitae malesuada\nfaucibus"),
    VideoCommentsModel(photo_user, 'Jennifer', "Henna Back","2 day ago","Lorem ipsum dolor sit amet,consectetur\nadipiscing elit. Vel vitae malesuada\nfaucibus"),
    VideoCommentsModel(photo_user, 'Jennifer', "Henna Back","2 day ago","Lorem ipsum dolor sit amet,consectetur\nadipiscing elit. Vel vitae malesuada\nfaucibus"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 15.h),
                        child: ToolbarWithHeaderCenterTitle("COMMENTS")),

                    SizedBox(height: 16.w,),

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
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                // mainAxisSize: MainAxisSize.max,
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
                                          ),
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

            /*------- Bottom Message type and send Design Portion ----------*/
            Container(
              color: white_ffffff,
              child: Column(
                children: [

                  Container(
                    height: 1,
                    color: grey_f4f6f6,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [

                        Expanded(
                          child: TextField(
                            style: TextStyle(
                                color: black_121212,
                                fontFamily: roboto_medium,
                                fontSize: 14.0.sp),
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "Write Comment...",
                              hintStyle: TextStyle(
                                  color: grey_aaaaaa,
                                  fontFamily: roboto_medium,
                                  fontSize: 14.sp),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                        SvgPicture.asset(icon_send),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
