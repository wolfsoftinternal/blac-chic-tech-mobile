import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../Model/FindSpeakerModel.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';

class FindSpeaker extends StatefulWidget {
  const FindSpeaker({Key? key}) : super(key: key);

  @override
  _FindSpeakerState createState() => _FindSpeakerState();
}

class _FindSpeakerState extends State<FindSpeaker> {
  List<FindSpeakerModel> findSpeakerList = [
    FindSpeakerModel(photo_user, 'Jennifer', "Henna Back"),
    FindSpeakerModel(photo_user, 'HennaBack', "Jennifer Lawrence"),
    FindSpeakerModel(photo_user, 'tokyoguinere', "Tokyo Guinere"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: white_ffffff,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: ToolbarWithHeaderCenterTitle("FIND A SPEAKER")),
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
                margin: EdgeInsets.only(top: 16.h, left: 24.w),
                child: Text(
                  "115 Speakers",
                  style: TextStyle(
                      color: grey_aaaaaa,
                      fontSize: 14.sp,
                      fontFamily: roboto_regular),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: findSpeakerList.length,
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

                                ClipOval(
                                  child: Image.asset(findSpeakerList[i].imgUser,height: 40.h,width:40.h,fit: BoxFit.fill,),
                                ),
                                SizedBox(width: 16.w,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(findSpeakerList[i].tvTitle,style: TextStyle(
                                      fontFamily: helveticaNeueNeue_medium,color: grey_aaaaaa,
                                      fontSize: 14
                                    ),),
                                    SizedBox(height: 3.h,),
                                    Text(findSpeakerList[i].tvSubTitle,style: TextStyle(
                                        fontFamily: helvetica_neu_bold,color: black_121212,
                                        fontSize: 14
                                    ),),

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
