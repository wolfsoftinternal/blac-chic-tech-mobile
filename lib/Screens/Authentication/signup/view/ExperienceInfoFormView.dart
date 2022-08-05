import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalQueFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/CompanyList.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/GeneralFunctions.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../Styles/my_height.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utilities/TextfieldUtility.dart';
import '../../../../Widget/EditTextDecoration.dart';
import 'EducationInfoFormView.dart';

class ExperienceInfoFormView extends StatefulWidget {
  const ExperienceInfoFormView({Key? key}) : super(key: key);

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<ExperienceInfoFormView> {
  StepsController controller = Get.put(StepsController());
  List cards = [""];
  List<Map> companyDetails = [{}];

  List<TextEditingController> pastCompanyTitleController = [];
  List<TextEditingController> pastCompanyNameController = [];
  List<TextEditingController> pastCompanyWebsiteController = [];
  List<String> pastJobImage = [];
  List<String> pastJobId = [];

  bool isDeleteLast = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.industryListAPI(context);
    for (var element in cards) {
      print("Card :: " + element.toString());
      var image = element;
      var titleController = TextEditingController(text: element);
      var nameController = TextEditingController(text: element);
      var websiteController = TextEditingController(text: element);
      var imageId = element;

      pastJobImage.add(image);
      pastCompanyTitleController.add(titleController);
      pastCompanyNameController.add(nameController);
      pastCompanyWebsiteController.add(websiteController);
      pastJobId.add(imageId);
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
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ToolbarWithHeader(
                  step: 1,
                  ontap: () async {
                    var preferences = MySharedPref();
                    SignupModel? myModel = await preferences
                        .getSignupModel(SharePreData.keySignupModel);

                    if (myModel!.data!.educations == null ||
                        myModel.data!.educations.toString() == '[]') {
                      Get.to(const EducationInfoFormView());
                    } else if (myModel.data!.questions == null ||
                        myModel.data!.questions.toString() == '[]') {
                      Get.to(const AdditionalQueFormView());
                    } else if (myModel.data!.questions == null ||
                        myModel.data!.questions.toString() == '[]') {
                      String lastQuestionsInfo = "";
                      for (int i = 0;
                          i < myModel.data!.questions!.length;
                          i++) {
                        if (myModel.data!.questions![i].type == "additional") {
                          lastQuestionsInfo = "Done";
                        }
                      }
                      if (lastQuestionsInfo != "Done") {
                        Get.to(const AdditionalLastQueView());
                      } else {
                        Get.offAll(HomePage());
                      }
                    } else {
                      Get.offAll(HomePage());
                    }
                  }),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Personal Information
                      Center(
                        child: Text(str_Experience,
                            style: TextStyle(
                                color: black_121212,
                                fontWeight: FontWeight.w900,
                                fontFamily: helvetica_neu_bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 24.sp,
                                letterSpacing: 0.7),
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Massa nulla.
                      Center(
                        child: Text(str_personal_info_lorem,
                            style: TextStyle(
                                color: grey_aaaaaa,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp,
                                height: 1.5.h),
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),

                      // InputTextLayout(
                      //     "Date of birth",
                      //     _birhtdayController,
                      //     false,
                      //     TextInputAction.next,
                      //     TextInputType.emailAddress),

                      // YOUR CURRENT JOB
                      Text("YOUR CURRENT JOB",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.8.sp,
                              fontSize: 12.sp),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 48.h,
                              decoration: EditTextDecoration,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 17.w,
                                    right: 17.w,
                                    top: 5.h,
                                    bottom: 5.h),
                                child: Center(
                                  child: setTextFieldNext(
                                      controller.currentTitleController.value,
                                      "Title",
                                      false,
                                      TextInputType.name,
                                      false,
                                      "",
                                      TextInputAction.next,
                                      (val) => {
                                            // on Chnages
                                          },
                                      () {}),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: Container(
                                height: 48.h,
                                decoration: EditTextDecoration,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 17.w,
                                        right: 17.w,
                                        top: 5.h,
                                        bottom: 5.h),
                                    child: InkWell(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        Get.to(const CompanyList());
                                      },
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  controller.companyName.value,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: controller
                                                                  .companyName
                                                                  .value ==
                                                              'Company Name'
                                                          ? grey_aaaaaa
                                                          : black_121212,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp)),
                                            ),
                                            Flexible(
                                              child: controller
                                                      .companyImage.isEmpty
                                                  ? SizedBox(
                                                      width: 25.w,
                                                      height: 25.h,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.r),
                                                        child: SvgPicture.asset(
                                                          placeholder,
                                                          width: 25.w,
                                                          height: 25.h,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.r),
                                                      child: CachedNetworkImage(
                                                        imageUrl: controller
                                                            .companyImage.value,
                                                        width: 25.w,
                                                        height: 25.h,
                                                        fit: BoxFit.fill,
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    downloadProgress) =>
                                                                SvgPicture
                                                                    .asset(
                                                          placeholder,
                                                          width: 25.w,
                                                          height: 25.h,
                                                          fit: BoxFit.fill,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            SvgPicture.asset(
                                                          placeholder,
                                                          width: 25.w,
                                                          height: 25.h,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // child: GestureDetector(
                                    //     onTap: () {
                                    //       Get.to(const CompanyList());
                                    //     },
                                    // child: Text(
                                    //   controller.companyName.value,
                                    //   style: TextStyle(
                                    //       color: controller.companyName
                                    //                   .value ==
                                    //               'Company Name'
                                    //           ? grey_aaaaaa
                                    //           : black_121212,
                                    //       fontWeight: FontWeight.w500,
                                    //       fontFamily:
                                    //           helveticaNeueNeue_medium,
                                    //       fontStyle: FontStyle.normal,
                                    //       fontSize: 14.sp),
                                    //     )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 16.h,
                      ),

                      Container(
                        decoration: EditTextDecoration,
                        height: 48.h,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 17.w, right: 17.w, top: 5.h, bottom: 5.h),
                            child: setTextFieldNext(
                              controller.currentCompanyWebsiteController.value,
                              "Company Website",
                              false,
                              TextInputType.name,
                              false,
                              "",
                              TextInputAction.next,
                              (value) => {
                                // on Chnages
                              },
                              () {},
                            ),
                          ),
                        ),
                      ),

                      // SizedBox(
                      //   height: 16.h,
                      // ),

                      // Container(
                      //     height: 48.h,
                      //     decoration: EditTextDecoration,
                      //     child: controller.industryName != null &&
                      //             controller.industryName == 'other'
                      //         ? Align(
                      //             alignment: Alignment.centerLeft,
                      //             child: Padding(
                      //               padding: EdgeInsets.only(
                      //                   left: 17.w,
                      //                   right: 17.w,
                      //                   top: 5.h,
                      //                   bottom: 5.h),
                      //               child: Center(
                      //                 child: setTextFieldNext(
                      //                     controller.industryController.value,
                      //                     "Enter Industry",
                      //                     false,
                      //                     TextInputType.name,
                      //                     false,
                      //                     "",
                      //                     TextInputAction.next,
                      //                     (val) => {
                      //                           if (val == '')
                      //                             {
                      //                               controller.industryName =
                      //                                   null,
                      //                               setState(() {})
                      //                             }
                      //                         },
                      //                     () {},
                      //                     false,
                      //                     true),
                      //               ),
                      //             ),
                      //           )
                      //         : DropdownButtonHideUnderline(
                      //             child: DropdownButton2(
                      //                 value: controller.industryName,
                      //                 hint: Text("Select Industry",
                      //                     style: TextStyle(
                      //                         color: grey_aaaaaa,
                      //                         fontWeight: FontWeight.w500,
                      //                         fontFamily:
                      //                             helveticaNeueNeue_medium,
                      //                         fontStyle: FontStyle.normal,
                      //                         fontSize: 14.sp),
                      //                     textAlign: TextAlign.left),
                      //                 icon: SvgPicture.asset(
                      //                   icon_down_arrow_spinner,
                      //                   width: 12.w,
                      //                   height: 12.h,
                      //                 ),
                      //                 isExpanded: true,
                      //                 customItemsHeight: 4,
                      //                 iconEnabledColor: black_121212,
                      //                 iconDisabledColor: Colors.grey,
                      //                 // buttonHeight: 60,
                      //                 buttonWidth: double.infinity,
                      //                 buttonPadding: const EdgeInsets.only(
                      //                     left: 14, right: 14),
                      //                 buttonDecoration: EditTextDecoration,
                      //                 itemHeight: 42,
                      //                 itemPadding: const EdgeInsets.symmetric(
                      //                     horizontal: 15.0),
                      //                 onChanged: (String? newValue) {
                      //                   setState(() {
                      //                     controller.industryName = newValue!;
                      //                   });
                      //                 },
                      //                 items: controller.dropDownIndustryItems),
                      //           )),

                      SizedBox(
                        height: 32.h,
                      ),

                      Text("YOUR PAST JOBS",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.8,
                              fontSize: 12.sp),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 4.h,
                      ),
                      // you can add more then one.
                      Text("you can add more then one.",
                          style: TextStyle(
                              color: const Color(0xffaaaaaa),
                              fontWeight: FontWeight.w500,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.04,
                              fontSize: 12.sp),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 16.h,
                      ),
                      Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cards.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 48.h,
                                            decoration: EditTextDecoration,
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 17.w,
                                                    right: 17.w,
                                                    top: 5.h,
                                                    bottom: 5.h),
                                                child: setTextFieldNext(
                                                    pastCompanyTitleController[
                                                        index],
                                                    "Title",
                                                    false,
                                                    TextInputType.name,
                                                    false,
                                                    "",
                                                    TextInputAction.next,
                                                    (value) {},
                                                    () {}),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              Get.to(const CompanyList(
                                                      isFrom:
                                                          'experience_pastjob'))!
                                                  .then((value) {
                                                pastCompanyNameController[index]
                                                        .text =
                                                    controller.pastJobController
                                                        .value;
                                                pastJobImage[index] = controller
                                                    .pastJobImage.value;
                                                pastJobId[index] = controller
                                                    .pastJobId.value
                                                    .toString();
                                                print("pastJobId[index] ::" +
                                                    pastJobId[index]
                                                        .toString());
                                                setState(() {});
                                              });
                                            },
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                height: 48.h,
                                                decoration: BoxDecoration(
                                                    color: light_grey_f2f2f2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r)),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 16.w,
                                                    right: 16.w,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.20.w,
                                                          child: Text(
                                                              pastCompanyNameController[
                                                                              index]
                                                                          .value
                                                                          .text ==
                                                                      ''
                                                                  ? 'Company Name'
                                                                  : pastCompanyNameController[
                                                                          index]
                                                                      .text,
                                                              style: TextStyle(
                                                                color: pastCompanyNameController[index]
                                                                            .value
                                                                            .text ==
                                                                        ''
                                                                    ? grey_aaaaaa
                                                                    : black_121212,
                                                                fontFamily:
                                                                    helveticaNeueNeue_medium,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left),
                                                        ),
                                                      ),
                                                      pastJobImage[index]
                                                              .isEmpty
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.r),
                                                              child: SvgPicture
                                                                  .asset(
                                                                placeholder,
                                                                width: 25.w,
                                                                height: 25.h,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            )
                                                          : ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.r),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    pastJobImage[
                                                                        index],
                                                                width: 25.w,
                                                                height: 25.h,
                                                                fit:
                                                                    BoxFit.fill,
                                                                progressIndicatorBuilder:
                                                                    (context,
                                                                            url,
                                                                            downloadProgress) =>
                                                                        SvgPicture
                                                                            .asset(
                                                                  placeholder,
                                                                  width: 25.w,
                                                                  height: 25.h,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    SvgPicture
                                                                        .asset(
                                                                  placeholder,
                                                                  width: 25.w,
                                                                  height: 25.h,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        // Expanded(
                                        //   flex: 1,
                                        //   child: Container(
                                        //     height: 48.h,
                                        //     decoration: EditTextDecoration,
                                        //     child: Padding(
                                        //       padding: EdgeInsets.only(
                                        //         left: 17.w,
                                        //         right: 17.w,
                                        //         top: 14.h,
                                        //       ),
                                        //       child: GestureDetector(
                                        //           onTap: () {
                                        // Get.to(const CompanyList(
                                        //         isFrom:
                                        //             'experience_pastjob'))!
                                        //     .then((value) {
                                        //   pastCompanyNameController[
                                        //               index]
                                        //           .text =
                                        //       controller
                                        //           .pastJobController
                                        //           .value;
                                        //   setState(() {});
                                        // });
                                        //           },
                                        //           child: Text(
                                        //             pastCompanyNameController[
                                        //                             index]
                                        //                         .value
                                        //                         .text ==
                                        //                     ''
                                        //                 ? 'Company Name'
                                        //                 : pastCompanyNameController[
                                        //                         index]
                                        //                     .value
                                        //                     .text,
                                        //             style: TextStyle(
                                        //                 color:
                                        //                     pastCompanyNameController[
                                        //                                     index]
                                        //                                 .value
                                        //                                 .text ==
                                        //                             ''
                                        //                         ? grey_aaaaaa
                                        //                         : black_121212,
                                        //                 fontWeight:
                                        //                     FontWeight.w500,
                                        //                 fontFamily:
                                        //                     helveticaNeueNeue_medium,
                                        //                 fontStyle:
                                        //                     FontStyle.normal,
                                        //                 fontSize: 14.sp),
                                        //           )),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Container(
                                      decoration: EditTextDecoration,
                                      height: 48.h,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 17.w,
                                              right: 17.w,
                                              top: 5.h,
                                              bottom: 5.h),
                                          child: setTextFieldNext(
                                              pastCompanyWebsiteController[
                                                  index],
                                              "Company Website",
                                              false,
                                              TextInputType.name,
                                              false,
                                              "",
                                              TextInputAction.next,
                                              (value) {},
                                              () {}),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          isDeleteLast == true
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cards.removeLast();
                                      pastCompanyNameController.removeLast();
                                      pastCompanyTitleController.removeLast();
                                      pastCompanyWebsiteController.removeLast();
                                      pastJobImage.removeLast();
                                      pastJobId.removeLast();
                                      if (cards.length == 1) {
                                        isDeleteLast = false;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 48.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        border: Border.all(
                                            width: 1.w, color: black_121212)),
                                    child: // Add More
                                        Padding(
                                      padding: EdgeInsets.only(
                                          left: 17.w,
                                          right: 17.w,
                                          top: 5.h,
                                          bottom: 5.h),
                                      child: Center(
                                        child: Text("Remove Last",
                                            style: TextStyle(
                                                color: const Color(0xff121212),
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    helveticaNeueNeue_medium,
                                                fontStyle: FontStyle.normal,
                                                letterSpacing: 0.04.sp,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.left),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          isDeleteLast == true
                              ? SizedBox(
                                  height: 16.h,
                                )
                              : Container(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                // if (pastCompanyNameController.last.text == '' &&
                                //     pastCompanyTitleController.last.text ==
                                //         '' &&
                                //     pastCompanyWebsiteController
                                //             .last.value.text ==
                                //         '') {
                                //   pastCompanyNameController.removeLast();
                                //   pastCompanyTitleController.removeLast();
                                //   pastCompanyWebsiteController.removeLast();
                                //   pastJobImage.removeLast();
                                //   pastJobId.removeLast();
                                // }
                                String status = '';
                                for (var item in pastCompanyNameController) {
                                  if (item.text == '') {
                                    snackBar(context, 'Enter company name');
                                    status = 'pending';
                                  } else {
                                    status = 'done';
                                  }
                                }

                                for (var item in pastCompanyTitleController) {
                                  if (item.text == '') {
                                    snackBar(context, 'Enter company title');
                                    status = 'pending';
                                  } else {
                                    status = 'done';
                                  }
                                }

                                for (var item in pastCompanyWebsiteController) {
                                  if (item.text == '') {
                                    snackBar(context, 'Enter company website');
                                    status = 'pending';
                                  } else {
                                    status = 'done';
                                  }
                                }
                                if (status == 'done') {
                                  isDeleteLast = true;
                                  for (var element in cards) {
                                    var titleController =
                                        TextEditingController(text: element);
                                    var nameController =
                                        TextEditingController(text: element);
                                    var websiteController =
                                        TextEditingController(text: element);
                                    var image = element;
                                    var id = element;

                                    pastCompanyTitleController
                                        .add(titleController);
                                    pastCompanyNameController
                                        .add(nameController);
                                    pastCompanyWebsiteController
                                        .add(websiteController);
                                    pastJobImage.add(image);
                                    pastJobId.add(id);

                                    if (element.toString() == "") {
                                      pastCompanyTitleController
                                          .remove(element);
                                      pastCompanyNameController.remove(element);
                                      pastCompanyWebsiteController
                                          .remove(element);
                                    }
                                  }
                                  cards.add("");
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                height: 48.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    border: Border.all(
                                        width: 1.w, color: black_121212)),
                                child: // Add More
                                    Padding(
                                  padding: EdgeInsets.only(
                                      left: 17.w,
                                      right: 17.w,
                                      top: 5.h,
                                      bottom: 5.h),
                                  child: Center(
                                    child: Text("+ Add More",
                                        style: TextStyle(
                                            color: const Color(0xff121212),
                                            fontWeight: FontWeight.w500,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp),
                                        textAlign: TextAlign.left),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.r),
              child: BlackNextButton(str_continue, black_121212, () {
                print("Card :: " + pastJobId.length.toString());
                if (pastJobId.length != 0) {
                  if (controller.checkExperienceValidation(context)) {
                    if (pastCompanyNameController.last.text == '' &&
                        pastCompanyTitleController.last.text == '' &&
                        pastCompanyWebsiteController.last.value.text == '') {
                      pastCompanyNameController.removeLast();
                      pastCompanyTitleController.removeLast();
                      pastCompanyWebsiteController.removeLast();
                      pastJobImage.removeLast();
                      pastJobId.removeLast();
                    }
                    String status = '';
                    for (var item in pastCompanyNameController) {
                      if (item.text == '') {
                        snackBar(context, 'Enter company name');
                        status = 'pending';
                      } else {
                        status = 'done';
                      }
                    }

                    for (var item in pastCompanyTitleController) {
                      if (item.text == '') {
                        snackBar(context, 'Enter company title');
                        status = 'pending';
                      } else {
                        status = 'done';
                      }
                    }

                    for (var item in pastCompanyWebsiteController) {
                      if (item.text == '') {
                        snackBar(context, 'Enter company website');
                        status = 'pending';
                      } else {
                        status = 'done';
                      }
                    }

                    if (status == 'done') {
                      companyDetails.clear();

                      for (int i = 0; i < pastJobId.length; i++) {
                        companyDetails.add({
                          '"title"': '"${pastCompanyTitleController[i].text}"',
                          '"company_name"':
                              '"${pastCompanyNameController[i].text}"',
                          '"website"':
                              '"${pastCompanyWebsiteController[i].text}"',
                          '"logo"': '"${pastJobId[i].toString()}"'
                        });
                      }

                      List itemList = [];

                      itemList.clear();
                      for (var item in companyDetails) {
                        itemList.add(item);
                      }
                      controller.pastCompanyDetails.value = itemList;
                      print(controller.pastCompanyDetails.value);

                      checkNet(context).then((value) {
                        controller.experienceInfoAPI(context);
                      });
                    }
                  }
                } else {
                  snackBar(context, 'Add Past Job');
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
