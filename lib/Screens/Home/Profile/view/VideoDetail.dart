// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderTitle.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/CreateBottomSheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../Widget/ReportBottomSheet.dart';

class VideoDetail extends StatefulWidget {
  final id;
  const VideoDetail({Key? key, this.id}) : super(key: key);

  @override
  State<VideoDetail> createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  int userId = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dynamic body = {
      'video_id': widget.id.toString(),
    };
    checkNet(context).then((value) {
      controller.videoListAPI(context, body);
    });
    init();
  }

  init() async {
    var preferences = MySharedPref();
    SignupModel? myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    userId = myModel!.data!.id!.toInt();
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
                Container(
                  height: 48,
                  width: 48,
                ),
                const Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.back();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
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
                userId == controller.details.value.id
                    ? GestureDetector(
                        onTap: () {
                          createBottomSheet(context);
                        },
                        child: Container(
                          width: 48.w,
                          height: 48.h,
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
                    : Container(
                        width: 48.w,
                        height: 48.h,
                      ),
                userId == controller.details.value.id
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 55.w,
                            height: 55.h,
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
                            displayBottomSheet(context);
                          },
                          child: Container(
                            width: 55.w,
                            height: 55.h,
                            child: Icon(Icons.more_horiz, color: black_121212),
                          ),
                        ),
                      )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: controller.videoDetailList.length,
                itemBuilder: (context, index) {
                  controller.position.value =
                      controller.videoController[index].value.position;
                  controller.duration.value =
                      controller.videoController[index].value.duration;
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24.0, bottom: 24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white_ffffff,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x17747796).withOpacity(0.07),
                            spreadRadius: 10,
                            blurRadius: 5,
                            offset:
                                Offset(0, -10), // changes position of shadow
                          ),
                        ],
                        borderRadius:
                            BorderRadius.all(const Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  child: FutureBuilder(
                                    future: controller
                                        .initializeVideoPlayerFuture[index],
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(5)),
                                          child: AspectRatio(
                                            aspectRatio: controller
                                                .videoController[index]
                                                .value
                                                .aspectRatio,
                                            child: VideoPlayer(controller
                                                .videoController[index]),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  right: 15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Colors.grey.withOpacity(0.5),
                                      height: 32,
                                      width: 47,
                                      child: Center(
                                        child: setHelceticaBold(
                                            controller.videoDetailList[index]
                                                    .duration ??
                                                "00:00",
                                            12.0,
                                            white_ffffff,
                                            FontWeight.w500,
                                            FontStyle.normal),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 130,
                                    left: 130,
                                    child: InkWell(
                                        onTap: () {
                                          if (controller.videoController[index]
                                              .value.isPlaying) {
                                            setState(() {
                                              controller.videoController[index]
                                                  .pause();
                                            });
                                          } else {
                                            setState(() {
                                              controller.videoController[index]
                                                  .play();
                                            });
                                          }
                                        },
                                        child: controller.videoController[index]
                                                .value.isPlaying
                                            ? Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                                child: Icon(
                                                  Icons.pause,
                                                  color: white_ffffff,
                                                  size: 20,
                                                ))
                                            // : Container()
                                            : controller.position.value ==
                                                    controller.duration.value
                                                ? SvgPicture.asset(icon_play)
                                                : SvgPicture.asset(icon_play))),
                                Positioned(
                                  bottom: 15,
                                  left: 15,
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xff1c2535),
                                        Color(0xff04080f)
                                      ]),
                                      borderRadius: BorderRadius.all(
                                          const Radius.circular(40)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                              child: Icon(
                                            Icons.image,
                                            color: Colors.red,
                                          )),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          setHelceticaBold(
                                              "1,2k liked",
                                              14,
                                              white_ffffff,
                                              FontWeight.w500,
                                              FontStyle.normal)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "@${controller.videoDetailList[index].eventSpoken ?? ""} ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: helvetica_neu_bold,
                                        fontWeight: FontWeight.w600,
                                        color: black_121212,
                                      ),
                                    ),
                                    TextSpan(
                                        text: controller.videoDetailList[index]
                                                .caption ??
                                            "",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontWeight: FontWeight.w400,
                                            color: black_121212)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
