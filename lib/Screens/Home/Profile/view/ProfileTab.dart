import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => controller.details.value.pastJobs.toString() == "[]" ||
                controller.details.value.pastJobs == null &&
                    controller.details.value.educations.toString() == "[]" ||
                controller.details.value.educations == null &&
                    controller.details.value.dateOfBirth == null &&
                    controller.details.value.questions.toString() == "[]" ||
                controller.details.value.questions == null
            ? Container(
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
                padding:  EdgeInsets.only(left: 24.w, right: 24.w),
                child: ListView(
                  physics: ScrollPhysics(), // <-- this will disable scroll
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
                          padding:  EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: white_ffffff,
                                borderRadius: BorderRadius.circular(4.r),
                                border:
                                Border.all(color: light_grey_f2f2f2)),
                            child: Padding(
                              padding:  EdgeInsets.only(bottom: 4.h),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 16.h, left: 16.w),
                                    child: setHelceticaBold(
                                        'PAST JOBS',
                                        12.sp,
                                        black_121212,
                                        FontWeight.w600,
                                        FontStyle.normal,
                                        -0.24),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 12.h, left: 16.w),
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount: controller
                                            .details.value.pastJobs!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:  EdgeInsets.only(
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
                                                      ? SvgPicture.asset(
                                                    placeholder,
                                                    height: 32.h,
                                                    width: 32.w,
                                                    fit: BoxFit.cover,
                                                  )
                                                      : CachedNetworkImage(
                                                    imageUrl:
                                                    controller
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
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                        downloadProgress) =>
                                                        SvgPicture
                                                            .asset(
                                                          placeholder,
                                                          height: MediaQuery.of(
                                                              context)
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
                                                          height: MediaQuery.of(
                                                              context)
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
                                                    padding:
                                                    EdgeInsets
                                                        .only(
                                                        left: 12.w, right: 8.w),
                                                    child: setHelveticaMedium(
                                                        controller
                                                            .details
                                                            .value
                                                            .pastJobs![
                                                        index]
                                                            .title!
                                                            .toUpperCase() +
                                                            " @" +
                                                            controller
                                                                .details
                                                                .value
                                                                .pastJobs![
                                                            index]
                                                                .companyName!,
                                                        15.sp,
                                                        grey_aaaaaa,
                                                        FontWeight.w500,
                                                        FontStyle
                                                            .normal,
                                                        -0.28, 2),
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
                          padding:  EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: white_ffffff,
                                borderRadius: BorderRadius.circular(4.r),
                                border:
                                Border.all(color: light_grey_f2f2f2)),
                            child: Padding(
                              padding:  EdgeInsets.only(bottom: 4.h),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 16.h, left: 16.h),
                                    child: setHelceticaBold(
                                        'EDUCATION',
                                        12.sp,
                                        black_121212,
                                        FontWeight.w600,
                                        FontStyle.normal,
                                        -0.24),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 12.h, left: 16.w),
                                    child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount: controller.details
                                            .value.educations!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:
                                            EdgeInsets.only(
                                                bottom: 12.h),
                                            child: setHelveticaMedium(
                                                controller
                                                    .details
                                                    .value
                                                    .educations![
                                                index]
                                                    .schoolUniversity! +
                                                    " / " +
                                                    controller
                                                        .details
                                                        .value
                                                        .educations![
                                                    index]
                                                        .startYear! +
                                                    ' - ' +
                                                    controller
                                                        .details
                                                        .value
                                                        .educations![
                                                    index]
                                                        .endYear!,
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
                          padding:  EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: white_ffffff,
                                borderRadius: BorderRadius.circular(4.r),
                                border:
                                Border.all(color: light_grey_f2f2f2)),
                            child: Padding(
                              padding:  EdgeInsets.only(bottom: 4.h),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
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
                                            FontWeight.w600,
                                            FontStyle.normal,
                                            -0.24),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
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
                        controller.details.value.questions!.isNotEmpty
                            ? controller.details.value.questions![0].answer !=
                            null
                            ? Padding(
                          padding:  EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: white_ffffff,
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(
                                    color: light_grey_f2f2f2)),
                            child: Padding(
                              padding:
                              EdgeInsets.only(bottom: 4.h),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 16.h, left: 16.w),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(question_icon),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        setHelceticaBold(
                                            controller.details.value
                                                .questions![0].question!
                                                .toUpperCase(),
                                            12.sp,
                                            black_121212,
                                            FontWeight.w600,
                                            FontStyle.normal,
                                            -0.24),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 12.h,
                                        left: 40.w,
                                        bottom: 12.h),
                                    child: Container(
                                        child: setHelveticaMedium(
                                            controller.details.value
                                                .questions![0].answer!,
                                            16.sp,
                                            grey_aaaaaa,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            -0.32,
                                            5)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                            : Container()
                            : Container(),
                        controller.details.value.questions!.length >= 2
                            ? Padding(
                          padding:  EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: white_ffffff,
                                borderRadius: BorderRadius.circular(4.r),
                                border:
                                Border.all(color: light_grey_f2f2f2)),
                            child: Padding(
                              padding:  EdgeInsets.only(bottom: 4.h),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 16.h, left: 16.w),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(question_icon),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        setHelceticaBold(
                                            controller.details.value
                                                .questions![1].question!
                                                .toUpperCase(),
                                            12.sp,
                                            black_121212,
                                            FontWeight.w600,
                                            FontStyle.normal,
                                            -0.24),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 12.h,
                                        left: 40.w,
                                        bottom: 12.h),
                                    child: Container(
                                        child: setHelveticaMedium(
                                            controller.details.value
                                                .questions![1].answer!,
                                            16.sp,
                                            grey_aaaaaa,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            -0.32,
                                            5)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                            : Container(),
                        controller.details.value.questions!.length >= 3
                            ? Padding(
                          padding:  EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: white_ffffff,
                                borderRadius: BorderRadius.circular(4.r),
                                border:
                                Border.all(color: light_grey_f2f2f2)),
                            child: Padding(
                              padding:  EdgeInsets.only(bottom: 4.h),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 16.h, left: 16.w),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(question_icon),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: setHelceticaBold(
                                              controller.details.value
                                                  .questions![2].question!
                                                  .toUpperCase(),
                                              12.sp,
                                              black_121212,
                                              FontWeight.w600,
                                              FontStyle.normal,
                                              -0.24),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 12.h,
                                        left: 40.w,
                                        bottom: 12.w),
                                    child: Container(
                                        child: setHelveticaMedium(
                                            controller.details.value
                                                .questions![2].answer!,
                                            16.sp,
                                            grey_aaaaaa,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            -0.32,
                                            5)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                            : Container(),
                        controller.details.value.questions!.length >= 4
                            ? Padding(
                          padding:  EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: white_ffffff,
                                borderRadius: BorderRadius.circular(4.r),
                                border:
                                Border.all(color: light_grey_f2f2f2)),
                            child: Padding(
                              padding:  EdgeInsets.only(bottom: 4.h),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 16.h, left: 16.w),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(question_icon),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        setHelceticaBold(
                                            controller.details.value
                                                .questions![3].question!
                                                .toUpperCase(),
                                            12.sp,
                                            black_121212,
                                            FontWeight.w600,
                                            FontStyle.normal,
                                            -0.24),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 12.h,
                                        left: 40.w,
                                        bottom: 12.h),
                                    child: Container(
                                        child: setHelveticaMedium(
                                            controller.details.value
                                                .questions![3].answer!,
                                            16.sp,
                                            grey_aaaaaa,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            -0.32,
                                            5)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                            : Container(),
                        controller.details.value.questions!.length >= 5
                            ? Padding(
                          padding:  EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: white_ffffff,
                                borderRadius: BorderRadius.circular(4.r),
                                border:
                                Border.all(color: light_grey_f2f2f2)),
                            child: Padding(
                              padding:  EdgeInsets.only(bottom: 4.h),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 16.h, left: 16.w),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(question_icon),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        setHelceticaBold(
                                            controller.details.value
                                                .questions![4].question!
                                                .toUpperCase(),
                                            12.sp,
                                            black_121212,
                                            FontWeight.w600,
                                            FontStyle.normal,
                                            -0.24),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: 12.h,
                                        left: 40.w,
                                        bottom: 12.h),
                                    child: Container(
                                        child: setHelveticaMedium(
                                            controller.details.value
                                                .questions![4].answer!,
                                            16.sp,
                                            grey_aaaaaa,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            -0.32,
                                            5)),
                                  )
                                ],
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
    );
  }
}
