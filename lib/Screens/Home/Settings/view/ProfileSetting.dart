import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Settings/controller/SettingsController.dart';
import 'package:blackchecktech/Screens/Home/Settings/view/AboutMe.dart';
import 'package:blackchecktech/Screens/Home/Settings/view/EditProfile.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  SettingsController controller = Get.put(SettingsController());
  AdmireProfileController admireProfileController =
      Get.put(AdmireProfileController());
  StepsController stepsController = Get.put(StepsController());
  SignupModel? myModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    var preferences = MySharedPref();
    myModel = await preferences.getSignupModel(SharePreData.keySignupModel);
    controller.visible.value = myModel!.data!.isVisible!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            ToolbarWithHeaderCenterTitle('SETTINGS'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 44.h),
                  child: myModel == null
                      ? Container()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xffc4c4c4),
                                        spreadRadius: 2,
                                        blurRadius: 15,
                                        offset: Offset(-2, 7),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: myModel!.data!.image == null
                                          ? SvgPicture.asset(
                                              placeholder,
                                              height: 143.h,
                                              width: 105.w,
                                              fit: BoxFit.cover,
                                            )
                                          : CachedNetworkImage(
                                              imageUrl: myModel!.data!.image!,
                                              height: 143.h,
                                              width: 105.w,
                                              fit: BoxFit.cover,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      SvgPicture.asset(
                                                placeholder,
                                                height: 143.h,
                                                width: 105.w,
                                                fit: BoxFit.cover,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      SvgPicture.asset(
                                                placeholder,
                                                height: 143.h,
                                                width: 105.w,
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                ),
                                SizedBox(
                                  width: 24.w,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Fade Ogunro
                                      Row(
                                        children: [
                                          Text(myModel!.data!.fullName!,
                                              style: TextStyle(
                                                  color: black_121212,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: helvetica_neu_bold,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 18.sp),
                                              textAlign: TextAlign.left),
                                          SvgPicture.asset(
                                            icon_tick_blue,
                                            width: 22.w,
                                            height: 22.w,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      // fadeogunro@gmail.com
                                      Text(myModel!.data!.email!,
                                          style: TextStyle(
                                              color: const Color(0xff3f3f3f),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            icon_location_yellow,
                                            width: 12.w,
                                            height: 12.h,
                                          ),
                                          // Edinburgh, United Kingdom
                                          Text(
                                              myModel!.data!.cityDetails!
                                                      .name!.capitalizeFirst! +
                                                  ', ' +
                                                  myModel!.data!.stateDetails!
                                                      .name!.capitalizeFirst! +
                                                  ', ' +
                                                  myModel!.data!.countryDetails!
                                                      .name!.capitalizeFirst!,
                                              style: TextStyle(
                                                  color: grey_aaaaaa,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: helveticaNeueNeue_medium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10.sp),
                                              textAlign: TextAlign.left)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          checkNet(context).then((value) {
                                            admireProfileController
                                                .userProfileAPI(context, true);
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: const Color(0x80f5f5f5),
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0xfff5f5f5))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  icon_show,
                                                  width: 12.w,
                                                  height: 12.h,
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                // Preview profile
                                                Text("Preview profile",
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xff121212),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily:
                                                            helvetica_neu_bold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14.sp),
                                                    textAlign: TextAlign.left)
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(EditProfile())!.then((value) {
                                  init();
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff1c2535),
                                        Color(0xff04080f),
                                      ],
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        icon_edit_square,
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      // Edit Profile
                                      Text("Edit Profile",
                                          style: TextStyle(
                                              color: white_ffffff,
                                              fontFamily: helveticaNeue,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.sp),
                                          textAlign: TextAlign.left)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                                width: double.infinity,
                                height: 1,
                                decoration: const BoxDecoration(
                                    color: view_line_f4f6f6)),

                            SizedBox(height: 26.h,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 42.w,
                                      height: 42.h,
                                      decoration: const BoxDecoration(
                                          color: Color(0xfff5f5f5),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.r),
                                        child: SvgPicture.asset(
                                          icon_icognito,
                                          width: 24.w,
                                          height: 24.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    // Go Incognito
                                                    Text("Go Incognito",
                                                        style: TextStyle(
                                                            color:
                                                                black_121212,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle:
                                                                FontStyle
                                                                    .normal,
                                                            fontSize: 16.sp),
                                                        textAlign:
                                                            TextAlign.left),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    // Hide yourself for a while
                                                    Text(
                                                        "Hide yourself for a while",
                                                        style: TextStyle(
                                                            color:
                                                                grey_aaaaaa,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle:
                                                                FontStyle
                                                                    .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ],
                                                ),
                                              ),
                                              FlutterSwitch(
                                                width: 40.0,
                                                height: 20.0,
                                                activeColor:
                                                    const Color(0xff38bf49),
                                                inactiveColor:
                                                    const Color(0xffe9ecec),
                                                valueFontSize: 0.0,
                                                toggleSize: 15.0,
                                                value: controller
                                                            .visible.value ==
                                                        1
                                                    ? false
                                                    : true,
                                                borderRadius: 15.0,
                                                padding: 2.0,
                                                showOnOff: true,
                                                onToggle: (val) {
                                                  setState(() {
                                                    if (val == false) {
                                                      controller
                                                          .visible.value = 1;
                                                    } else {
                                                      controller
                                                          .visible.value = 0;
                                                    }
                                                    stepsController
                                                        .personalInfoAPI(
                                                            context,
                                                            'profile_setting',
                                                            controller.visible
                                                                .value);
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Container(
                                              width: double.infinity,
                                              height: 1,
                                              decoration: const BoxDecoration(
                                                  color: view_line_f4f6f6)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(AboutMe());
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 42.w,
                                        height: 42.h,
                                        decoration: const BoxDecoration(
                                            color: Color(0xfff5f5f5),
                                            shape: BoxShape.circle),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.r),
                                          child: SvgPicture.asset(
                                            icon_about_me,
                                            width: 24.w,
                                            height: 24.h,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Go Incognito
                                            Text("About Me",
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight:
                                                        FontWeight.w700,
                                                    fontFamily:
                                                        helveticaNeue,
                                                    fontStyle:
                                                        FontStyle.normal,
                                                    fontSize: 16.sp),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            // Hide yourself for a while
                                            Text(
                                                "Edit your personal information",
                                                style: TextStyle(
                                                    color: grey_aaaaaa,
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeue,
                                                    fontStyle:
                                                        FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              height: 15.h,
                                            ),

                                            Container(
                                                width: double.infinity,
                                                height: 1,
                                                decoration:
                                                    const BoxDecoration(
                                                        color:
                                                            view_line_f4f6f6)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment:
                                //       CrossAxisAlignment.start,
                                //   children: [
                                //     Container(
                                //       width: 42.w,
                                //       height: 42.h,
                                //       decoration: const BoxDecoration(
                                //           color: Color(0xfff5f5f5),
                                //           shape: BoxShape.circle),
                                //       child: Padding(
                                //         padding: EdgeInsets.all(10.r),
                                //         child: SvgPicture.asset(
                                //           icon_rate,
                                //           width: 24.w,
                                //           height: 24.h,
                                //         ),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 16.w,
                                //     ),
                                //     Expanded(
                                //       flex: 1,
                                //       child: Padding(
                                //         padding:
                                //             const EdgeInsets.only(top: 8),
                                //         child: Column(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.start,
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             // Go Incognito
                                //             Text("Rate our app",
                                //                 style: TextStyle(
                                //                     color: black_121212,
                                //                     fontWeight:
                                //                         FontWeight.w700,
                                //                     fontFamily:
                                //                         helveticaNeue,
                                //                     fontStyle:
                                //                         FontStyle.normal,
                                //                     fontSize: 16.sp),
                                //                 textAlign: TextAlign.left),

                                //             SizedBox(
                                //               height: 28.h,
                                //             ),

                                //             Container(
                                //                 width: double.infinity,
                                //                 height: 1,
                                //                 decoration:
                                //                     const BoxDecoration(
                                //                         color:
                                //                             view_line_f4f6f6)),
                                //           ],
                                //         ),
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 28.h,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment:
                                //       CrossAxisAlignment.start,
                                //   children: [
                                //     Container(
                                //       width: 42.w,
                                //       height: 42.h,
                                //       decoration: const BoxDecoration(
                                //           color: Color(0xfff5f5f5),
                                //           shape: BoxShape.circle),
                                //       child: Padding(
                                //         padding: EdgeInsets.all(10.r),
                                //         child: SvgPicture.asset(
                                //           icon_feedback,
                                //           width: 24.w,
                                //           height: 24.h,
                                //         ),
                                //       ),
                                //     ),
                                //     SizedBox(
                                //       width: 16.w,
                                //     ),
                                //     Expanded(
                                //       flex: 1,
                                //       child: Padding(
                                //         padding:
                                //             const EdgeInsets.only(top: 8),
                                //         child: Column(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.start,
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             // Go Incognito
                                //             Text("Feedback & Help",
                                //                 style: TextStyle(
                                //                     color: black_121212,
                                //                     fontWeight:
                                //                         FontWeight.w700,
                                //                     fontFamily:
                                //                         helveticaNeue,
                                //                     fontStyle:
                                //                         FontStyle.normal,
                                //                     fontSize: 16.sp),
                                //                 textAlign: TextAlign.left),

                                //             SizedBox(
                                //               height: 28.h,
                                //             ),

                                //             Container(
                                //                 width: double.infinity,
                                //                 height: 1,
                                //                 decoration:
                                //                     const BoxDecoration(
                                //                         color:
                                //                             view_line_f4f6f6)),
                                //           ],
                                //         ),
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 28.h,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 42.w,
                                      height: 42.h,
                                      decoration: const BoxDecoration(
                                          color: Color(0xfff5f5f5),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.r),
                                        child: SvgPicture.asset(
                                          icon_logout,
                                          width: 24.w,
                                          height: 24.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: (){
                                          checkNet(context).then((value) {
                                            controller.userLogout(context);
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Go Incognito
                                              Text("Logout Account",
                                                  style: TextStyle(
                                                      color: black_121212,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily:
                                                          helveticaNeue,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 16.sp),
                                                  textAlign: TextAlign.left),

                                              SizedBox(
                                                height: 28.h,
                                              ),

                                              Container(
                                                  width: double.infinity,
                                                  height: 1,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              view_line_f4f6f6)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
