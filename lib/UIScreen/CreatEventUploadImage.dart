import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CreatEventUploadImage extends StatefulWidget {
  const CreatEventUploadImage({Key? key}) : super(key: key);

  @override
  _UploadVideosState createState() => _UploadVideosState();
}

class _UploadVideosState extends State<CreatEventUploadImage> {


  List<TagPeopleModel> onDealsModel = [];
  List<TagPeopleModel> selectedList = [];

  @override
  void initState() {
    onDealsModel.clear();
    onDealsModel.add( TagPeopleModel( "assets/images/img_girl.png","claireroman"));
    onDealsModel.add( TagPeopleModel( "assets/images/img_girl.png","tokyoguinere"));
    onDealsModel.add( TagPeopleModel(  "assets/images/img_girl.png","naidafortes"));
    onDealsModel.add( TagPeopleModel( "assets/images/img_girl.png","tokyoguinere"));
    super.initState();
  }


  /*Speaker bottom sheet*/
  void displayRecurringOrderBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 15,
                                ),

                                // Rectangle 1329
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Opacity(
                                    opacity: 0.4000000059604645,
                                    child: Container(
                                        width: 48,
                                        height: 4,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            color: Color(
                                                0xff96a6a3))),
                                  ),
                                ),

                                SizedBox(
                                  height: 24.h,
                                ),



                                // SPEAKERS
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Stack(
                                    children: const [
                                      Center(
                                        child: Text(
                                            "SPEAKERS",
                                            style: TextStyle(
                                                color:  Color(0xff121212),
                                                fontWeight: FontWeight.w900,
                                                fontFamily: helveticaNeue,
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 16.0
                                            ),
                                            textAlign: TextAlign.left
                                        ),
                                      ),
                                      // +ADD
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                            "+ADD",
                                            style: TextStyle(
                                                color:  Color(0xffff8819),
                                                fontFamily: "Roboto",
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 14.0
                                            ),
                                            textAlign: TextAlign.left
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),

                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                  color: Color(0xfff4f6f6),
                                ),



                                Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [


                                      /*--------------Please Uncomment the below search bar--------------*/

                                      //   SearchBarTag(placeholder: "Search people"),

                                      SizedBox(
                                        height: 24.h,
                                      ),


                                      ListView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(0),
                                        itemCount: onDealsModel.length,
                                        itemBuilder: (context, i) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if(selectedList.contains(onDealsModel[i])){
                                                selectedList.remove(onDealsModel[i]);
                                              }
                                              else{
                                                selectedList.add(onDealsModel[i]);
                                              }
                                            },

                                            );
                                            print(selectedList.length);
                                            print(onDealsModel.length);
                                          },
                                          child: Padding(
                                            padding:  EdgeInsets.only(bottom: 16.h),
                                            child: Container(
                                              color: Colors.white,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  CircularProfileAvatar(
                                '',
                                radius: 32,
                                                      child: Image.asset(onDealsModel[i].image,width: 40.w,height: 40.h,fit: BoxFit.cover,)),
                                                  SizedBox(width: 16.w,),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        // claireroman
                                                        Text(
                                                            onDealsModel[i].title,
                                                            style:  TextStyle(
                                                                color:   grey_aaaaaa,
                                                                fontWeight: FontWeight.w500,
                                                                fontFamily: helveticaNeueNeue_medium,
                                                                fontStyle:  FontStyle.normal,
                                                                fontSize: 14.sp
                                                            ),
                                                            textAlign: TextAlign.left
                                                        ),
                                                        SizedBox(height: 2.h,),
                                                        // Claire Roman
                                                        Text(
                                                            "Claire Roman",
                                                            style:  TextStyle(
                                                                color:  black_121212,
                                                                fontWeight: FontWeight.w700,
                                                                fontFamily: helveticaNeueNeue_medium,
                                                                fontStyle:  FontStyle.normal,
                                                                fontSize: 14.sp
                                                            ),
                                                            textAlign: TextAlign.left
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SvgPicture.asset(selectedList.contains(onDealsModel[i]) ?orange_tick_icon:icon_next_arrow,width: 25.w,height: 25.h,)

                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          );

                      }),
                ],
              ),
            ),
          );
        });
  }

  /*Host bottom sheet*/
  void displayHostBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 15,
                                ),

                                // Rectangle 1329
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Opacity(
                                    opacity: 0.4000000059604645,
                                    child: Container(
                                        width: 48,
                                        height: 4,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            color: Color(
                                                0xff96a6a3))),
                                  ),
                                ),

                                SizedBox(
                                  height: 24.h,
                                ),



                                // SPEAKERS
                                const Center(
                                  child: Text(
                                      "HOST",
                                      style: TextStyle(
                                          color:  Color(0xff121212),
                                          fontWeight: FontWeight.w900,
                                          fontFamily: helveticaNeue,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.0
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),

                                const Divider(
                                  thickness: 1,
                                  height: 1,
                                  color: Color(0xfff4f6f6),
                                ),



                                Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      /*--------------Please Uncomment the below search bar--------------*/

                                      //   SearchBarTag(placeholder: "Search people"),

                                      SizedBox(
                                        height: 24.h,
                                      ),


                                      ListView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(0),
                                        itemCount: onDealsModel.length,
                                        itemBuilder: (context, i) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if(selectedList.contains(onDealsModel[i])){
                                                selectedList.remove(onDealsModel[i]);
                                              }
                                              else{
                                                selectedList.add(onDealsModel[i]);
                                              }
                                            },

                                            );
                                            print(selectedList.length);
                                            print(onDealsModel.length);
                                          },
                                          child: Padding(
                                            padding:  EdgeInsets.only(bottom: 16.h),
                                            child: Container(
                                              color: Colors.white,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  CircularProfileAvatar(
                                '',
                                radius: 32,
                                                      child: Image.asset(onDealsModel[i].image,width: 40.w,height: 40.h,fit: BoxFit.cover,)),
                                                  SizedBox(width: 16.w,),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        // claireroman
                                                        Text(
                                                            onDealsModel[i].title,
                                                            style:  TextStyle(
                                                                color:   grey_aaaaaa,
                                                                fontWeight: FontWeight.w500,
                                                                fontFamily: helveticaNeueNeue_medium,
                                                                fontStyle:  FontStyle.normal,
                                                                fontSize: 14.sp
                                                            ),
                                                            textAlign: TextAlign.left
                                                        ),
                                                        SizedBox(height: 2.h,),
                                                        // Claire Roman
                                                        Text(
                                                            "Claire Roman",
                                                            style:  TextStyle(
                                                                color:  black_121212,
                                                                fontWeight: FontWeight.w700,
                                                                fontFamily: helveticaNeueNeue_medium,
                                                                fontStyle:  FontStyle.normal,
                                                                fontSize: 14.sp
                                                            ),
                                                            textAlign: TextAlign.left
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SvgPicture.asset(selectedList.contains(onDealsModel[i]) ?orange_tick_icon:icon_next_arrow,width: 25.w,height: 25.h,)

                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          );

                      }),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: ToolbarLocation(context,"CREATE EVENT","assets/images/location_icon.png"),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 40.h,bottom: 24.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        // UPLOAD VIDEO
                        Text(
                            "UPLOAD POSTER",
                            style:  TextStyle(
                                color:   grey_aaaaaa,
                                fontWeight: FontWeight.w900,
                                fontFamily: "Roboto",
                                fontStyle:  FontStyle.normal,
                                fontSize: 12.sp
                            ),
                            textAlign: TextAlign.left
                        ),

                        SizedBox(height: 25.h,),

                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: const Color(0xfff5f5f5),
                            border: Border.all(
                              width: 1,
                              color: const Color(0x66f5f5f5)
                            ),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(top: 96.h,bottom: 96.h,left: 40.w,right: 40.w),
                            child: Column(
                              children: [
                                SvgPicture.asset(icon_upload_image,width: 32.w,height:32.h ),
                                SizedBox(height: 16.h,),
                                // Upload Video
                                Text(
                                    "Upload image poster",
                                    style:  TextStyle(
                                        color:   const Color(0xff273433),
                                        fontWeight: FontWeight.w900,
                                        fontFamily: helveticaNeue,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.center
                                ),
                                SizedBox(height: 8.sp,),
                                // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae facilisis sit nunc lorem. Morbi orci,
                                Text(
                                    "Max image size is 5 Mb",
                                    style:  TextStyle(
                                        color:   const Color(0xff96a6a3),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 12.sp,
                                      height: 1.5
                                    ),
                                    textAlign: TextAlign.center
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h,),
                        // Add more photos
                        const Text(
                            "+ Add more photos",
                            style: TextStyle(
                                color:  Color(0xffff881a),
                                fontFamily: helveticaNeue,
                                fontStyle:  FontStyle.normal,
                                fontSize: 14.0
                            ),
                            textAlign: TextAlign.center
                        ),


                        SizedBox(
                          height: 28.h,
                        ),


                        GestureDetector(
                          onTap: (){
                            setState(() {
                              displayRecurringOrderBottomSheet(context);
                            });
                          },
                          child: Container(
                            color: white_ffffff,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "TAG SPEAKERS",
                                    style:  TextStyle(
                                        color:   black_121212,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 12.sp
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                const Icon(Icons.add,size: 15,color: orange_ff881a,)
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 14.h,
                        ),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color(0xffebebeb),
                          ),
                          child: // Frame 8618

                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularProfileAvatar(
                                '',
                                radius: 32,
                                    child: Image.asset("assets/images/img_girl.png",width: 17.w,height: 17.h,fit: BoxFit.cover,)),
                                SizedBox(width: 5.w,),
                                // @HennaBack
                                Text(
                                    "@HennaBack",
                                    style:  TextStyle(
                                        color:  black_121212,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 11.sp
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                SizedBox(width: 5.w,),
                                const Icon
                                  (Icons.cancel_outlined,size: 12,)
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 28.h,
                        ),



                        GestureDetector(
                          onTap: (){
                            setState(() {
                              displayHostBottomSheet(context);
                            });
                          },
                          child: Container(
                            color: white_ffffff,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "TAG HOST",
                                    style:  TextStyle(
                                        color:   black_121212,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 12.sp
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                const Icon(Icons.add,size: 15,color: orange_ff881a,)
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 14.h,
                        ),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color(0xffebebeb),
                          ),
                          child: // Frame 8618

                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
CircularProfileAvatar(
                                '',
                                radius: 32,
                                    child: Image.asset("assets/images/img_girl.png",width: 17.w,height: 17.h,fit: BoxFit.cover,)),
                                SizedBox(width: 5.w,),
                                // @HennaBack
                                Text(
                                    "@HennaBack",
                                    style:  TextStyle(
                                        color:  black_121212,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 11.sp
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                SizedBox(width: 5.w,),
                                const Icon
                                  (Icons.cancel_outlined,size: 12,)
                              ],
                            ),
                          ),
                        ),






                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: BlackButton("Next", Colors.white, (){}),
              )
            ],
          ),
        ));
  }
}
