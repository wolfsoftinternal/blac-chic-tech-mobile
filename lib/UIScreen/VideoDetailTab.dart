import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/UIScreen/Featured.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Layout/ToolbarBackOnly.dart';
import '../Model/SpeakersVideoModel.dart';
import 'DetailTab.dart';
import 'RelatedTags.dart';

class VideoDetailTab extends StatefulWidget {
  const VideoDetailTab({Key? key}) : super(key: key);

  @override
  _VideoDetailTabState createState() => _VideoDetailTabState();
}

class _VideoDetailTabState extends State<VideoDetailTab> {
  bool isHeart = false;

  List<SpeakersVideoModel> speakerVideoList = [
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
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
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 10.w),
              width: 48.r,
              height: 48.r,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0.r),
                child: SvgPicture.asset(
                  icon_back_black_arrow,
                  width: 24.w,
                  height: 24.w,
                ),
              ),
            ),
          ),
          Container(
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(
                  color:  view_line_f4f6f6
              )
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    img_girl,
                    width: double.infinity,
                    height: 302.h,
                    fit: BoxFit.fill,
                  ),

                  Container(
                    margin: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff1c2535),
                            Color(0xff04080f),
                          ],
                        )),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 24.w, right: 24.w, top: 10.5.h, bottom: 10.5.h),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            icon_add_play_list,
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          // Add to list
                          Expanded(
                            flex: 1,
                            child: Opacity(
                              opacity: 0.699999988079071,
                              child: Text("Add to list",
                                  style: TextStyle(
                                      color: white_ffffff,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "NeueHelvetica",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left),
                            ),
                          ),

                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHeart = !isHeart;
                                });
                              },
                              child: SvgPicture.asset(
                                icon_heart,
                                width: 18.w,
                                height: 18.h,
                                color: isHeart ? white_ffffff : Color(0xffff1f1f),
                              )),
                          SizedBox(
                            width: 4.w,
                          ),
                          // 1,2k
                          Text("1,2k",
                              style: TextStyle(
                                  color: white_ffffff,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NeueHelvetica",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp),
                              textAlign: TextAlign.left),

                          SizedBox(
                            width: 20.w,
                          ),

                          SvgPicture.asset(
                            icon_message,
                            width: 18.w,
                            height: 18.h,
                          ),

                          SizedBox(
                            width: 20.w,
                          ),

                          SvgPicture.asset(
                            icon_share,
                            width: 18.w,
                            height: 18.h,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                      width: double.infinity,
                      height: 1,
                      decoration: BoxDecoration(
                          color:  view_line_f4f6f6
                      )
                  ),

                  Padding(
                    padding:  EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SPEAKERS
                        Text(
                            "SPEAKERS",
                            style:  TextStyle(
                                color:  grey_aaaaaa,
                                fontWeight: FontWeight.w600,
                                fontFamily: "NeueHelvetica",
                                fontStyle:  FontStyle.normal,
                                fontSize: 12.sp
                            ),
                            textAlign: TextAlign.left
                        ),

                        SizedBox(height: 12.h,),

                        Row(
                          children: [
                            SizedBox(
                              width: 66.w,
                              height: 66.h,
                              child: CircularProfileAvatar(
                                '',
                                child: Image.asset(grid_img_one,fit: BoxFit.fill,),
                                borderColor: Colors.purpleAccent,
                                borderWidth: 0,
                                elevation: 0,
                                imageFit: BoxFit.fill,
                                radius: 50,
                              ),
                            ),
                            SizedBox(width: 24.w,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Maria Van Dejong
                                    Text(
                                        "Maria Van Dejong",
                                        style:  TextStyle(
                                            color:  black_121212,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "NeueHelvetica",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 16.sp
                                        ),
                                        textAlign: TextAlign.left
                                    ),
                                    SvgPicture.asset(icon_tick_blue,width: 22.w,height: 22.w,)
                                  ],
                                ),
                                SizedBox(height: 8.h,),

                                // Product manager and brand strategist @capitalone
                                Text(
                                    "Product manager and brand strategist \n@capitalone",
                                    style:  TextStyle(
                                        color:   Color(0xff3f3f3f),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NeueHelvetica",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 12.sp
                                    ),
                                    textAlign: TextAlign.left
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  Container(
                      width: double.infinity,
                      height: 1,
                      decoration: BoxDecoration(
                          color:  view_line_f4f6f6
                      )
                  ),

                  // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel vitae malesuada faucibus vitae cursus s
                  Padding(
                    padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 16.h,bottom: 16.h),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel vitae malesuada faucibus vitae cursus sed ultricies pellentesque condimentum. Accumsan, vulputate leo, donec pellentesque mauris.",
                        style:  TextStyle(
                            color:  const Color(0xff3f3f3f),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NeueHelvetica",
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.sp,
                            height: 1.5
                        ),
                        textAlign: TextAlign.left
                    ),
                  ),

                  Container(
                      width: double.infinity,
                      height: 1,
                      decoration: BoxDecoration(
                          color:  view_line_f4f6f6
                      )
                  ),

                  Container(
                    height: 300.h,
                    margin: EdgeInsets.only(left: 24.w,right: 24.w,top: 16.h,bottom: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Color(0x80f2f2f2),
                      border: Border.all(
                        width: 1,
                        color: Color(0x4caaaaaa)
                      )
                    ),
                    child: DefaultTabController(
                        length: 2,
                        child: Scaffold(

                          appBar: AppBar(
                            actions: <Widget>[],
                            titleSpacing: 0,
                            elevation: 0,
                            shadowColor: grey_aaaaaa,
                            automaticallyImplyLeading: false,
                            backgroundColor: Color(0x80f2f2f2),
                            bottom: new PreferredSize(
                              preferredSize: new Size(0, -2),
                              child: new Container(
                                child: new TabBar(

                                  isScrollable: true,
                                  //indicatorSize: TabBarIndicatorSize.label,
                                  indicatorColor: orange_ff881a,
                                  indicatorWeight: 3,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelColor: black_121212,
                                  unselectedLabelColor: grey_aaaaaa,
                                  labelPadding: EdgeInsets.symmetric(horizontal:22.0),

                                  tabs: <Widget>[
                                    Container(
                                      height: 50.0,
                                      child:
                                      new Tab(
                                        child: // DETAILS
                                        Text(
                                            "DETAILS",
                                            style:  TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "NeueHelvetica",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 12.sp
                                            ),
                                            textAlign: TextAlign.left
                                        ),
                                      ),
                                    ),
                                    new Tab(
                                      child: // RELATED TAGS
                                      Text(
                                          "RELATED TAGS",
                                          style:  TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "NeueHelvetica",
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 12.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    ),
                                  ],



                                ),

                              ),

                            ),


                          ),
                          body: new TabBarView(
                            children: <Widget>[
                              new Container(
                                child: DetailTab(),
                              ),
                              new Container(
                                child: RelatedTags(),
                              ),
                            ],
                          ),
                        )),
                  ),

                  Container(
                      width: double.infinity,
                      height: 1,
                      decoration: BoxDecoration(
                          color:  view_line_f4f6f6
                      )
                  ),

                  Padding(
                    padding:  EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SPEAKERS
                        Text(
                            "WATCH NEXT",
                            style:  TextStyle(
                                color:  grey_aaaaaa,
                                fontWeight: FontWeight.w600,
                                fontFamily: "NeueHelvetica",
                                fontStyle:  FontStyle.normal,
                                fontSize: 12.sp
                            ),
                            textAlign: TextAlign.left
                        ),

                        SizedBox(height: 12.h,),

                        ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: speakerVideoList.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
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

                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 16.w,right: 10.w),
                                            child: Column(
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
                                            ),
                                          ),
                                        ),


                                      ],
                                    )),
                              );
                            }),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    ));
  }
}
