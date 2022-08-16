import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  List list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.details.value.questions != null) {
        if (controller.details.value.questions!.length >= 4) {
          if (controller.details.value.questions![3].answer!.isNotEmpty) {
            if (controller.details.value.questions![3].answer!.length > 1) {
              list.clear();
              list = controller.details.value.questions![3].answer!.split(', ');
            } else {
              list.add(controller.details.value.questions![3].answer);
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Center(
          child: controller.details.value.pastJobs.toString() == "[]" ||
                  controller.details.value.pastJobs == null &&
                      controller.details.value.educations.toString() == "[]" ||
                  controller.details.value.educations == null &&
                      controller.details.value.dateOfBirth == null &&
                      controller.details.value.questions.toString() == "[]" ||
                  controller.details.value.questions == null
              ? SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        img_logo,
                        height: 80.h,
                        width: 80.w,
                      ),
                      setHelceticaBold("NO INFORMATION AVAILABLE", 16.sp,
                          grey_aaaaaa, FontWeight.w500, FontStyle.normal, 0.5)
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: ListView(
                    physics:
                        const ScrollPhysics(), // <-- this will disable scroll
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 13.h,
                          ),
                          setHelceticaBold('About Me', 16.sp, black_121212,
                              FontWeight.w500, FontStyle.normal, -0.32),
                          SizedBox(
                            height: 32.h,
                          ),
                          controller.details.value.pastJobs!.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: white_ffffff,
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        border: Border.all(
                                            color: light_grey_f2f2f2)),
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 4.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 16.h, left: 16.w),
                                            child: setHelceticaBold(
                                                'PAST JOBS',
                                                12.sp,
                                                black_121212,
                                                FontWeight.w900,
                                                FontStyle.normal,
                                                0.0),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 12.h, left: 16.w),
                                            child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                itemCount: controller.details
                                                    .value.pastJobs!.length,
                                                physics: ScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 12.h),
                                                    child: Row(
                                                      children: [
                                                        CircularProfileAvatar(
                                                          '',
                                                          radius: 20.5,
                                                          child: controller
                                                                      .details
                                                                      .value
                                                                      .pastJobs![
                                                                          index]
                                                                      .logo ==
                                                                  null
                                                              ? Image.asset(
                                                                  appleLogo,
                                                                  height: 32.h,
                                                                  width: 32.w,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )
                                                              : CachedNetworkImage(
                                                                  imageUrl: controller
                                                                      .details
                                                                      .value
                                                                      .pastJobs![
                                                                          index]
                                                                      .logo,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      .78,
                                                                  width: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  progressIndicatorBuilder: (context,
                                                                          url,
                                                                          downloadProgress) =>
                                                                      SvgPicture
                                                                          .asset(
                                                                    placeholder,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        .78,
                                                                    width: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      SvgPicture
                                                                          .asset(
                                                                    placeholder,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        .78,
                                                                    width: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                        ),
                                                        Flexible(
                                                          child: controller
                                                                      .details
                                                                      .value
                                                                      .pastJobs![
                                                                          index]
                                                                      .title !=
                                                                  null
                                                              ? Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left:
                                                                          12.w,
                                                                      right:
                                                                          8.w),
                                                                  child: Row(
                                                                    children: [
                                                                      setHelveticaMedium(
                                                                          "${controller.details.value.pastJobs![index].title!}",
                                                                          14.sp,
                                                                          grey_aaaaaa,
                                                                          FontWeight
                                                                              .w500,
                                                                          FontStyle
                                                                              .normal,
                                                                          -0.28,
                                                                          1),
                                                                      Flexible(
                                                                        child: setHelveticaMedium(
                                                                            " @${controller.details.value.pastJobs![index].companyName!.toString().capitalize}",
                                                                            14.sp,
                                                                            grey_3f3f3f,
                                                                            FontWeight.w500,
                                                                            FontStyle.normal,
                                                                            -0.28,
                                                                            1),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.educations!.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: white_ffffff,
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        border: Border.all(
                                            color: light_grey_f2f2f2)),
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 4.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 16.h, left: 16.h),
                                            child: setHelceticaBold(
                                                'EDUCATION',
                                                12.sp,
                                                black_121212,
                                                FontWeight.w900,
                                                FontStyle.normal,
                                                0.0),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 12.h, left: 16.w),
                                            child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                itemCount: controller.details
                                                    .value.educations!.length,
                                                physics: ScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 12.h),
                                                    child: setHelveticaMedium(
                                                        "${controller.details.value.educations![index].schoolUniversity!.capitalize} / ${controller.details.value.educations![index].startYear!}  - ${controller.details.value.educations![index].endYear!}",
                                                        16.sp,
                                                        grey_aaaaaa,
                                                        FontWeight.w500,
                                                        FontStyle.normal,
                                                        -0.32),
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.dateOfBirth != null
                              ? Padding(
                                  padding: EdgeInsets.only(bottom: 16.h),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: white_ffffff,
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        border: Border.all(
                                            color: light_grey_f2f2f2)),
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 4.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 16.h, left: 16.w),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(calendar_icon),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                setHelceticaBold(
                                                    "DATE OF BIRTH",
                                                    12.sp,
                                                    black_121212,
                                                    FontWeight.w900,
                                                    FontStyle.normal,
                                                    0.0),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 12.h,
                                                left: 40.w,
                                                bottom: 12.h),
                                            child: setHelveticaMedium(
                                                controller
                                                    .details.value.dateOfBirth,
                                                16.sp,
                                                grey_aaaaaa,
                                                FontWeight.w500,
                                                FontStyle.normal,
                                                -0.32),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 1
                              ? GestureDetector(
                                  onTap: () {
                                    // controller.q0Expand.value = false;
                                    controller.q0Expand.value =
                                        !controller.q0Expand.value;
                                    // controller.q2Expand.value = false;
                                    // controller.q3Expand.value = false;
                                    // controller.q4Expand.value = false;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![0]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.h),
                                              child: Container(
                                                child: ReadMoreText(
                                                  controller
                                                      .details
                                                      .value
                                                      .questions![0]
                                                      .answer!
                                                      .capitalizeFirst!
                                                      .toString(),
                                                  trimLines: 2,
                                                  lessStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Red_d32416),
                                                  moreStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: green_2cbea7),
                                                  colorClickableText:
                                                      Colors.red.shade300,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      '  Read More',
                                                  trimExpandedText:
                                                      '  Read Less',
                                                  delimiter: '',
                                                  style: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 16,
                                                      color: grey_aaaaaa),
                                                ),
                                                // child: Center(
                                                //   child: setHelveticaMedium(
                                                //       controller.details.value
                                                //           .questions![1].answer!.capitalizeFirst!,
                                                //       16.sp,
                                                //       grey_aaaaaa,
                                                //       FontWeight.w500,
                                                //       FontStyle.normal,
                                                //       -0.32,
                                                //       controller.q1Expand.value == true ? null : 3),
                                                // )
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 2
                              ? GestureDetector(
                                  onTap: () {
                                    // controller.q0Expand.value = false;
                                    controller.q1Expand.value =
                                        !controller.q1Expand.value;
                                    // controller.q2Expand.value = false;
                                    // controller.q3Expand.value = false;
                                    // controller.q4Expand.value = false;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![1]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.h),
                                              child: Container(
                                                child: ReadMoreText(
                                                  controller
                                                      .details
                                                      .value
                                                      .questions![1]
                                                      .answer!
                                                      .capitalizeFirst!
                                                      .toString(),
                                                  trimLines: 2,
                                                  lessStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Red_d32416),
                                                  moreStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: green_2cbea7),
                                                  colorClickableText:
                                                      Colors.red.shade300,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      '  Read More',
                                                  trimExpandedText:
                                                      '  Read Less',
                                                  delimiter: '',
                                                  style: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 16,
                                                      color: grey_aaaaaa),
                                                ),
                                                // child: Center(
                                                //   child: setHelveticaMedium(
                                                //       controller.details.value
                                                //           .questions![1].answer!.capitalizeFirst!,
                                                //       16.sp,
                                                //       grey_aaaaaa,
                                                //       FontWeight.w500,
                                                //       FontStyle.normal,
                                                //       -0.32,
                                                //       controller.q1Expand.value == true ? null : 3),
                                                // )
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 3
                              ? GestureDetector(
                                  onTap: () {
                                    // controller.q0Expand.value = false;
                                    // controller.q1Expand.value = false;
                                    controller.q2Expand.value =
                                        !controller.q2Expand.value;
                                    // controller.q3Expand.value = false;
                                    // controller.q4Expand.value = false;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![2]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.w),
                                              child: Container(
                                                  child: ReadMoreText(
                                                controller
                                                    .details
                                                    .value
                                                    .questions![2]
                                                    .answer!
                                                    .capitalizeFirst!
                                                    .toString(),
                                                trimLines: 2,
                                                lessStyle: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 14,
                                                    color: Red_d32416),
                                                moreStyle: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 14,
                                                    color: green_2cbea7),
                                                colorClickableText:
                                                    Colors.red.shade300,
                                                trimMode: TrimMode.Line,
                                                trimCollapsedText:
                                                    '  Read More',
                                                trimExpandedText: '  Read Less',
                                                delimiter: '',
                                                style: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 16,
                                                    color: grey_aaaaaa),
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 4
                              ? GestureDetector(
                                  onTap: () {
                                    // controller.q0Expand.value = false;
                                    // controller.q1Expand.value = false;
                                    // controller.q2Expand.value = false;
                                    controller.q3Expand.value =
                                        !controller.q3Expand.value;
                                    // controller.q4Expand.value = false;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![3]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.h),
                                              child: Container(
                                                  child: ReadMoreText(
                                                controller
                                                    .details
                                                    .value
                                                    .questions![3]
                                                    .answer!
                                                    .capitalizeFirst!
                                                    .toString(),
                                                trimLines: 2,
                                                lessStyle: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 14,
                                                    color: Colors.black87),
                                                moreStyle: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 14,
                                                    color: Colors.black87),
                                                colorClickableText:
                                                    Colors.red.shade300,
                                                trimMode: TrimMode.Line,
                                                trimCollapsedText:
                                                    '  Read More',
                                                trimExpandedText: '  Read Less',
                                                delimiter: '',
                                                style: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 16,
                                                    color: grey_aaaaaa),
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 4
                              ? GestureDetector(
                                  onTap: () {
                                    if (controller.details.value.questions![4]
                                            .answer!.length >
                                        3) {
                                      // controller.q0Expand.value = false;
                                      // controller.q1Expand.value = false;
                                      // controller.q2Expand.value = false;
                                      // controller.q3Expand.value = false;
                                      controller.q4Expand.value =
                                          !controller.q4Expand.value;
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![4]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.h),
                                              child: Container(
                                                child: ReadMoreText(
                                                  controller
                                                      .details
                                                      .value
                                                      .questions![4]
                                                      .answer!
                                                      .capitalizeFirst!
                                                      .toString(),
                                                  trimLines: 2,
                                                  lessStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Colors.black87),
                                                  moreStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Colors.black87),
                                                  colorClickableText:
                                                      Colors.red.shade300,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      '  Read More',
                                                  trimExpandedText:
                                                      '  Read Less',
                                                  delimiter: '',
                                                  style: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 16,
                                                      color: grey_aaaaaa),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 5
                              ? GestureDetector(
                                  onTap: () {
                                    if (controller.details.value.questions![5]
                                            .answer!.length >
                                        3) {
                                      // controller.q0Expand.value = false;
                                      // controller.q1Expand.value = false;
                                      // controller.q2Expand.value = false;
                                      // controller.q3Expand.value = false;
                                      controller.q4Expand.value =
                                          !controller.q4Expand.value;
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![5]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.h),
                                              child: Container(
                                                child: ReadMoreText(
                                                  controller
                                                      .details
                                                      .value
                                                      .questions![5]
                                                      .answer!
                                                      .capitalizeFirst!
                                                      .toString(),
                                                  trimLines: 2,
                                                  lessStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Colors.black87),
                                                  moreStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Colors.black87),
                                                  colorClickableText:
                                                      Colors.red.shade300,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      '  Read More',
                                                  trimExpandedText:
                                                      '  Read Less',
                                                  delimiter: '',
                                                  style: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 16,
                                                      color: grey_aaaaaa),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 6
                              ? GestureDetector(
                                  onTap: () {
                                    // controller.q0Expand.value = false;
                                    controller.q6Expand.value =
                                        !controller.q6Expand.value;
                                    // controller.q2Expand.value = false;
                                    // controller.q3Expand.value = false;
                                    // controller.q4Expand.value = false;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![6]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.h),
                                              child: Container(
                                                child: ReadMoreText(
                                                  controller
                                                      .details
                                                      .value
                                                      .questions![6]
                                                      .answer!
                                                      .capitalizeFirst!
                                                      .toString(),
                                                  trimLines: 2,
                                                  lessStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Red_d32416),
                                                  moreStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Colors.black87),
                                                  colorClickableText:
                                                      Colors.red.shade300,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      '  Read More',
                                                  trimExpandedText:
                                                      '  Read Less',
                                                  delimiter: '',
                                                  style: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 16,
                                                      color: grey_aaaaaa),
                                                ),
                                                // child: Center(
                                                //   child: setHelveticaMedium(
                                                //       controller.details.value
                                                //           .questions![1].answer!.capitalizeFirst!,
                                                //       16.sp,
                                                //       grey_aaaaaa,
                                                //       FontWeight.w500,
                                                //       FontStyle.normal,
                                                //       -0.32,
                                                //       controller.q1Expand.value == true ? null : 3),
                                                // )
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 7
                              ? GestureDetector(
                                  onTap: () {
                                    // controller.q0Expand.value = false;
                                    // controller.q1Expand.value = false;
                                    controller.q7Expand.value =
                                        !controller.q7Expand.value;
                                    // controller.q3Expand.value = false;
                                    // controller.q4Expand.value = false;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![7]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.w),
                                              child: Container(
                                                  child: ReadMoreText(
                                                controller
                                                    .details
                                                    .value
                                                    .questions![7]
                                                    .answer!
                                                    .capitalizeFirst!
                                                    .toString(),
                                                trimLines: 2,
                                                lessStyle: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 14,
                                                    color: Red_d32416),
                                                moreStyle: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 14,
                                                    color: green_2cbea7),
                                                colorClickableText:
                                                    Colors.red.shade300,
                                                trimMode: TrimMode.Line,
                                                trimCollapsedText:
                                                    '  Read More',
                                                trimExpandedText: '  Read Less',
                                                delimiter: '',
                                                style: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 16,
                                                    color: grey_aaaaaa),
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 8
                              ? GestureDetector(
                                  onTap: () {
                                    // controller.q0Expand.value = false;
                                    // controller.q1Expand.value = false;
                                    // controller.q2Expand.value = false;
                                    controller.q8Expand.value =
                                        !controller.q8Expand.value;
                                    // controller.q4Expand.value = false;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![8]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.h),
                                              child: Container(
                                                  child: ReadMoreText(
                                                controller
                                                    .details
                                                    .value
                                                    .questions![8]
                                                    .answer!
                                                    .capitalizeFirst!
                                                    .toString(),
                                                trimLines: 2,
                                                lessStyle: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 14,
                                                    color: Colors.black87),
                                                moreStyle: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 14,
                                                    color: Colors.black87),
                                                colorClickableText:
                                                    Colors.red.shade300,
                                                trimMode: TrimMode.Line,
                                                trimCollapsedText:
                                                    '  Read More',
                                                trimExpandedText: '  Read Less',
                                                delimiter: '',
                                                style: const TextStyle(
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 16,
                                                    color: grey_aaaaaa),
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 9
                              ? GestureDetector(
                                  onTap: () {
                                    if (controller.details.value.questions![9]
                                            .answer!.length >
                                        9) {
                                      // controller.q0Expand.value = false;
                                      // controller.q1Expand.value = false;
                                      // controller.q2Expand.value = false;
                                      // controller.q3Expand.value = false;
                                      controller.q9Expand.value =
                                          !controller.q9Expand.value;
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![9]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.h),
                                              child: Container(
                                                child: ReadMoreText(
                                                  controller
                                                      .details
                                                      .value
                                                      .questions![9]
                                                      .answer!
                                                      .capitalizeFirst!
                                                      .toString(),
                                                  trimLines: 2,
                                                  lessStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Colors.black87),
                                                  moreStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Colors.black87),
                                                  colorClickableText:
                                                      Colors.red.shade300,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      '  Read More',
                                                  trimExpandedText:
                                                      '  Read Less',
                                                  delimiter: '',
                                                  style: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 16,
                                                      color: grey_aaaaaa),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 10
                              ? GestureDetector(
                                  onTap: () {
                                    if (controller.details.value.questions![10]
                                            .answer!.length >
                                        10) {
                                      // controller.q0Expand.value = false;
                                      // controller.q1Expand.value = false;
                                      // controller.q2Expand.value = false;
                                      // controller.q3Expand.value = false;
                                      controller.q10Expand.value =
                                          !controller.q10Expand.value;
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![10]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.h),
                                              child: Container(
                                                child: ReadMoreText(
                                                  controller
                                                      .details
                                                      .value
                                                      .questions![10]
                                                      .answer!
                                                      .capitalizeFirst!
                                                      .toString(),
                                                  trimLines: 2,
                                                  lessStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Colors.black87),
                                                  moreStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Colors.black87),
                                                  colorClickableText:
                                                      Colors.red.shade300,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      '  Read More',
                                                  trimExpandedText:
                                                      '  Read Less',
                                                  delimiter: '',
                                                  style: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 16,
                                                      color: grey_aaaaaa),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          controller.details.value.questions!.length > 11
                              ? GestureDetector(
                                  onTap: () {
                                    if (controller.details.value.questions![11]
                                            .answer!.length >
                                        11) {
                                      // controller.q0Expand.value = false;
                                      // controller.q1Expand.value = false;
                                      // controller.q2Expand.value = false;
                                      // controller.q3Expand.value = false;
                                      controller.q11Expand.value =
                                          !controller.q11Expand.value;
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: light_grey_f2f2f2)),
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 4.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, left: 16.w),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      question_icon),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Expanded(
                                                    child: setHelceticaBold(
                                                        controller
                                                            .details
                                                            .value
                                                            .questions![11]
                                                            .question!
                                                            .toUpperCase(),
                                                        12.sp,
                                                        black_121212,
                                                        FontWeight.w900,
                                                        FontStyle.normal,
                                                        0.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12.h,
                                                  left: 40.w,
                                                  bottom: 12.h),
                                              child: Container(
                                                child: ReadMoreText(
                                                  controller
                                                      .details
                                                      .value
                                                      .questions![11]
                                                      .answer!
                                                      .capitalizeFirst!
                                                      .toString(),
                                                  trimLines: 2,
                                                  lessStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Colors.black87),
                                                  moreStyle: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 14,
                                                      color: Colors.black87),
                                                  colorClickableText:
                                                      Colors.red.shade300,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      '  Read More',
                                                  trimExpandedText:
                                                      '  Read Less',
                                                  delimiter: '',
                                                  style: const TextStyle(
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontSize: 16,
                                                      color: grey_aaaaaa),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
