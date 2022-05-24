import 'package:blackchecktech/Model/SpeakersVideoModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';

class SpeakersVideos extends StatefulWidget {
  const SpeakersVideos({Key? key}) : super(key: key);

  @override
  _SpeakersVideosState createState() => _SpeakersVideosState();
}

class _SpeakersVideosState extends State<SpeakersVideos> {


  List<SpeakersVideoModel> speakerVideoList = [
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly — and \nsupporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly — and \nsupporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly — and \nsupporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
  ];


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
              Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: ToolbarWithHeaderCenterTitle("CLAIRE ROMAN")),

              Container(
                margin: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  // border: Border.all(color: grey_e9ecec, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: grey_f5f5f5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                            color: black_121212,
                            fontFamily: roboto_medium,
                            fontSize: 14.0),
                        decoration: new InputDecoration(
                          isDense: true,
                          hintText: "Search.......",
                          hintStyle: TextStyle(
                              color: grey_aaaaaa,
                              fontFamily: roboto_medium,
                              fontSize: 14.0),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SvgPicture.asset(
                      search,
                      color: black_121212,
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: speakerVideoList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 25.h),
                        child: Container(
                            width: double.infinity,
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: Image.asset(speakerVideoList[i].imgVideo,height: 56.h,width:100.w,fit: BoxFit.fill,),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 6.w,bottom: 6.h),
                                      padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 6.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xff1c2535),
                                            Color(0xff04080f)
                                          ],
                                          stops: [0.0, 5.0],
                                        ),
                                      ),
                                      child:Text(speakerVideoList[i].tvTime,style: TextStyle(
                                          fontSize: 11.sp,color: Colors.white,fontFamily: helveticaNeueNeue_medium),) ,
                                    ),

                                  ],
                                ),

                                SizedBox(width: 16.w,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 3.h,),

                                    Text(speakerVideoList[i].tvHeading,style: TextStyle(
                                        fontFamily: helvetica_neu_bold,color: black_121212,
                                        fontSize: 14
                                    ),),
                                    SizedBox(height: 8.h,),
                                    Text(speakerVideoList[i].tvTitle,style: TextStyle(
                                        fontFamily: helveticaNeueNeue_medium,color: opcity_black_121212,
                                        fontSize: 10),),
                                    SizedBox(height: 2.h,),
                                    Text(speakerVideoList[i].tvDate,style: TextStyle(
                                        fontFamily: helveticaNeueNeue_medium,color: opcity_black_121212,
                                        fontSize: 8),),

                                  ],
                                )
                              ],
                            )),
                      );
                    }),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 25.h),
                child: Center(
                  child: Text(
                    "Load More",
                    style: TextStyle(
                        fontFamily: roboto_bold,
                        fontSize: 14.sp,
                        color: blue_0a84ff),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
