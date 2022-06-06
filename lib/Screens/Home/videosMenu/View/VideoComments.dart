import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Model/VideoCommentsModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VideoComments extends StatefulWidget {
  int videoId;
  VideoComments({required this.videoId, Key? key}) : super(key: key);

  @override
  _VideoCommentsState createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  VideoMenuController controller = Get.find<VideoMenuController>();
  FocusNode? myFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
    controller.videoComments(widget.videoId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Obx(
            () => Column(
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
                        SizedBox(
                          height: 16.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 16.h,
                          ),
                          child: controller.isLoading.value
                              ? const SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xff04080f)),
                                  )))
                              : controller.commentModelList.length == 0
                                  ? SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      width: double.infinity,
                                      child: const Center(
                                          child: Text("No Data Found",
                                              style: TextStyle(
                                                  color: grey_aaaaaa,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      helveticaNeueNeue_medium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14))),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount:
                                          controller.commentModelList.length,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, i) {
                                        return Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 12.h),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 24.w, right: 24.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20)),
                                                      child: CachedNetworkImage(
                                                        imageUrl: controller
                                                            .commentModelList[i]
                                                            .userDetails!
                                                            .image!,
                                                        fit: BoxFit.cover,
                                                        width: 40.w,
                                                        height: 40.h,
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    downloadProgress) =>
                                                                SvgPicture
                                                                    .asset(
                                                          placeholder,
                                                          fit: BoxFit.cover,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 207.h,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            SvgPicture.asset(
                                                          placeholder,
                                                          fit: BoxFit.cover,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 207.h,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 16.w,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            // mainAxisSize: MainAxisSize.max,
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    controller
                                                                        .commentModelList[
                                                                            i]
                                                                        .userDetails!
                                                                        .userName
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            helveticaNeueNeue_medium,
                                                                        color:
                                                                            grey_aaaaaa,
                                                                        fontSize:
                                                                            14.sp),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  ),
                                                                  Text(
                                                                    controller
                                                                        .commentModelList[
                                                                            i]
                                                                        .userDetails!
                                                                        .fullName
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            helvetica_neu_bold,
                                                                        color:
                                                                            black_121212,
                                                                        fontSize:
                                                                            14.sp),
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                controller
                                                                    .dateTOTimeConvert(controller
                                                                        .commentModelList[
                                                                            i]
                                                                        .createdAt
                                                                        .toString())
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        roboto_regular,
                                                                    color:
                                                                        grey_aaaaaa,
                                                                    fontSize:
                                                                        14.sp),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height: 12.h),
                                                          Text(
                                                            controller
                                                                .commentModelList[
                                                                    i]
                                                                .comment
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    roboto_regular,
                                                                color:
                                                                    grey_3f3f3f,
                                                                fontSize:
                                                                    14.sp),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 12.h),
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
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 24.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextField(
                                focusNode: myFocusNode,
                                controller: controller.commentTxt.value,
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
                            InkWell(
                                onTap: () {
                                  myFocusNode!.unfocus();
                                  controller.addCommentApi(
                                      comment: controller.commentTxt.value.text,
                                      videoId: widget.videoId,
                                      context: context);
                                },
                                child: controller.isLoadingButton.value == true
                                    ? const SizedBox(
                                        width: 15,
                                        height: 15,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Color(0xff04080f)),
                                        )))
                                    : SvgPicture.asset(icon_send)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
