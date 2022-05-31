import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Layout/SearchBarWithRightIcon.dart';
import '../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../Model/SpeakersVideoModel.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';

class MyPlayList extends StatefulWidget {
  const MyPlayList({Key? key}) : super(key: key);

  @override
  _MyPlayListState createState() => _MyPlayListState();
}

class _MyPlayListState extends State<MyPlayList> {
  List<SpeakersVideoModel> speakerVideoList = [
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2025"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
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
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                          margin: EdgeInsets.only(top: 15.h),
                          child: ToolbarWithHeaderCenterTitle("MY PLAY LIST")),

                      const SearchBarWithRightIcon(),
                      Container(
                        margin: EdgeInsets.only(top: 24.h, left: 24.w, right: 0.w),
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: speakerVideoList.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: SizedBox(
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
                                              child:Text(speakerVideoList[i].tvTime,style: TextStyle(
                                                  fontSize: 11.sp,color: Colors.white,fontFamily: helveticaNeueNeue_medium),) ,
                                            ),

                                          ],
                                        ),

                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 16.w,right: 10.w),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 3.h,),

                                                Text(speakerVideoList[i].tvHeading,style: const TextStyle(
                                                    fontFamily: helvetica_neu_bold,color: black_121212,
                                                    fontSize: 14
                                                ),),
                                                SizedBox(height: 8.h,),
                                                Text(speakerVideoList[i].tvTitle,style: const TextStyle(
                                                    fontFamily: helveticaNeueNeue_medium,color: opcity_black_121212,
                                                    fontSize: 10),),
                                                SizedBox(height: 2.h,),
                                                Text(speakerVideoList[i].tvDate,style: const TextStyle(
                                                    fontFamily: helveticaNeueNeue_medium,color: opcity_black_121212,
                                                    fontSize: 8),),

                                              ],
                                            ),
                                          ),
                                        ),
                                        PopupMenuButton(
                                        itemBuilder: (context) => [
                                          const PopupMenuItem(
                                            child: Text("Remove"),
                                            textStyle: TextStyle(
                                              color: black_121212,
                                              fontFamily: roboto_regular,
                                               fontSize: 14
                                            ),
                                            value: 1,
                                          ),
                                        ],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 10
                                      ),
                                      icon: Image.asset(img_more,width: 16.w,height: 16.w,)),
                                      ],
                                    )),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
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
