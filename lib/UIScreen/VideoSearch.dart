import 'package:blackchecktech/Layout/SearchBar.dart';
import 'package:blackchecktech/Model/SpeakersVideoModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Screens/Home/videosMenu/Model/SpeakerVideoModel.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';

class VideoSearch extends StatefulWidget {
  const VideoSearch({Key? key}) : super(key: key);

  @override
  _VideoSearchState createState() => _VideoSearchState();
}

class _VideoSearchState extends State<VideoSearch> {
  List<SpeakersVideoModel> videoSearchList = [
    SpeakersVideoModel(
        photo_user,
        '3:56',
        "4 steps to hiring fairly — and \nsupporting criminal justice...",
        "Steve Roshein",
        "Posted Dec 2021"),
    SpeakersVideoModel(
        photo_user,
        '3:56',
        "4 steps to hiring fairly — and \nsupporting criminal justice...",
        "Steve Roshein",
        "Posted Dec 2021"),
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
              SizedBox(
                height: 15.h,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 24.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 48.r,
                        height: 48.r,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 6,
                              blurRadius: 10,
                              offset: const Offset(
                                  1, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5.0.r),
                          child: SvgPicture.asset(
                            icon_cancel,
                            width: 30.w,
                            height: 30.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Center(
                        child: // TOPICS
                            Text("SEARCH",
                                style: TextStyle(
                                    color: Color(0xff121212),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: helveticaNeue,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left)),
                  ),
                ],
              ),
              SearchBar(""),
              Container(
                margin: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: videoSearchList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: Image.asset(
                                        videoSearchList[i].imgVideo,
                                        height: 56.h,
                                        width: 100.w,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: 6.w, bottom: 6.h),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.5.h, horizontal: 6.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xff1c2535),
                                            Color(0xff04080f)
                                          ],
                                          stops: [0.0, 5.0],
                                        ),
                                      ),
                                      child: Text(
                                        videoSearchList[i].tvTime,
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            color: Colors.white,
                                            fontFamily:
                                                helveticaNeueNeue_medium),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      videoSearchList[i].tvHeading,
                                      style: const TextStyle(
                                          fontFamily: helvetica_neu_bold,
                                          color: black_121212,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Text(
                                      videoSearchList[i].tvTitle,
                                      style: const TextStyle(
                                          fontFamily: helveticaNeueNeue_medium,
                                          color: opcity_black_121212,
                                          fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      videoSearchList[i].tvDate,
                                      style: const TextStyle(
                                          fontFamily: helveticaNeueNeue_medium,
                                          color: opcity_black_121212,
                                          fontSize: 8),
                                    ),
                                  ],
                                )
                              ],
                            )),
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
