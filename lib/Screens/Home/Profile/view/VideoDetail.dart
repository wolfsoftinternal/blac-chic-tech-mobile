// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Settings/view/ProfileSetting.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/CreateBottomSheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

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
  int userId = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initVideoScrolling(context, widget.userId, widget.id);
    dynamic body = {
      'video_id': widget.id.toString(),
      'user_id': userId.toString(),
      'page': controller.videoPageNumber.toString()
    };
    checkNet(context).then((value) {
      controller.videoListAPI(context, body, 'detail');
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
                SizedBox(
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
                          createBottomSheet(context, widget.userId);
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
                    : SizedBox(
                        width: 48.w,
                        height: 48.h,
                      ),
                userId == controller.details.value.id
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ProfileSetting());
                          },
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
          Expanded(
            child: SingleChildScrollView(
              controller: controller.videoScrollController,
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.videoList.length,
                  itemBuilder: (context, index) {
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
                              SizedBox(
                                height: 220,
                                width: MediaQuery.of(context).size.width,
                                child:
                                    controller.videoList[index].embededCode ==
                                            null
                                        ? Center(
                                            child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Color(0xff04080f)),
                                            ),
                                          ))
                                        : FittedBox(
                                            fit: BoxFit.cover,
                                            child: Html(
                                                data: controller
                                                    .videoList[index]
                                                    .embededCode
                                                    .toString()),
                                          ),
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
                                            "@${controller.videoList[index].eventSpoken ?? ""} ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: helvetica_neu_bold,
                                          fontWeight: FontWeight.w600,
                                          color: black_121212,
                                        ),
                                      ),
                                      TextSpan(
                                          text: controller
                                                  .videoList[index].caption ??
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
          ),
          if (controller.isVideoPaginationLoading.value == true)
            PaginationUtils().loader(),
        ]),
      ),
    );
  }
}
