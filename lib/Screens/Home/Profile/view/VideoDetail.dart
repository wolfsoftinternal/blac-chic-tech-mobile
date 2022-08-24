// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/AdmireProfile.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/UserProfile.dart';
import 'package:blackchecktech/Screens/Home/Settings/view/ProfileSetting.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/VideoDetailTab.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/BlurIcon.dart';
import 'package:blackchecktech/Widget/CreateBottomSheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../Widget/ReportBottomSheet.dart';

class VideoDetail extends StatefulWidget {
  final id;
  final userId;
  const VideoDetail({Key? key, this.userId, this.id}) : super(key: key);

  @override
  State<VideoDetail> createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  VideoMenuController videoMenuController = Get.put(VideoMenuController());
  VideoController videoController = Get.put(VideoController());
  String username = '';
  bool fullScreen = false;
  SignupModel? myModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initVideoScrolling(context, widget.userId, widget.id);
    dynamic body = {
      'video_id': widget.id.toString(),
      'user_id': widget.userId.toString(),
      'page': controller.videoPageNumber.toString()
    };
    checkNet(context).then((value) {
      controller.videoListAPI(context, body, 'detail');
    });
    init();
  }

  init() async {
    var preferences = MySharedPref();
    myModel = await preferences.getSignupModel(SharePreData.keySignupModel);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.videoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Column(children: [
          SizedBox(
            height: 60,
          ),
          Container(
            child: Row(
              children: [
                BackLayout(),
                SizedBox(
                  height: 48,
                  width: 48,
                ),
                const Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (myModel?.data!.id == controller.details.value.id) {
                        Get.to(AdmireProfile());
                      } else {
                        videoController.userList.clear();
                        Get.to(UserProfile(
                          selectedUserId:
                              controller.details.value.id.toString(),
                          isFrom: true,
                        ));
                      }
                    },
                    child: CircularProfileAvatar(
                      '',
                      radius: 24,
                      child: controller.details.value.image == null
                          ? SvgPicture.asset(
                              placeholder,
                              height: 48,
                              width: 48,
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl: controller.details.value.image!,
                              height: 48,
                              width: 48,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      SvgPicture.asset(
                                placeholder,
                                height: 48,
                                width: 48,
                                fit: BoxFit.cover,
                              ),
                              errorWidget: (context, url, error) =>
                                  SvgPicture.asset(
                                placeholder,
                                height: 48,
                                width: 48,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
                const Spacer(),
                myModel?.data!.id == controller.details.value.id
                    ? GestureDetector(
                        onTap: () {
                          createBottomSheet(context, widget.userId);
                        },
                        child: Container(
                          width: 45.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              add_icon,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 48.w,
                        height: 48.h,
                      ),
                myModel?.data!.id == controller.details.value.id
                    ? Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ProfileSetting())!.then((value) {
                              checkNet(context).then((value) {
                                controller.userProfileAPI(context, false);
                              });
                            });
                          },
                          child: Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                              settings_icon,
                              width: 40,
                              height: 40,
                              color: black_121212,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            displayBottomSheet(context, widget.id);
                          },
                          child: SizedBox(
                            width: 55.w,
                            height: 55.h,
                            child: Icon(Icons.more_horiz, color: black_121212),
                          ),
                        ),
                      )
              ],
            ),
          ),
          controller.videoController.value.isEmpty
              ? Container()
              : Expanded(
                  child: SingleChildScrollView(
                    controller: controller.videoScrollController,
                    child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: controller.videoList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0, bottom: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: white_ffffff,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x17747796)
                                        .withOpacity(0.07),
                                    spreadRadius: 10,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 10), // changes position of shadow
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.r)),
                              ),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(VideoDetailTab(
                                          videoList:
                                              controller.videoList[index]));
                                    },
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0,
                                              right: 16.0,
                                              top: 16.0),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: FittedBox(
                                              // fit: BoxFit.fill,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.r)),
                                                child: YoutubePlayerBuilder(
                                                    onEnterFullScreen: () {
                                                      fullScreen = false;
                                                    },
                                                    player: YoutubePlayer(
                                                      showVideoProgressIndicator:
                                                          false,
                                                      bottomActions: const [
                                                        SizedBox(width: 14.0),
                                                        // CurrentPosition(),
                                                        // const SizedBox(width: 8.0),
                                                        // ProgressBar(),
                                                        // RemainingDuration(),
                                                        // const PlaybackSpeedButton(),
                                                      ],
                                                      controller: controller
                                                          .videoController
                                                          .value[index],
                                                    ),
                                                    builder: (context, player) {
                                                      return Column(
                                                        children: [
                                                          player,
                                                        ],
                                                      );
                                                    }),
                                              ),
                                            ),

                                            // ? Center(
                                            //     child: SizedBox(
                                            //     height: 20,
                                            //     width: 20,
                                            //     child: CircularProgressIndicator(
                                            //       strokeWidth: 2,
                                            //       valueColor:
                                            //           AlwaysStoppedAnimation<Color>(
                                            //               Color(0xff04080f)),
                                            //     ),
                                            //   ))
                                            // : FittedBox(
                                            //     fit: BoxFit.cover,
                                            //     child: Html(

                                            //         data: controller
                                            //             .videoList[index]
                                            //             .embededCode
                                            //             .toString()),
                                            //   ),
                                          ),
                                        ),

                                        Positioned(
                                          top: 75,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.37,
                                          child: InkWell(
                                              onTap: () {
                                                Get.to(VideoDetail(
                                                  id: controller
                                                      .videoList[index].id,
                                                  userId: widget.id,
                                                ))!
                                                    .then((value) {
                                                  dynamic videoBody = {
                                                    'user_id':
                                                        widget.id.toString(),
                                                    'page': controller
                                                        .videoPageNumber
                                                        .toString()
                                                  };
                                                  controller.videoListAPI(
                                                      context, videoBody);
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0,
                                                    right: 16.0,
                                                    top: 16.0),
                                                child: BlurIcon(),
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Positioned(
                                          bottom: 30.h,
                                          left: 10.w,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16.0,
                                                right: 16.0,
                                                top: 16.0),
                                            child: Container(
                                              height: 37.h,
                                              width: 110.w,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xff1c2535),
                                                      Color(0xff04080f)
                                                    ]),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(40.r)),
                                              ),
                                              child: Center(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    controller.videoList[index]
                                                                .is_like ==
                                                            1
                                                        ? InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                controller
                                                                    .videoList[
                                                                        index]
                                                                    .is_like = 0;
                                                                controller
                                                                    .videoList[
                                                                        index]
                                                                    .like_count = controller
                                                                        .videoList[
                                                                            index]
                                                                        .like_count! -
                                                                    1;
                                                                checkNet(
                                                                        context)
                                                                    .then(
                                                                        (value) {
                                                                  videoMenuController.videoUnLike(
                                                                      context:
                                                                          context,
                                                                      videoId: controller
                                                                          .videoList[
                                                                              index]
                                                                          .id,
                                                                      isFrom:
                                                                          'videoDetail');
                                                                });
                                                              });
                                                            },
                                                            child: SvgPicture
                                                                .asset(
                                                              icon_heart,
                                                              width: 17.w,
                                                              height: 17.h,
                                                              color: Colors.red,
                                                            ))
                                                        : InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                controller
                                                                    .videoList[
                                                                        index]
                                                                    .is_like = 1;
                                                                controller
                                                                    .videoList[
                                                                        index]
                                                                    .like_count = controller
                                                                        .videoList[
                                                                            index]
                                                                        .like_count! +
                                                                    1;
                                                                checkNet(
                                                                        context)
                                                                    .then(
                                                                        (value) {
                                                                  videoMenuController.videoLike(
                                                                      context:
                                                                          context,
                                                                      videoId: controller
                                                                          .videoList[
                                                                              index]
                                                                          .id,
                                                                      isFrom:
                                                                          'videoDetail');
                                                                });
                                                              });
                                                            },
                                                            child: Image.asset(
                                                              heart,
                                                              width: 17.w,
                                                              height: 17.h,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    setHelceticaBold(
                                                        "${controller.videoList[index].like_count == null ? 0 : controller.videoList[index].like_count} likes",
                                                        14.sp,
                                                        white_ffffff,
                                                        FontWeight.w500,
                                                        FontStyle.normal)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(VideoDetailTab(
                                                videoList: controller
                                                    .videoList[index]));
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            height: 220,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        )
                                        //       Positioned(
                                        //         bottom: 10.h,
                                        //         right: 15.w,
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.all(8.0),
                                        //     child: Container(
                                        //       color: transparent,
                                        //       height: 32,
                                        //       width: 47,
                                        //       child: Center(
                                        //         child: setHelceticaBold(
                                        //            "00:00",
                                        //            12.0,
                                        //            white_ffffff,
                                        //            FontWeight.w500,
                                        //            FontStyle.normal
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: username.isEmpty
                                                  ? ""
                                                  : "@$username",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      helvetica_neu_bold,
                                                  fontWeight: FontWeight.w600,
                                                  color: black_121212,
                                                  height: 1.4),
                                            ),
                                            TextSpan(
                                                text: controller
                                                        .videoList[index]
                                                        .description ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontWeight: FontWeight.w400,
                                                    color: grey_3f3f3f,
                                                    height: 1.4)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16.0, bottom: 16.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          calendar_icon,
                                          color: grey_aaaaaa,
                                          height: 14.h,
                                          width: 14.w,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                            Jiffy(DateFormat('yyyy-MM-dd')
                                                    .format(controller
                                                        .videoList[index]
                                                        .createdAt!))
                                                .fromNow(),
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    helveticaNeueNeue_medium,
                                                fontWeight: FontWeight.w400,
                                                color: grey_aaaaaa)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
          if (controller.isVideoPaginationLoading.value == true)
            PaginationUtils().loader(),
        ]),
      ),
    );
  }
}
