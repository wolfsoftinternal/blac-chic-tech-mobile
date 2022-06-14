// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';

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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  VideoController videoController = Get.put(VideoController());
  PostController controller = Get.put(PostController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController.userListAPI(context);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.close,
                        size: 24,
                      ),
                    ),
                    Spacer(),
                    Text('ALL PHOTOS',
                        style: TextStyle(
                            color: black_121212,
                            fontFamily: helvetica_neu_bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 16),
                        textAlign: TextAlign.left),
                    Stack(children: [
                      Positioned(
                          top: 4, child: Icon(Icons.expand_more_rounded)),
                      SizedBox(child: MultiAssetsPage()),
                    ]),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        if (controller.captionController.value.text.isEmpty) {
                          snackBar(context, 'Enter Caption');
                        } else if (controller.assetImages.isEmpty) {
                          snackBar(context, 'Select image');
                        } else {
                          checkNet(context).then((value) {
                            controller.createPostAPI(context);
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: orange_ff881a),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          child: Text('POST',
                              style: const TextStyle(
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  controller.assetImages.length > 0
                      ?
                      Image.file(
                        File(
                          controller.assetImages[0].relativePath.toString().contains('/storage/emulated/0/')
                          ? (controller.assetImages[0].relativePath ?? "") + "/" + (controller.assetImages[0].title ?? "")
                          : '/storage/emulated/0/' + (controller.assetImages[0].relativePath ?? "") + "/" + (controller.assetImages[0].title ?? "")
                        ),
                        width: double.infinity,
                        height: 375.h,
                        fit: BoxFit.cover,
                      )
                      : Image.asset(
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
                          borderRadius: BorderRadius.circular(4),
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
                                  style: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w900,
                                      fontFamily: "NeueHelvetica",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
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
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CAPTION
                    Text("CAPTION",
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: "NeueHelvetica",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
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
                                  top: 4.h,
                                  bottom: 2.h,
                                  right: 24.w,
                                  left: 16.w),
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
                      height: 16.h,
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
                                  fontFamily: "NeueHelvetica",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
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
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: controller.location.value == ''
                    ? Container()
                    : AddLocationView(
                        title: controller.location.value,
                      ),
              ),
              // SizedBox(
              //   height: 35.h,
              //   child: ListView.separated(
              //     separatorBuilder: (context, index) => SizedBox(
              //       width: 8.w,
              //     ),
              //     itemCount: 1,
              //     padding: EdgeInsets.only(top: 0, left: 24.w, right: 24.w),
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (_, index) {
              // return controller.location.value == '' ? Container() :
              // AddLocationView(
              //   title: controller.location.value,
              // );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoController.searchController.value.text = "";
  }
}
