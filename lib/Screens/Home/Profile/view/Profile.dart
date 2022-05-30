import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderAction.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/EventTab.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/PostTab.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/ProfileTab.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/SeeAllAdmires.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/VideoTab.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
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

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  TabController? tabController;
  int activeIndex = 0;
  int userId = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(() {
      activeIndex = tabController!.index;
    });

    checkNet(context).then((value) {
      controller.postListAPI(context, null);
      controller.videoListAPI(context, null);
      controller.eventListAPI(context, null);
    });

    init();
  }

  init() async {
    var preferences = MySharedPref();
    SignupModel? myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    userId = myModel!.data!.id!.toInt();
    setState(() {});

    if (userId != controller.details.value.id) {
      dynamic body = {'user_id': controller.details.value.id.toString()};
      checkNet(context).then((value) async {
        await controller.admireListAPI(context, body);
      });

      for (var item in controller.otherAdmireList) {
        if (controller.details.value.id == item.userId) {
          controller.admire.value = 'Admired';
        } else {
          controller.admire.value = 'Admire';
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Column(
          children: [
             SizedBox(
              height: 60.h,
            ),
            Container(
              child: Row(
                children: [
                  BackLayout(),
                  Container(
                    height: 48.h,
                    width: 48.w,
                  ),
                  const Spacer(),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: controller.details.value.image == null
                            ? SvgPicture.asset(
                                placeholder,
                                height: 48.h,
                                width: 48.w,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: controller.details.value.image!,
                          height: 48.h,
                          width: 48.w,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        SvgPicture.asset(
                                  placeholder,
                                          height: 48.h,
                                          width: 48.w,
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) =>
                                    SvgPicture.asset(
                                  placeholder,
                                      height: 48.h,
                                      width: 48.w,
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
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                add_icon,
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 48.h,
                          width: 48.w,
                        ),
                  userId == controller.details.value.id
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset(
                                settings_icon,
                                width: 24.w,
                                height: 24.h,
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
                              child:
                                  Icon(Icons.more_horiz, color: black_121212),
                            ),
                          ),
                        )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  controller.details.value.fullName != null ||
                                          controller.details.value.firstName !=
                                              null
                                      ? Padding(
                                          padding:
                                               EdgeInsets.only(top: 16.h),
                                          child: Row(
                                            children: [
                                              setHelceticaBold(
                                                  controller.details.value
                                                          .fullName ??
                                                      controller.details.value
                                                          .firstName ??
                                                      "",
                                                  24.sp,
                                                  black_121212,
                                                  FontWeight.w500,
                                                  FontStyle.normal,
                                                  -0.96),
                                              SvgPicture.asset(check_icon),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  controller.details.value.currentJobs != null
                                      ? controller.details.value.currentJobs!
                                                  .title !=
                                              null
                                          ? Padding(
                                              padding:
                                                   EdgeInsets.only(top: 12.h),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: setHelveticaMedium(
                                                    controller.details.value
                                                            .currentJobs!.title! +
                                                        ' @' +
                                                        controller
                                                            .details
                                                            .value
                                                            .currentJobs!
                                                            .companyName!,
                                                    16,
                                                    grey_3f3f3f,
                                                    FontWeight.w500,
                                                    FontStyle.normal),
                                              ),
                                            )
                                          : Container()
                                      : Container(),
                                  controller.details.value.currentJobs != null
                                      ? controller.details.value.currentJobs!
                                                  .website !=
                                              null
                                          ? Align(
                                            alignment: Alignment.topLeft,
                                            child: setHelveticaMedium(
                                                controller
                                                        .details
                                                        .value
                                                        .currentJobs!
                                                        .website ??
                                                    "",
                                                12.sp,
                                                blue_0a84ff,
                                                FontWeight.w500,
                                                FontStyle.normal),
                                          )
                                          : Container()
                                      : Container(),
                                  controller.details.value.aboutUs != null
                                      ? Padding(
                                          padding:
                                               EdgeInsets.only(top: 5.h),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.85,
                                              child: setHelveticaMedium(
                                                  controller
                                                      .details.value.aboutUs!,
                                                  12.sp,
                                                  grey_aaaaaa,
                                                  FontWeight.w500,
                                                  FontStyle.normal,
                                                  0.1,
                                                  3),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.86,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        controller.details.value.cityDetails !=
                                                    null &&
                                                controller.details.value
                                                        .stateDetails !=
                                                    null &&
                                                controller.details.value
                                                        .countryDetails !=
                                                    null
                                            ? Padding(
                                                padding:  EdgeInsets.only(
                                                    top: 18.h),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                     Icon(
                                                      Icons.location_on,
                                                      color: orange_ff881a,
                                                      size: 12.r,
                                                    ),
                                                    SizedBox(width: 2.w,),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: setHelveticaMedium(
                                                          controller
                                                                  .details
                                                                  .value
                                                                  .cityDetails!
                                                                  .name! +
                                                              "," +
                                                              controller
                                                                  .details
                                                                  .value
                                                                  .stateDetails!
                                                                  .name! +
                                                              "," +
                                                              controller
                                                                  .details
                                                                  .value
                                                                  .countryDetails!
                                                                  .name!,
                                                          10,
                                                          grey_aaaaaa,
                                                          FontWeight.w500,
                                                          FontStyle.normal),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                        userId != controller.details.value.id
                                            ? InkWell(
                                                onTap: () {
                                                  if (controller.admire.value ==
                                                      'Admire')
                                                    checkNet(context)
                                                        .then((value) {
                                                      controller.createAdmireAPI(
                                                          context,
                                                          controller
                                                              .details.value.id);
                                                    });
                                                },
                                                child: Padding(
                                                  padding:  EdgeInsets.only(
                                                      top: 5.h),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                               Radius
                                                                  .circular(40.r)),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                           EdgeInsets.all(
                                                              12.r),
                                                      child: Row(children: [
                                                        Icon(
                                                          Icons
                                                              .person_add_alt_sharp,
                                                          color: orange,
                                                          size: 12.r,
                                                        ),
                                                        SizedBox(width: 6.w),
                                                        setHelveticaMedium(
                                                            controller
                                                                .admire.value,
                                                            12.sp,
                                                            black_121212,
                                                            FontWeight.w500,
                                                            FontStyle.normal)
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              controller.details.value.instagramUrl != null &&
                                      controller.details.value.twitterUrl !=
                                          null &&
                                      controller.details.value.linkedinUrl != null
                                  ? Padding(
                                      padding:  EdgeInsets.only(top: 16.h),
                                      child: Row(
                                        children: [
                                          controller.details.value.instagramUrl !=
                                                  null
                                              ? Padding(
                                                  padding:  EdgeInsets.only(
                                                      right: 15.w),
                                                  child: Image.asset(
                                                    icon_instagram,
                                                    height: 24.h,
                                                    width: 24.w,
                                                  ),
                                                )
                                              : Container(),
                                          controller.details.value.twitterUrl !=
                                                  null
                                              ? Padding(
                                                  padding:  EdgeInsets.only(
                                                      right: 15.w),
                                                  child: Image.asset(
                                                    icon_twitter,
                                                    height: 24.h,
                                                    width: 24.w,
                                                  ),
                                                )
                                              : Container(),
                                          controller.details.value.linkedinUrl !=
                                                  null
                                              ? Image.asset(
                                                  icon_linkedin,
                                            height: 24.h,
                                            width: 24.w,
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ],
                      ),
                    ),
                     SizedBox(
                      height: 20.h,
                    ),
                    const Divider(
                      color: grey_f4f6f6,
                      thickness: 1,
                    ),
                    userId != controller.details.value.id
                        ? controller.otherAdmireList.length >= 1
                            ? const SizedBox(
                                height: 24,
                              )
                            : Container()
                        : controller.admireList.length >= 1
                            ? const SizedBox(
                                height: 24,
                              )
                            : Container(),
                    userId != controller.details.value.id
                        ? controller.otherAdmireList.length >= 1
                            ? SeeAllAdmiresWidget(userId)
                            : Container()
                        : controller.admireList.length >= 1
                            ? SeeAllAdmiresWidget(userId)
                            : Container(),
                    userId != controller.details.value.id
                        ? controller.otherAdmireList.length >= 1
                            ? Admires(userId: userId, controller: controller)
                            : Container()
                        : controller.admireList.length >= 1
                            ? Admires(userId: userId, controller: controller)
                            : Container(),
                    userId != controller.details.value.id
                        ? controller.otherAdmireList.length >= 1
                            ? const Divider(
                                color: grey_f4f6f6,
                                thickness: 1,
                              )
                            : Container()
                        : controller.admireList.length >= 1
                            ? const Divider(
                                color: grey_f4f6f6,
                                thickness: 1,
                      height: 1,
                              )
                            : Container(),


                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.only(left: 16.w, right: 16.w, top: 22.h),
                            child: Container(
                              height: 66.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80.r),
                                color: grey_f5f5f5,
                              ),
                              child: Padding(
                                padding:
                                EdgeInsets.only(
                                    left: 8.w, right: 8.w, bottom: 8.h, top: 8.h),
                                child: TabBar(
                                  tabs: [
                                    Tab(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Profile',
                                            textAlign: TextAlign.left,
                                            maxLines: 1,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: helvetica_neu_bold,
                                              fontSize: 14.sp,
                                              letterSpacing: -0.28,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Posts',
                                            textAlign: TextAlign.left,
                                            maxLines: 1,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: helvetica_neu_bold,
                                              fontSize: 14.sp,
                                              letterSpacing: -0.28,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Videos',
                                            textAlign: TextAlign.left,
                                            maxLines: 1,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: helvetica_neu_bold,
                                              fontSize: 14.sp,
                                              letterSpacing: -0.28,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Events',
                                            textAlign: TextAlign.left,
                                            maxLines: 1,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: helvetica_neu_bold,
                                              fontSize: 14.sp,
                                              letterSpacing: -0.28,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  indicator: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(80),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x19121212),
                                        offset:  Offset(
                                          0.0,
                                          5.0,
                                        ),
                                        blurRadius: 5.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow

                                    ],
                                  ),

                                  unselectedLabelColor: grey_aaaaaa,
                                  labelColor: black_121212,
                                  controller: tabController,
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: [
                                ProfileTab(),
                                PostTab(),
                                VideoTab(),
                                EventTab(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding SeeAllAdmiresWidget(userId) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Row(
        children: [
          setHelceticaBold(
              '${controller.details.value.firstName.toString().capitalizeFirst} Admires',
              14.sp,
              black_121212,
              FontWeight.w500,
              FontStyle.normal,
              0.2),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if(userId == controller.details.value.id){
                Get.to(SeeAllAdmires(type: 'user'));
              }else{
                Get.to(SeeAllAdmires(type: 'other'));
              }
              
            },
            child: setHelveticaMedium('See More', 12, grey_aaaaaa,
                FontWeight.w500, FontStyle.normal, -0.24),
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.arrow_forward,
            color: grey_aaaaaa,
            size: 12,
          )
        ],
      ),
    );
  }
}

class Admires extends StatelessWidget {
  const Admires({
    Key? key,
    required this.userId,
    required this.controller,
  }) : super(key: key);

  final int userId;
  final AdmireProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
           EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h, bottom: 16.h),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: double.infinity,
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: userId != controller.details.value.id
              ? controller.otherAdmireList.length == 0
                  ? 0
                  : controller.otherAdmireList.length
              : controller.admireList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:  EdgeInsets.only(right: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  userId != controller.details.value.id
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: controller.otherAdmireList[index]
                                      .admireDetails!.image ==
                                  null
                              ? SvgPicture.asset(
                                  placeholder,
                                  height: 48.h,
                                  width: 48.w,
                                )
                              : CachedNetworkImage(
                                  imageUrl: controller
                                      .otherAdmireList[index]
                                      .admireDetails!
                                      .image!,
                            height: 48.h,
                            width: 48.w,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          SvgPicture.asset(
                                    placeholder,
                                            height: 48.h,
                                            width: 48.w,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      SvgPicture.asset(
                                    placeholder,
                                        height: 48.h,
                                        width: 48.w,
                                  ),
                                ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: controller.admireList[index].admireDetails!
                                      .image ==
                                  null
                              ? SvgPicture.asset(
                                  placeholder,
                            height: 48.h,
                            width: 48.w,
                                )
                              : CachedNetworkImage(
                                  imageUrl: controller.admireList[index]
                                      .admireDetails!.image!,
                            height: 48.h,
                            width: 48.w,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          SvgPicture.asset(
                                    placeholder,
                                            height: 48.h,
                                            width: 48.w,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      SvgPicture.asset(
                                    placeholder,
                                        height: 48.h,
                                        width: 48.w,
                                  ),
                                ),
                        ),
                   SizedBox(
                    height: 4.h,
                  ),
                  setHelveticaMedium(
                      userId != controller.details.value.id
                          ? controller.otherAdmireList[index].admireDetails!
                                  .firstName ??
                              ""
                          : controller.admireList[index].admireDetails!
                                  .firstName ??
                              "",
                      12.sp,
                      black_121212,
                      FontWeight.w500,
                      FontStyle.normal,
                      -0.24),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
