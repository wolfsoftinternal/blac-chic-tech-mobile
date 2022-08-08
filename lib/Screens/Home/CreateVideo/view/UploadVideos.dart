import 'dart:io';

import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/view/UploadVideoDetail.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideos extends StatefulWidget {
  const UploadVideos({Key? key}) : super(key: key);

  @override
  _UploadVideosState createState() => _UploadVideosState();
}

class _UploadVideosState extends State<UploadVideos> {
  VideoController controller = Get.put(VideoController());
  File? _video;
  final picker = ImagePicker();
  ChewieController? _chewieController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          ToolbarWithHeaderCenterTitle("UPLOAD VIDEO"),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 24.w, right: 24.w, top: 40.h, bottom: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // UPLOAD VIDEO
                    Text("UPLOAD VIDEO",
                        style: TextStyle(
                            color: grey_aaaaaa,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 25.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: const Color(0xfff5f5f5),
                        border: Border.all(
                            width: 1, color: const Color(0x66f5f5f5)),
                      ),
                      child: _video != null
                          ? Container(
                              child: SizedBox(
                              height: 276.h,
                              child: Chewie(
                                controller: _chewieController!,
                              ),
                            ))
                          : InkWell(
                              onTap: () async {
                                PickedFile? pickedFile = await picker.getVideo(
                                    source: ImageSource.gallery);
                                _video = File(pickedFile!.path);
                                controller.videoController =
                                    VideoPlayerController.file(_video!)
                                      ..initialize().then((_) {
                                        setState(() {});
                                        controller.videoFile.value =
                                            pickedFile.path;
                                        controller.duration.value = controller
                                            .videoController!.value.duration
                                            .toString();
                                        _chewieController = ChewieController(
                                            videoPlayerController:
                                                controller.videoController!,
                                            aspectRatio: 5 / 4,
                                            autoPlay: false,
                                            looping: false,
                                            materialProgressColors:
                                                ChewieProgressColors(
                                                    bufferedColor: grey_3f3f3f,
                                                    playedColor:
                                                        orange_ff881a));
                                      });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 56.h,
                                    bottom: 56.h,
                                    left: 40.w,
                                    right: 40.w),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(upload_video_icon,
                                        width: 52.w, height: 52.h),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    // Upload Video
                                    Text("Upload Video",
                                        style: TextStyle(
                                            color: const Color(0xff273433),
                                            fontWeight: FontWeight.w900,
                                            fontFamily: helveticaNeue,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.center),
                                    SizedBox(
                                      height: 8.sp,
                                    ),
                                    // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae facilisis sit nunc lorem. Morbi orci,
                                    Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae facilisis sit nunc lorem. Morbi orci, risus,",
                                        style: TextStyle(
                                            color: const Color(0xff96a6a3),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Roboto",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                            height: 1.5),
                                        textAlign: TextAlign.center)
                                  ],
                                ),
                              ),
                            ),
                    ),
                    _video == null
                        ? Container()
                        : GestureDetector(
                            onTap: () async {
                              PickedFile? pickedFile = await picker.getVideo(
                                  source: ImageSource.gallery);
                              _video = File(pickedFile!.path);
                              controller.videoController =
                                  VideoPlayerController.file(_video!)
                                    ..initialize().then((_) {
                                      setState(() {});
                                      controller.videoFile.value =
                                          pickedFile.path;
                                      controller.duration.value = controller
                                          .videoController!.value.duration
                                          .toString();
                                      _chewieController = ChewieController(
                                        videoPlayerController:
                                            controller.videoController!,
                                        aspectRatio: 5 / 4,
                                        autoPlay: false,
                                        looping: false,
                                      );
                                    });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: Center(
                                  child: setHelceticaBold(
                                      "Reupload",
                                      12,
                                      black_121212,
                                      FontWeight.w600,
                                      FontStyle.normal,
                                      1.2)),
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlackButton("Next", Colors.white, () {
              if (_video == null) {
                snackBar(context, 'Please upload video');
              } else {
                Get.to(const UploadVideoDetail());
              }
            }),
          )
        ],
      ),
    );
  }
}
