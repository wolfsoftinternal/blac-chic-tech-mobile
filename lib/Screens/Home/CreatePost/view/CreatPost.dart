// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Screens/Home/CreatePost/controller/PostController.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/view/PostLocation.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/view/TagPeople.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/view/multi_assets_page.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreatPost extends StatefulWidget {
  const CreatPost({Key? key}) : super(key: key);

  @override
  _CreatPostState createState() => _CreatPostState();
}

class _CreatPostState extends State<CreatPost> {
  VideoController videoController = Get.put(VideoController());
  PostController controller = Get.put(PostController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController.userListAPI(context, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 12.w, right: 12.w),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            size: 24.r,
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            if (controller.captionController.value.text.isEmpty) {
                              snackBar(context, 'Enter Caption');
                            } else {
                              checkNet(context).then((value) {
                                controller.createPostAPI(context);
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: orange_ff881a),
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  left: 16.w, right: 16.w, top: 8.h, bottom: 8.h),
                              child: Text('POST',
                                  style:  TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.sp),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('ALL PHOTOS',
                              style: TextStyle(
                                  color: black_121212,
                                  fontFamily: helvetica_neu_bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.sp),
                              textAlign: TextAlign.left),
                          Stack(children: [
                            Positioned(top: 4, child: Icon(Icons.expand_more_rounded)),
                            SizedBox(height: 30, width: 30, child: MultiAssetsPage()),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    img_girl,
                    height: 375.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(TagPeople());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(24.r),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          gradient: LinearGradient(
                              colors: const [
                                Color(0xFF1c2535),
                                Color(0xFF04080f),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.person_add,
                                size: 15,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              // Tag People
                              Text("Tag People",
                                  style:  TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: helvetica_neu_bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.sp),
                                  textAlign: TextAlign.left)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(24.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CAPTION
                    Text("CAPTION",
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: helvetica_neu_bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.7,
                            fontSize: 12.sp),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 13.h,
                    ),

                    Container(
                      decoration: EditTextDecorationBorder,
                      height: 122.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 4.h, bottom: 2.h, right: 24.w, left: 16.w),
                              child: TextFormField(
                                controller: controller.captionController.value,
                                minLines: 2,
                                maxLines: 15,
                                keyboardType: TextInputType.multiline,
                                style: TextStyle(
                                    color: black_121212,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: helveticaNeueNeue_medium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: 'Write a caption...',
                                  hintStyle: TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 26.h,
                    ),

                    InkWell(
                      onTap: () {
                        Get.to(PostLocation());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ADD LOCATION",
                              style: TextStyle(
                                  color: black_121212,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: helvetica_neu_bold,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.7,
                                  fontSize: 12.sp),
                              textAlign: TextAlign.left),
                          RotatedBox(
                              quarterTurns: 90,
                              child: SvgPicture.asset(
                                icon_back_black_arrow,
                                width: 15.w,
                                height: 15.h,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 8.w,
                  ),
                  itemCount: controller.location.length,
                  padding: EdgeInsets.only(top: 0, left: 24.w, right: 24.w),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return AddLocationView(
                      title: controller.location[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
