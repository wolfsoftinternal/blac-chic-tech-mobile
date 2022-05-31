import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Settings/view/ProfileSetting.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/CreateBottomSheet.dart';
import 'package:blackchecktech/Widget/ReportBottomSheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventListDetail extends StatefulWidget {
  final id;
  const EventListDetail({Key? key, this.id}) : super(key: key);

  @override
  State<EventListDetail> createState() => _EventListDetailState();
}

class _EventListDetailState extends State<EventListDetail> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  int userId = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dynamic body = {
      'event_id': widget.id.toString(),
    };
    checkNet(context).then((value) {
      controller.eventListAPI(context, body);
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
          const SizedBox(
            height: 60,
          ),
          Container(
            child: Row(
              children: [
                BackLayout(),
                const SizedBox(
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
                            child: const Icon(Icons.more_horiz, color: black_121212),
                          ),
                        ),
                      )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: controller.eventDetailList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: GestureDetector(
                      onTap: () {
                        checkNet(context).then((value) {
                          controller.eventDetailAPI(
                              context, controller.eventDetailList[index].id);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 207.h,
                              child: controller.eventDetailList[index].poster ==
                                      null
                                  ? ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: SvgPicture.asset(
                                        placeholder,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 207.h,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: CachedNetworkImage(
                                        imageUrl: controller
                                            .eventDetailList[index].poster!,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 207.h,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                SvgPicture.asset(
                                          placeholder,
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 207.h,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            SvgPicture.asset(
                                          placeholder,
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 207.h,
                                        ),
                                      ),
                                    ),
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 8.0),
                                  child: Container(
                                      decoration: const BoxDecoration(
                                        color: orange,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: setHelveticaMedium(
                                            controller
                                                .eventDetailList[index].type!,
                                            12,
                                            white_ffffff,
                                            FontWeight.w500,
                                            FontStyle.normal),
                                      )),
                                )),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, right: 8.0),
                                child: Container(
                                    height: 29,
                                    width: 133,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xff1c2535),
                                        Color(0xff04080f)
                                      ]),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)),
                                    ),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 6.0, right: 6.0),
                                          child: Icon(
                                            Icons.person,
                                            size: 17,
                                            color: grey_aaaaaa,
                                          ),
                                        ),
                                        setHelceticaBold(
                                            controller.eventDetailList[index]
                                                    .hosts![0].firstName! +
                                                controller
                                                    .eventDetailList[index]
                                                    .hosts![0]
                                                    .lastName!,
                                            11,
                                            white_ffffff,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            -0.22),
                                      ],
                                    )),
                              ),
                            ),
                            Positioned(
                                bottom: 19,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        calendar_icon,
                                        height: 12,
                                        width: 12,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: setHelceticaBold(
                                            '${DateFormat("MMM dd, yyyy").format(controller.eventDetailList[index].startDateTime!)} at ${DateFormat("hh:mm a").format(controller.eventDetailList[index].startDateTime!)}',
                                            10,
                                            white_ffffff,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            -0.4),
                                      ),
                                    ],
                                  ),
                                )),
                            Positioned(
                                bottom: 19,
                                right: 16,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
                                        child: setHelceticaBold(
                                            controller
                                                .eventDetailList[index].venue!,
                                            10,
                                            white_ffffff,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            -0.4),
                                      ),
                                      SvgPicture.asset(
                                        icon_location,
                                        height: 12,
                                        width: 12,
                                      ),
                                    ],
                                  ),
                                )),
                            Positioned(
                                bottom: 40,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: setHelceticaBold(
                                      controller.eventDetailList[index].title!,
                                      22,
                                      white_ffffff,
                                      FontWeight.w500,
                                      FontStyle.normal,
                                      -0.88),
                                )),
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
