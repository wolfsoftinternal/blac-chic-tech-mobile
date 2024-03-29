import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/InputTextLayoutDemo.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/CompanyList.dart';
import 'package:blackchecktech/Screens/Home/Settings/controller/SettingsController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextfieldUtility.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  SettingsController controller = Get.put(SettingsController());
  StepsController stepsController = Get.put(StepsController());
  SignupModel? myModel;
  bool checkColor = false;
  bool checkFillColor = true;

  List cards = [""];
  List<Map> companyDetails = [{}];

  List<String> pastJobImage = [];
  List<String> pastJobId = [];
  List<TextEditingController> pastCompanyTitleController = [];
  List<TextEditingController> pastCompanyNameController = [];
  List<TextEditingController> pastCompanyWebsiteController = [];
  List<bool> pastJob = [];

  List cardsEducation = [""];
  List<Map> details = [{}];

  List<TextEditingController> universityController = [];
  List<TextEditingController> startyearController = [];
  List<TextEditingController> endyearController = [];
  List<bool> education = [];

  DateTime? startDate;

  List ques = [{}];

  @override
  void initState() {
    super.initState();
    stepsController.industryList.clear();
    stepsController.industryNameList.clear();
    stepsController.industryName = null;
    stepsController.industryListAPI(context);

    for (var element in cards) {
      var titleController = TextEditingController(text: element);
      var nameController = TextEditingController(text: element);
      var websiteController = TextEditingController(text: element);
      var image = element;
      var id = element;
      var job = true;

      pastCompanyTitleController.add(titleController);
      pastCompanyNameController.add(nameController);
      pastCompanyWebsiteController.add(websiteController);
      pastJobImage.add(image);
      pastJobId.add(id);
      pastJob.add(job);
    }

    for (var element in cardsEducation) {
      var university = TextEditingController(text: element);
      var startyear = TextEditingController(text: element);
      var endyear = TextEditingController(text: element);
      var edu = true;

      universityController.add(university);
      startyearController.add(startyear);
      endyearController.add(endyear);
      education.add(edu);
    }
    init();
  }

  init() async {
    var preferences = MySharedPref();
    myModel = await preferences.getSignupModel(SharePreData.keySignupModel);

    stepsController.currentTitleController.value.text =
        myModel!.data!.currentJobs!.title ?? "";
    stepsController.currentCompanyLogo.value =
        myModel!.data!.currentJobs!.logo ?? "";
    stepsController.companyName.value =
        myModel!.data!.currentJobs!.companyName ?? "";
    stepsController.currentCompanyWebsiteController.value.text =
        myModel!.data!.currentJobs!.website ?? "";
    // stepsController.q1Controller.value.text = myModel!.data!.aboutUs ?? "";
    stepsController.q1Controller.value.text =
        myModel!.data!.questions!.length > 1
            ? myModel!.data!.questions![0].answer ?? ""
            : "";
    stepsController.q2Controller.value.text =
        myModel!.data!.questions!.length > 2
            ? myModel!.data!.questions![1].answer ?? ""
            : "";
    stepsController.q3Controller.value.text =
        myModel!.data!.questions!.length > 3
            ? myModel!.data!.questions![2].answer ?? ""
            : "";

    stepsController.q4Controller.value.text =
        myModel!.data!.questions!.length > 4
            ? myModel!.data!.questions![3].answer ?? ""
            : "";
    stepsController.q5Controller.value.text =
        myModel!.data!.questions!.length > 5
            ? myModel!.data!.questions![4].answer ?? ""
            : "";
    stepsController.q6Controller.value.text =
        myModel!.data!.questions!.length > 6
            ? myModel!.data!.questions![5].answer ?? ""
            : "";
    stepsController.q7Controller.value.text =
        myModel!.data!.questions!.length > 7
            ? myModel!.data!.questions![6].answer ?? ""
            : "";
    stepsController.q8Controller.value.text =
        myModel!.data!.questions!.length > 8
            ? myModel!.data!.questions![7].answer ?? ""
            : "";
    stepsController.q9Controller.value.text =
        myModel!.data!.questions!.length > 9
            ? myModel!.data!.questions![8].answer ?? ""
            : "";
    stepsController.q10Controller.value.text =
        myModel!.data!.questions!.length > 10
            ? myModel!.data!.questions![9].answer ?? ""
            : "";

    setState(() {});
    if (myModel != null) {
      for (var element in myModel!.data!.pastJobs!) {
        print("Logo Data :: " + element.toJson().toString());
        var image = element.logo ?? "";
        var titleController = TextEditingController(text: element.title);
        var nameController = TextEditingController(text: element.companyName);
        var websiteController = TextEditingController(text: element.website);
        var logoId = element.logoId ?? "";
        var job = true;
        print("Logo Id :: " +
            logoId.toString() +
            " ::: Index :: " +
            nameController.toString());
        pastJobImage.add(image);
        pastJobId.add(logoId.toString());
        pastCompanyTitleController.add(titleController);
        pastCompanyNameController.add(nameController);
        pastCompanyWebsiteController.add(websiteController);
        pastJob.add(job);

        if (pastCompanyTitleController[0].text == "") {
          cards.removeAt(0);
          pastCompanyNameController.removeAt(0);
          pastCompanyTitleController.removeAt(0);
          pastCompanyWebsiteController.removeAt(0);
          pastJobImage.removeAt(0);
          pastJobId.removeAt(0);
          pastJob.removeAt(0);
        }

        cards.add("");
      }

      for (var element in myModel!.data!.educations!) {
        var university = TextEditingController(text: element.schoolUniversity);
        var startyear = TextEditingController(text: element.startYear);
        var endyear = TextEditingController(text: element.endYear);
        var edu = true;

        universityController.add(university);
        startyearController.add(startyear);
        endyearController.add(endyear);
        education.add(edu);

        if (universityController[0].text == "") {
          cardsEducation.removeAt(0);
          universityController.removeAt(0);
          startyearController.removeAt(0);
          endyearController.removeAt(0);
          education.removeAt(0);
        }

        cardsEducation.add("");
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          ToolbarWithHeaderCenterTitle("ABOUT ME"),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 24.w, right: 24.w, top: 32.h, bottom: 24.h),
                child: myModel == null
                    ? Container()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("YOUR CURRENT JOB",
                              style: TextStyle(
                                  color: black_121212,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: helvetica_neu_bold,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 1.2,
                                  fontSize: 12.sp),
                              textAlign: TextAlign.left),

                          SizedBox(
                            height: 16.h,
                          ),

                          Row(
                            children: [
                              Expanded(
                                  child: InputTextLayoutDemo(
                                      "Title",
                                      stepsController
                                          .currentTitleController.value,
                                      false,
                                      TextInputAction.next,
                                      TextInputType.text,
                                      false)),
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
                                            Get.to(const CompanyList())!
                                                .then((value) {
                                              setState(() {});
                                            });
                                          },
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Obx(
                                                  () => Expanded(
                                                    child: Column(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            'Company',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color:
                                                                    grey_aaaaaa,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    helveticaNeueNeue_medium,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize:
                                                                    11.sp),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 4.h,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                              stepsController
                                                                  .companyName
                                                                  .value,
                                                              overflow: TextOverflow
                                                                  .ellipsis,
                                                              style: TextStyle(
                                                                  color: stepsController
                                                                              .companyName
                                                                              .value ==
                                                                          'Company Name'
                                                                      ? grey_aaaaaa
                                                                      : black_121212,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      helveticaNeueNeue_medium,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize:
                                                                      14.sp)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                stepsController.companyName
                                                            .value ==
                                                        'Company Name'
                                                    ? Container()
                                                    : Flexible(
                                                        flex: 1,
                                                        child: stepsController
                                                                    .companyImage
                                                                    .value
                                                                    .isEmpty &&
                                                                stepsController
                                                                        .currentCompanyLogo
                                                                        .value ==
                                                                    ""
                                                            ? ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.r),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  placeholder,
                                                                  width: 25.w,
                                                                  height: 25.h,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              )
                                                            : ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.r),
                                                                child: stepsController
                                                                        .companyImage
                                                                        .value
                                                                        .isNotEmpty
                                                                    ? CachedNetworkImage(
                                                                        imageUrl: stepsController
                                                                            .companyImage
                                                                            .value,
                                                                        width:
                                                                            25.w,
                                                                        height:
                                                                            25.h,
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        progressIndicatorBuilder: (context,
                                                                                url,
                                                                                downloadProgress) =>
                                                                            SvgPicture.asset(
                                                                          placeholder,
                                                                          width:
                                                                              25.w,
                                                                          height:
                                                                              25.h,
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        ),
                                                                        errorWidget: (context,
                                                                                url,
                                                                                error) =>
                                                                            SvgPicture.asset(
                                                                          placeholder,
                                                                          width:
                                                                              25.w,
                                                                          height:
                                                                              25.h,
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        ),
                                                                      )
                                                                    : CachedNetworkImage(
                                                                        imageUrl: stepsController
                                                                            .currentCompanyLogo
                                                                            .value,
                                                                        width:
                                                                            25.w,
                                                                        height:
                                                                            25.h,
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        progressIndicatorBuilder: (context,
                                                                                url,
                                                                                downloadProgress) =>
                                                                            SvgPicture.asset(
                                                                          placeholder,
                                                                          width:
                                                                              25.w,
                                                                          height:
                                                                              25.h,
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        ),
                                                                        errorWidget: (context,
                                                                                url,
                                                                                error) =>
                                                                            SvgPicture.asset(
                                                                          placeholder,
                                                                          width:
                                                                              25.w,
                                                                          height:
                                                                              25.h,
                                                                          fit: BoxFit
                                                                              .fill,
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
                              // Expanded(
                              //   child: Container(
                              //     height: 48.h,
                              //     decoration: EditTextDecoration,
                              //     child: Align(
                              //       alignment: Alignment.centerLeft,
                              //       child: Padding(
                              //         padding: EdgeInsets.only(
                              //             left: 12.w, right: 12.w, ),
                              //         child: Padding(
                              //           padding: EdgeInsets.all(5.r),
                              //           child: Column(
                              //             mainAxisAlignment: MainAxisAlignment.center,
                              //             crossAxisAlignment: CrossAxisAlignment.center,
                              //             children: [
                              //               Align(
                              //                 alignment: Alignment.centerLeft,
                              //                 child: Text(
                              //                   'Company',
                              //                   textAlign: TextAlign.left,
                              //                   style: TextStyle(
                              //                       color: grey_aaaaaa,
                              //                       fontWeight:
                              //                           FontWeight.w500,
                              //                       fontFamily:
                              //                           helveticaNeueNeue_medium,
                              //                       fontStyle:
                              //                           FontStyle.normal,
                              //                       fontSize: 11.sp),
                              //                 ),
                              //               ),
                              //               SizedBox(
                              //                 height: 4.h,
                              //               ),
                              //               GestureDetector(
                              //                   onTap: () {
                              //                     Get.to(const CompanyList());
                              //                   },
                              //                   child: Align(
                              //                     alignment:
                              //                         Alignment.centerLeft,
                              //                     child: Text(
                              //                       stepsController
                              //                           .companyName.value,
                              //                       style: TextStyle(
                              //                           color: stepsController
                              //                                       .companyName
                              //                                       .value.toString().capitalize ==
                              //                                   'Company Name'
                              //                               ? grey_aaaaaa
                              //                               : black_121212,
                              //                           fontWeight:
                              //                               FontWeight.w500,
                              //                           fontFamily:
                              //                               helveticaNeueNeue_medium,
                              //                           fontStyle:
                              //                               FontStyle.normal,
                              //                           overflow: TextOverflow
                              //                               .ellipsis,
                              //                           fontSize: 14.sp),
                              //                     ),
                              //                   )),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),

                          // SizedBox(
                          //   height: 16.h,
                          // ),

                          // Container(
                          //     height: 48.h,
                          //     decoration: EditTextDecoration,
                          //     child: stepsController.industryName != null &&
                          //             stepsController.industryName == 'other'
                          //         ? Align(
                          //             alignment: Alignment.centerLeft,
                          //             child: Padding(
                          //               padding: EdgeInsets.zero,
                          //               child: Center(
                          //                 child: InputTextLayoutDemo(
                          //                     "Enter Industry",
                          //                     stepsController
                          //                         .industryController.value,
                          //                     false,
                          //                     TextInputAction.next,
                          //                     TextInputType.text,
                          //                     false,
                          //                     null,
                          //                     (val) => {
                          //                           if (val.isNotEmpty)
                          //                             {
                          //                               setState(() {
                          //                                 checkFillColor =
                          //                                     false;
                          //                                 checkColor = true;
                          //                               }),
                          //                             }
                          //                           else
                          //                             {
                          //                               setState(() {
                          //                                 checkFillColor = true;
                          //                               }),
                          //                             },
                          //                           if (val == '')
                          //                             {
                          //                               stepsController
                          //                                       .industryName =
                          //                                   null,
                          //                               setState(() {})
                          //                             }
                          //                         },
                          //                     true),
                          //               ),
                          //             ),
                          //           )
                          //         : DropdownButtonHideUnderline(
                          //             child: DropdownButton2(
                          //                 value: stepsController.industryName,
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
                          //                 itemPadding:
                          //                     const EdgeInsets.symmetric(
                          //                         horizontal: 15.0),
                          //                 onChanged: (String? newValue) {
                          //                   setState(() {
                          //                     stepsController.industryName =
                          //                         newValue!;
                          //                   });
                          //                 },
                          //                 items: stepsController
                          //                     .dropDownIndustryItems),
                          //           )),

                          SizedBox(
                            height: 25.h,
                          ),
                          // WEBSITE LINK
                          Text("WEBSITE LINK",
                              style: TextStyle(
                                  color: black_121212,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: helvetica_neu_bold,
                                  letterSpacing: 1.2,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp),
                              textAlign: TextAlign.left),

                          SizedBox(
                            height: 11.h,
                          ),

                          controller.website.value == true
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Opacity(
                                      opacity: 0.699999988079071,
                                      child: Text(
                                          stepsController
                                              .currentCompanyWebsiteController
                                              .value
                                              .text,
                                          style: TextStyle(
                                              color: const Color(0xff0a84ff),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: helveticaNeue,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.sp),
                                          textAlign: TextAlign.left),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            controller.website.value = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10.w),
                                          child: SizedBox(
                                            width: 24.w,
                                            height: 24.w,
                                            child: Center(
                                              child: SvgPicture.asset(
                                                icon_edit_blue,
                                                width: 12.w,
                                                height: 12.h,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: checkFillColor == false
                                          ? checkColor == true
                                              ? orange_ff881a
                                              : light_grey_f2f2f2
                                          : light_grey_f2f2f2,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                    color: checkFillColor == false
                                        ? checkColor == true
                                            ? Colors.white
                                            : light_grey_f2f2f2
                                        : light_grey_f2f2f2,
                                  ),
                                  child: TextFormField(
                                    controller: stepsController
                                        .currentCompanyWebsiteController.value,
                                    autofocus: true,
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 15),
                                      prefixIconConstraints: BoxConstraints(
                                          maxHeight: 21.h, maxWidth: 38.w),
                                      isDense: true,
                                      hintText: stepsController
                                          .currentCompanyWebsiteController
                                          .value
                                          .text,
                                      hintStyle: TextStyle(
                                          color: grey_aaaaaa,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      border: InputBorder.none,
                                    ),
                                    cursorColor: black_121212,
                                    onEditingComplete: () {
                                      FocusScope.of(context).unfocus();
                                      FocusScope.of(context).nextFocus();
                                    },
                                    onChanged: (inputValue) {
                                      if (inputValue.isNotEmpty) {
                                        setState(() {
                                          checkFillColor = false;
                                          checkColor = true;
                                        });
                                      } else {
                                        setState(() {
                                          checkFillColor = true;
                                        });
                                      }
                                    },
                                    onFieldSubmitted: (String value) {
                                      controller.website.value = true;
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          checkFillColor = false;
                                          checkColor = false;
                                        });
                                      } else {
                                        setState(() {
                                          checkFillColor = true;
                                        });
                                      }
                                    },
                                  ),
                                ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(color: view_line_f4f6f6),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("PAST JOBS",
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: helvetica_neu_bold,
                                        letterSpacing: 1.2,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.left),
                                ListView.builder(
                                    physics: ScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: cards.length,
                                    itemBuilder: (context, index) {
                                      return pastJob[index] == true
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  top: 16.h, bottom: 12.h),
                                              child: Row(
                                                children: [
                                                  CircularProfileAvatar(
                                                    '',
                                                    radius: 16,
                                                    child: pastJobImage[index]
                                                            .isEmpty
                                                        ? SvgPicture.asset(
                                                            placeholder,
                                                            height: 32.h,
                                                            width: 32.w,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : CachedNetworkImage(
                                                            imageUrl:
                                                                pastJobImage[
                                                                    index],
                                                            width: 32.w,
                                                            height: 32.h,
                                                            fit: BoxFit.cover,
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        downloadProgress) =>
                                                                    SvgPicture
                                                                        .asset(
                                                              placeholder,
                                                              width: 32.w,
                                                              height: 32.h,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    SvgPicture
                                                                        .asset(
                                                              placeholder,
                                                              width: 32.w,
                                                              height: 32.h,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                  ),
                                                  pastCompanyTitleController[
                                                                      index]
                                                                  .value
                                                                  .text !=
                                                              '' &&
                                                          pastCompanyNameController[
                                                                      index]
                                                                  .value
                                                                  .text !=
                                                              ''
                                                      ? SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 12.w),
                                                            child: Text(
                                                                '${pastCompanyTitleController[index].value.text.toString().capitalizeFirst ?? ""} @${pastCompanyNameController[index].value.text.toString().capitalizeFirst ?? ""}',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color:
                                                                        grey_aaaaaa,
                                                                    fontFamily:
                                                                        helveticaNeueNeue_medium,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontSize:
                                                                        14.sp),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left),
                                                          ),
                                                        )
                                                      : Container(),
                                                  Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      pastJob[index] =
                                                          !pastJob[index];
                                                      setState(() {});
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10.w),
                                                      child: SizedBox(
                                                        width: 24.w,
                                                        height: 24.w,
                                                        child: Center(
                                                          child:
                                                              SvgPicture.asset(
                                                            icon_edit_blue,
                                                            width: 12.w,
                                                            height: 12.w,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Padding(
                                              padding:
                                                  EdgeInsets.only(top: 16.h),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: checkFillColor ==
                                                                      false
                                                                  ? checkColor ==
                                                                          true
                                                                      ? orange_ff881a
                                                                      : light_grey_f2f2f2
                                                                  : light_grey_f2f2f2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            4.r)),
                                                            color: checkFillColor ==
                                                                    false
                                                                ? checkColor ==
                                                                        true
                                                                    ? Colors
                                                                        .white
                                                                    : light_grey_f2f2f2
                                                                : light_grey_f2f2f2,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 16.w,
                                                                    right: 16.w,
                                                                    top: 8.h,
                                                                    bottom:
                                                                        7.h),
                                                            child:
                                                                TextFormField(
                                                              style: TextStyle(
                                                                color:
                                                                    black_121212,
                                                                fontFamily:
                                                                    helveticaNeueNeue_medium,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              readOnly: false,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            0,
                                                                        vertical:
                                                                            0),
                                                                isDense: true,
                                                                // you can change this with the top text like you want
                                                                labelText:
                                                                    "Title",
                                                                labelStyle: const TextStyle(
                                                                    color:
                                                                        grey_aaaaaa,
                                                                    fontFamily:
                                                                        helveticaNeueNeue_medium,
                                                                    fontSize:
                                                                        14),
                                                                hintStyle: TextStyle(
                                                                    color:
                                                                        black_121212,
                                                                    fontFamily:
                                                                        helveticaNeueNeue_medium,
                                                                    fontSize:
                                                                        14.sp),
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                filled: false,
                                                              ),
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              // validator: (value) => validator(value),
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              controller:
                                                                  pastCompanyTitleController[
                                                                      index],
                                                              cursorColor:
                                                                  black_121212,
                                                              onEditingComplete:
                                                                  () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusScope.of(
                                                                        context)
                                                                    .nextFocus();
                                                              },
                                                              onChanged:
                                                                  (inputValue) {
                                                                if (inputValue
                                                                    .isNotEmpty) {
                                                                  setState(() {
                                                                    checkFillColor =
                                                                        false;
                                                                    checkColor =
                                                                        true;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    checkFillColor =
                                                                        true;
                                                                  });
                                                                }
                                                                for (int i = 0;
                                                                    i <
                                                                        pastJob
                                                                            .length;
                                                                    i++) {
                                                                  if (i !=
                                                                      index) {
                                                                    pastJob[i] =
                                                                        true;
                                                                  }
                                                                }
                                                              },
                                                              onFieldSubmitted:
                                                                  (String
                                                                      value) {
                                                                if (value
                                                                    .isNotEmpty) {
                                                                  setState(() {
                                                                    checkFillColor =
                                                                        false;
                                                                    checkColor =
                                                                        false;
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    checkFillColor =
                                                                        true;
                                                                  });
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 15.w,
                                                      ),
                                                      // Expanded(
                                                      //     child: InkWell(
                                                      // onTap: () {
                                                      //   Get.to(const CompanyList(
                                                      //           isFrom:
                                                      //               'past_job'))!
                                                      //       .then((value) {
                                                      //     pastCompanyNameController[
                                                      //             index] =
                                                      //         stepsController
                                                      //             .pastJobName
                                                      //             .value;
                                                      //     pastJobImage[
                                                      //             index] =
                                                      //         stepsController
                                                      //             .pastJobImage
                                                      //             .value;
                                                      //     setState(() {});
                                                      //   });
                                                      // },
                                                      //   child:
                                                      //       InputTextLayoutDemo(
                                                      //     "Company name",
                                                      // pastCompanyNameController[
                                                      //     index],
                                                      //     false,
                                                      //     TextInputAction.done,
                                                      //     TextInputType.text,
                                                      //     true,
                                                      //     Container(
                                                      //       // padding: const EdgeInsets.all(8.0),
                                                      //   child: pastJobImage[
                                                      //               index]
                                                      //           .isEmpty
                                                      //       ? SvgPicture
                                                      //           .asset(
                                                      //           placeholder,
                                                      //           width: 15.w,
                                                      //           height:
                                                      //               15.h,
                                                      //           fit: BoxFit
                                                      //               .cover,
                                                      //         )
                                                      //       : CachedNetworkImage(
                                                      //           imageUrl:
                                                      //               pastJobImage[
                                                      //                   index],
                                                      //           width: 15.w,
                                                      //           height:
                                                      //               15.h,
                                                      //           fit: BoxFit
                                                      //               .cover,
                                                      //           progressIndicatorBuilder: (context,
                                                      //                   url,
                                                      //                   downloadProgress) =>
                                                      //               SvgPicture
                                                      //                   .asset(
                                                      //             placeholder,
                                                      //             width:
                                                      //                 15.w,
                                                      //             height:
                                                      //                 15.h,
                                                      //             fit: BoxFit
                                                      //                 .cover,
                                                      //           ),
                                                      //           errorWidget: (context,
                                                      //                   url,
                                                      //                   error) =>
                                                      //               SvgPicture
                                                      //                   .asset(
                                                      //             placeholder,
                                                      //             width:
                                                      //                 15.w,
                                                      //             height:
                                                      //                 15.h,
                                                      //             fit: BoxFit
                                                      //                 .cover,
                                                      //           ),
                                                      //         ),
                                                      // ),
                                                      //   ),
                                                      // )),

                                                      Expanded(
                                                        flex: 1,
                                                        child: InkWell(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            for (int i = 0;
                                                                i <
                                                                    pastJob
                                                                        .length;
                                                                i++) {
                                                              if (i != index) {
                                                                pastJob[i] =
                                                                    true;
                                                              }
                                                            }
                                                            Get.to(const CompanyList(
                                                                    isFrom:
                                                                        'past_job'))!
                                                                .then((value) {
                                                              print("Logo Id :: " +
                                                                  stepsController
                                                                      .pastJobId
                                                                      .value
                                                                      .toString());
                                                              pastCompanyNameController[
                                                                          index]
                                                                      .text =
                                                                  stepsController
                                                                      .pastJobName
                                                                      .value;
                                                              pastJobImage[
                                                                      index] =
                                                                  stepsController
                                                                      .pastJobImage
                                                                      .value;
                                                              pastJobId[index] =
                                                                  stepsController
                                                                      .pastJobId
                                                                      .value
                                                                      .toString();
                                                              setState(() {});
                                                            });
                                                          },
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                              height: 48.h,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      light_grey_f2f2f2,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.r)),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                  left: 16.w,
                                                                  right: 16.w,
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        // Company name
                                                                        Text(
                                                                            "Company name",
                                                                            style: TextStyle(
                                                                                color: grey_aaaaaa,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontFamily: helveticaNeueNeue_medium,
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 10.sp),
                                                                            textAlign: TextAlign.left),
                                                                        SizedBox(
                                                                          height:
                                                                              5.h,
                                                                        ),
                                                                        // Netflix
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.20.w,
                                                                          child: Text(
                                                                              pastCompanyNameController[index].text,
                                                                              style: TextStyle(
                                                                                color: black_121212,
                                                                                fontFamily: helveticaNeueNeue_medium,
                                                                                fontStyle: FontStyle.normal,
                                                                                fontSize: 14.sp,
                                                                                overflow: TextOverflow.ellipsis,
                                                                              ),
                                                                              textAlign: TextAlign.left),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    pastJobImage[index]
                                                                            .isEmpty
                                                                        ? SvgPicture
                                                                            .asset(
                                                                            placeholder,
                                                                            width:
                                                                                25.w,
                                                                            height:
                                                                                25.h,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          )
                                                                        : CachedNetworkImage(
                                                                            imageUrl:
                                                                                pastJobImage[index],
                                                                            width:
                                                                                25.w,
                                                                            height:
                                                                                25.h,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                                                SvgPicture.asset(
                                                                              placeholder,
                                                                              width: 25.w,
                                                                              height: 25.h,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                            errorWidget: (context, url, error) =>
                                                                                SvgPicture.asset(
                                                                              placeholder,
                                                                              width: 25.w,
                                                                              height: 25.h,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 16.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      cards.length > 1
                                                          ? Expanded(
                                                              flex: 1,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  cards.removeAt(
                                                                      index);
                                                                  pastCompanyNameController
                                                                      .removeAt(
                                                                          index);
                                                                  pastCompanyTitleController
                                                                      .removeAt(
                                                                          index);
                                                                  pastCompanyWebsiteController
                                                                      .removeAt(
                                                                          index);
                                                                  pastJobImage
                                                                      .removeAt(
                                                                          index);
                                                                  pastJob
                                                                      .removeAt(
                                                                          index);
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 40.h,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            1,
                                                                        color:
                                                                            black_121212),
                                                                    color:
                                                                        white_ffffff,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.r),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                        "DELETE",
                                                                        style: TextStyle(
                                                                            color: const Color(
                                                                                0xff121212),
                                                                            fontWeight: FontWeight
                                                                                .w700,
                                                                            fontFamily:
                                                                                helveticaNeue,
                                                                            fontStyle: FontStyle
                                                                                .normal,
                                                                            fontSize: 12
                                                                                .sp),
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                      cards.length > 1
                                                          ? SizedBox(
                                                              width: 15.w,
                                                            )
                                                          : Container(),
                                                      Expanded(
                                                        flex: 1,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            pastJob[index] =
                                                                !pastJob[index];
                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            height: 40.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  black_121212,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.r),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                  "DONE",
                                                                  style: TextStyle(
                                                                      color:
                                                                          white_ffffff,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontFamily:
                                                                          helveticaNeue,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize: 12
                                                                          .sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // SizedBox(
                                                  //   height: 16.h,
                                                  // )
                                                ],
                                              ),
                                            );
                                    }),
                                SizedBox(
                                  height: 16.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (pastCompanyTitleController
                                              .last.value.text ==
                                          '') {
                                        snackBar(
                                            context, 'Enter Company Title');
                                      } else if (pastCompanyNameController
                                              .last.value.text ==
                                          '') {
                                        snackBar(context, 'Enter Company Name');
                                      } else {
                                        for (var element in cards) {
                                          var image = element;
                                          var titleController =
                                              TextEditingController(
                                                  text: element);
                                          var nameController =
                                              TextEditingController(
                                                  text: element);
                                          var websiteController =
                                              TextEditingController(
                                                  text: element);
                                          var pastid = element;
                                          var job = false;

                                          pastJobImage.add(image);
                                          pastJobId.add(pastid);
                                          pastCompanyTitleController
                                              .add(titleController);
                                          pastCompanyNameController
                                              .add(nameController);
                                          pastJob.add(job);
                                          pastCompanyWebsiteController
                                              .add(websiteController);

                                          if (element.toString() == "") {
                                            pastCompanyTitleController
                                                .remove(element);
                                          }
                                        }
                                        cards.add("");
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: black_121212),
                                      color: white_ffffff,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            icon_add_black,
                                            width: 16.w,
                                            height: 16.h,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          // Add More
                                          const Text("Add More",
                                              style: TextStyle(
                                                  color: Color(0xff121212),
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: helveticaNeue,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.0),
                                              textAlign: TextAlign.left)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            decoration:
                                const BoxDecoration(color: view_line_f4f6f6),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("EDUCATION",
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: helvetica_neu_bold,
                                        letterSpacing: 1.2,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.left),
                                ListView.builder(
                                  physics: ScrollPhysics(),
                                  itemCount: cardsEducation.length,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return education[index] == true
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 12.h, top: 16.h),
                                            child: Row(
                                              children: [
                                                // Project Manager @ Apple Inc
                                                Expanded(
                                                    flex: 1,
                                                    child: // EDUCATION
                                                        Text(
                                                            '${universityController[index].value.text} / ${startyearController[index].value.text} - ${endyearController[index].value.text}',
                                                            style: TextStyle(
                                                                color:
                                                                    grey_aaaaaa,
                                                                fontFamily:
                                                                    helveticaNeueNeue_medium,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize:
                                                                    16.sp),
                                                            textAlign: TextAlign
                                                                .left)),
                                                InkWell(
                                                  onTap: () {
                                                    education[index] =
                                                        !education[index];
                                                    setState(() {});
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10.w),
                                                    child: SizedBox(
                                                      width: 24.w,
                                                      height: 24.w,
                                                      child: Center(
                                                        child: SvgPicture.asset(
                                                          icon_edit_blue,
                                                          width: 12.w,
                                                          height: 12.w,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.only(top: 16.h),
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 48.h,
                                                    decoration:
                                                        EditTextDecoration,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 12.w,
                                                        right: 12.w,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.r),
                                                              child:
                                                                  setTextFieldNext(
                                                                universityController[
                                                                    index],
                                                                "University/School",
                                                                false,
                                                                TextInputType
                                                                    .name,
                                                                false,
                                                                "",
                                                                TextInputAction
                                                                    .next,
                                                                (value) => {
                                                                  // on Chnages
                                                                  for (int i =
                                                                          0;
                                                                      i <
                                                                          education
                                                                              .length;
                                                                      i++)
                                                                    {
                                                                      if (i !=
                                                                          index)
                                                                        {
                                                                          education[i] =
                                                                              true
                                                                        }
                                                                    }
                                                                },
                                                                () {},
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 16.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          height: 48.h,
                                                          decoration:
                                                              EditTextDecoration,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 12.w,
                                                                    right:
                                                                        12.w),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets
                                                                        .all(5
                                                                            .r),
                                                                    child:
                                                                        setDobTextFieldNext(
                                                                      startyearController[
                                                                          index],
                                                                      "Start year",
                                                                      false,
                                                                      TextInputType
                                                                          .name,
                                                                      false,
                                                                      "",
                                                                      TextInputAction
                                                                          .next,
                                                                      (value) {},
                                                                      () async {
                                                                        for (int i =
                                                                                0;
                                                                            i < education.length;
                                                                            i++) {
                                                                          if (i !=
                                                                              index) {
                                                                            education[i] =
                                                                                true;
                                                                          }
                                                                        }
                                                                        DateTime?
                                                                            pickedDate =
                                                                            await showModalBottomSheet<DateTime>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            DateTime?
                                                                                tempPickedDate =
                                                                                DateTime.now();
                                                                            return SizedBox(
                                                                              height: 250.h,
                                                                              child: Column(
                                                                                children: <Widget>[
                                                                                  Container(
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: <Widget>[
                                                                                        Padding(
                                                                                          padding: EdgeInsets.only(left: 5.w),
                                                                                          child: CupertinoButton(
                                                                                            child: const Text(
                                                                                              'Cancel',
                                                                                              style: TextStyle(color: orange_ff881a),
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsets.only(right: 5.w),
                                                                                          child: CupertinoButton(
                                                                                            child: const Text('Done', style: TextStyle(color: orange_ff881a)),
                                                                                            onPressed: () {
                                                                                              Navigator.of(context).pop(tempPickedDate);
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  const Divider(
                                                                                    height: 0,
                                                                                    thickness: 1,
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      child: YearPicker(
                                                                                        firstDate: DateTime(DateTime.now().year - 100),
                                                                                        lastDate: DateTime.now(),
                                                                                        selectedDate: DateTime.now(),
                                                                                        onChanged: (DateTime dateTime) {
                                                                                          tempPickedDate = dateTime;
                                                                                          startDate = dateTime;
                                                                                          Navigator.of(context).pop(tempPickedDate);
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                        final DateFormat
                                                                            formatter =
                                                                            DateFormat('yyyy');
                                                                        final String
                                                                            formattedDate =
                                                                            formatter.format(pickedDate!);

                                                                        startyearController[index].text =
                                                                            formattedDate;
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                SvgPicture
                                                                    .asset(
                                                                  icon_down_arrow_spinner,
                                                                  width: 12.r,
                                                                  height: 12.r,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 16.w,
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          height: 48.h,
                                                          decoration:
                                                              EditTextDecoration,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 12.w,
                                                                    right:
                                                                        12.w),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets
                                                                        .all(5
                                                                            .r),
                                                                    child:
                                                                        setDobTextFieldNext(
                                                                      endyearController[
                                                                          index],
                                                                      "End year",
                                                                      false,
                                                                      TextInputType
                                                                          .name,
                                                                      false,
                                                                      "",
                                                                      TextInputAction
                                                                          .next,
                                                                      (value) {
                                                                        for (int i =
                                                                                0;
                                                                            i < education.length;
                                                                            i++) {
                                                                          if (i !=
                                                                              index) {
                                                                            education[i] =
                                                                                true;
                                                                          }
                                                                        }
                                                                      },
                                                                      () async {
                                                                        if (startyearController[index]
                                                                            .text
                                                                            .isEmpty) {
                                                                          snackBar(
                                                                              context,
                                                                              'Enter start year');
                                                                        } else {
                                                                          DateTime?
                                                                              pickedDate =
                                                                              await showModalBottomSheet<DateTime>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              DateTime? tempPickedDate = DateTime.now();
                                                                              return SizedBox(
                                                                                height: 250.h,
                                                                                child: Column(
                                                                                  children: <Widget>[
                                                                                    Container(
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: <Widget>[
                                                                                          Padding(
                                                                                            padding: EdgeInsets.only(left: 5.w),
                                                                                            child: CupertinoButton(
                                                                                              child: const Text(
                                                                                                'Cancel',
                                                                                                style: TextStyle(color: orange_ff881a),
                                                                                              ),
                                                                                              onPressed: () {
                                                                                                Navigator.of(context).pop();
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsets.only(right: 5.w),
                                                                                            child: CupertinoButton(
                                                                                              child: const Text('Done', style: TextStyle(color: orange_ff881a)),
                                                                                              onPressed: () {
                                                                                                Navigator.of(context).pop(tempPickedDate);
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    const Divider(
                                                                                      height: 0,
                                                                                      thickness: 1,
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        child: YearPicker(
                                                                                          firstDate: startDate == null ? DateTime.parse('${startyearController[index].value.text}-01-02') : startDate!,
                                                                                          lastDate: DateTime(DateTime.now().year + 10),
                                                                                          selectedDate: DateTime.now(),
                                                                                          onChanged: (DateTime value) {
                                                                                            tempPickedDate = value;
                                                                                            Navigator.of(context).pop(tempPickedDate);
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                          final DateFormat
                                                                              formatter =
                                                                              DateFormat('yyyy');
                                                                          final String
                                                                              formattedDate =
                                                                              formatter.format(pickedDate!);

                                                                          endyearController[index].text =
                                                                              formattedDate;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                SvgPicture
                                                                    .asset(
                                                                  icon_down_arrow_spinner,
                                                                  width: 12.r,
                                                                  height: 12.r,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 16.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      cardsEducation.length > 1
                                                          ? Expanded(
                                                              flex: 1,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  cardsEducation
                                                                      .removeAt(
                                                                          index);
                                                                  universityController
                                                                      .removeAt(
                                                                          index);
                                                                  startyearController
                                                                      .removeAt(
                                                                          index);
                                                                  endyearController
                                                                      .removeAt(
                                                                          index);
                                                                  education
                                                                      .removeAt(
                                                                          index);
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 40,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        width:
                                                                            1,
                                                                        color:
                                                                            black_121212),
                                                                    color:
                                                                        white_ffffff,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.r),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                        "DELETE",
                                                                        style: TextStyle(
                                                                            color: const Color(
                                                                                0xff121212),
                                                                            fontWeight: FontWeight
                                                                                .w700,
                                                                            fontFamily:
                                                                                helveticaNeue,
                                                                            fontStyle: FontStyle
                                                                                .normal,
                                                                            fontSize: 12
                                                                                .sp),
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                      cardsEducation.length > 1
                                                          ? SizedBox(
                                                              width: 15.w,
                                                            )
                                                          : Container(),
                                                      Expanded(
                                                        flex: 1,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            education[index] =
                                                                !education[
                                                                    index];
                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            height: 40.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  black_121212,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.r),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                  "DONE",
                                                                  style: TextStyle(
                                                                      color:
                                                                          white_ffffff,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontFamily:
                                                                          helveticaNeue,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontSize: 12
                                                                          .sp),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // SizedBox(
                                                  //   height: 16.h,
                                                  // )
                                                ],
                                              ),
                                            ),
                                          );
                                  },
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (universityController
                                              .last.value.text ==
                                          '') {
                                        snackBar(context, 'Enter university');
                                      } else if (startyearController
                                              .last.value.text ==
                                          '') {
                                        snackBar(context, 'Enter start year');
                                      } else if (endyearController
                                              .last.value.text ==
                                          '') {
                                        snackBar(context, 'Enter end year');
                                      } else {
                                        for (var element in cardsEducation) {
                                          var university =
                                              TextEditingController(
                                                  text: element);
                                          var startyear = TextEditingController(
                                              text: element);
                                          var endyear = TextEditingController(
                                              text: element);
                                          var edu = false;

                                          universityController.add(university);
                                          startyearController.add(startyear);
                                          endyearController.add(endyear);
                                          education.add(edu);
                                        }

                                        cardsEducation.add("");
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: black_121212),
                                      color: white_ffffff,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            icon_add_black,
                                            width: 16.w,
                                            height: 16.h,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          // Add More
                                          const Text("Add More",
                                              style: TextStyle(
                                                  color: Color(0xff121212),
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: helveticaNeue,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.0),
                                              textAlign: TextAlign.left)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 5.h,
                          ),

                          Container(
                            width: double.infinity,
                            height: 1,
                            decoration:
                                const BoxDecoration(color: view_line_f4f6f6),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: white_ffffff,
                                      border: Border.all(
                                          width: 1, color: light_grey_f2f2f2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              question_icon,
                                              width: 16.w,
                                              height: 16.h,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: // EDUCATION
                                                    Text(
                                                        SharePreData.strQues1
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)),
                                            InkWell(
                                              onTap: () {
                                                print("QC Click");
                                                setState(() {
                                                  controller.ques1.value =
                                                      !controller.ques1.value;
                                                  controller.ques2.value = true;
                                                  controller.ques3.value = true;
                                                  controller.ques4.value = true;
                                                  controller.ques5.value = true;
                                                  controller.ques6.value = true;
                                                  controller.ques7.value = true;
                                                  controller.ques8.value = true;
                                                  controller.ques9.value = true;
                                                  controller.ques10.value =
                                                      true;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 24.w,
                                                height: 24.w,
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    icon_edit_blue,
                                                    width: 12.w,
                                                    height: 12.w,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        controller.ques1.value == true
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: ReadMoreText(
                                                  stepsController
                                                      .q1Controller.value.text,
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
                                                ))
                                            : TextField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller: stepsController
                                                    .q1Controller.value,
                                                autofocus: true,
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 15),
                                                  prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 21.h,
                                                          maxWidth: 38.w),
                                                  isDense: true,
                                                  hintText:
                                                      'Please type here..',
                                                  hintStyle: TextStyle(
                                                      color: grey_aaaaaa,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  border: InputBorder.none,
                                                ),
                                                cursorColor: black_121212,
                                                onEditingComplete: () {
                                                  controller.ques1.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                onSubmitted: (String value) {
                                                  controller.ques1.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                // stepsController.q1Controller.value.text == ""
                                //     ? Container()
                                //     :

                                SizedBox(
                                  height: 16.h,
                                ),
                                // stepsController.q1Controller.value.text == ""
                                //     ? Container()
                                //     :

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: white_ffffff,
                                      border: Border.all(
                                          width: 1, color: light_grey_f2f2f2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              question_icon,
                                              width: 16.w,
                                              height: 16.h,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: // EDUCATION
                                                    Text(
                                                        SharePreData.strQues2
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  controller.ques2.value =
                                                      !controller.ques2.value;
                                                  controller.ques1.value = true;
                                                  controller.ques3.value = true;
                                                  controller.ques4.value = true;
                                                  controller.ques5.value = true;
                                                  controller.ques6.value = true;
                                                  controller.ques7.value = true;
                                                  controller.ques8.value = true;
                                                  controller.ques9.value = true;
                                                  controller.ques10.value =
                                                      true;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 24.w,
                                                height: 24.w,
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    icon_edit_blue,
                                                    width: 12.w,
                                                    height: 12.w,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        controller.ques2.value == true
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: ReadMoreText(
                                                  stepsController
                                                      .q2Controller.value.text,
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
                                                      opcity_black_121212,
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
                                                ))
                                            : TextField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller: stepsController
                                                    .q2Controller.value,
                                                autofocus: true,
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                maxLines: 10,
                                                minLines: 1,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 15),
                                                  prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 21.h,
                                                          maxWidth: 38.w),
                                                  isDense: true,
                                                  hintText:
                                                      'Please type here..',
                                                  hintStyle: TextStyle(
                                                      color: grey_aaaaaa,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  border: InputBorder.none,
                                                ),
                                                cursorColor: black_121212,
                                                onEditingComplete: () {
                                                  controller.ques2.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                onSubmitted: (String value) {
                                                  controller.ques2.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                // stepsController.q2Controller.value.text == ""
                                //     ? Container()
                                //     :

                                SizedBox(
                                  height: 16.h,
                                ),
                                // stepsController.q2Controller.value.text == ""
                                //     ? Container()
                                //     :

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: white_ffffff,
                                      border: Border.all(
                                          width: 1, color: light_grey_f2f2f2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              question_icon,
                                              width: 16.w,
                                              height: 16.h,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: // EDUCATION
                                                    Text(
                                                        SharePreData.strQues3
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  controller.ques3.value =
                                                      !controller.ques3.value;
                                                  controller.ques1.value = true;
                                                  controller.ques2.value = true;
                                                  controller.ques4.value = true;
                                                  controller.ques5.value = true;
                                                  controller.ques6.value = true;
                                                  controller.ques7.value = true;
                                                  controller.ques8.value = true;
                                                  controller.ques9.value = true;
                                                  controller.ques10.value =
                                                      true;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 24.w,
                                                height: 24.w,
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    icon_edit_blue,
                                                    width: 12.w,
                                                    height: 12.w,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        controller.ques3.value == true
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: ReadMoreText(
                                                  stepsController
                                                      .q3Controller.value.text,
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
                                                ))
                                            : TextField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller: stepsController
                                                    .q3Controller.value,
                                                autofocus: true,
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                maxLines: 10,
                                                minLines: 1,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 15),
                                                  prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 21.h,
                                                          maxWidth: 38.w),
                                                  isDense: true,
                                                  hintText:
                                                      'Please type here..',
                                                  hintStyle: TextStyle(
                                                      color: grey_aaaaaa,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  border: InputBorder.none,
                                                ),
                                                cursorColor: black_121212,
                                                onEditingComplete: () {
                                                  controller.ques3.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                onSubmitted: (String value) {
                                                  controller.ques3.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                // stepsController.q3Controller.value.text == ""
                                //     ? Container()
                                //     :

                                SizedBox(
                                  height: 16.h,
                                ),
                                // stepsController.q3Controller.value.text == ""
                                //     ? Container()
                                //
                                //  :

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: white_ffffff,
                                      border: Border.all(
                                          width: 1, color: light_grey_f2f2f2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              question_icon,
                                              width: 16.w,
                                              height: 16.h,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: // EDUCATION
                                                    Text(
                                                        SharePreData.strQues4
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  controller.ques4.value =
                                                      !controller.ques4.value;
                                                  controller.ques1.value = true;
                                                  controller.ques3.value = true;
                                                  controller.ques2.value = true;
                                                  controller.ques5.value = true;
                                                  controller.ques6.value = true;
                                                  controller.ques7.value = true;
                                                  controller.ques8.value = true;
                                                  controller.ques9.value = true;
                                                  controller.ques10.value =
                                                      true;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 24.w,
                                                height: 24.w,
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    icon_edit_blue,
                                                    width: 12.w,
                                                    height: 12.w,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        controller.ques4.value == true
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: ReadMoreText(
                                                  stepsController
                                                      .q4Controller.value.text,
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
                                                ))
                                            : TextField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller: stepsController
                                                    .q4Controller.value,
                                                autofocus: true,
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                maxLines: 10,
                                                minLines: 1,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 15),
                                                  prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 21.h,
                                                          maxWidth: 38.w),
                                                  isDense: true,
                                                  hintText:
                                                      'Please type here..',
                                                  hintStyle: TextStyle(
                                                      color: grey_aaaaaa,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  border: InputBorder.none,
                                                ),
                                                cursorColor: black_121212,
                                                onEditingComplete: () {
                                                  controller.ques4.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                onSubmitted: (String value) {
                                                  controller.ques4.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                // stepsController.q4Controller.value.text == ""
                                //     ? Container()
                                //     :

                                SizedBox(
                                  height: 16.h,
                                ),
                                // stepsController.q4Controller.value.text == ""
                                //     ? Container()
                                //     :

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: white_ffffff,
                                      border: Border.all(
                                          width: 1, color: light_grey_f2f2f2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              question_icon,
                                              width: 16.w,
                                              height: 16.h,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: // EDUCATION
                                                    Text(
                                                        SharePreData.strQues5
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  controller.ques5.value =
                                                      !controller.ques5.value;
                                                  controller.ques1.value = true;
                                                  controller.ques3.value = true;
                                                  controller.ques4.value = true;
                                                  controller.ques2.value = true;
                                                  controller.ques6.value = true;
                                                  controller.ques7.value = true;
                                                  controller.ques8.value = true;
                                                  controller.ques9.value = true;
                                                  controller.ques10.value =
                                                      true;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 24.w,
                                                height: 24.w,
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    icon_edit_blue,
                                                    width: 12.w,
                                                    height: 12.w,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        controller.ques5.value == true
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: ReadMoreText(
                                                  stepsController
                                                      .q5Controller.value.text,
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
                                                ))
                                            : TextField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller: stepsController
                                                    .q5Controller.value,
                                                autofocus: true,
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                maxLines: 10,
                                                minLines: 1,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 15),
                                                  prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 21.h,
                                                          maxWidth: 38.w),
                                                  isDense: true,
                                                  hintText:
                                                      'Please type here..',
                                                  hintStyle: TextStyle(
                                                      color: grey_aaaaaa,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  border: InputBorder.none,
                                                ),
                                                cursorColor: black_121212,
                                                onEditingComplete: () {
                                                  controller.ques5.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                onSubmitted: (String value) {
                                                  controller.ques5.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 16.h,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: white_ffffff,
                                      border: Border.all(
                                          width: 1, color: light_grey_f2f2f2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              question_icon,
                                              width: 16.w,
                                              height: 16.h,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: // EDUCATION
                                                    Text(
                                                        SharePreData.strQues6
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  controller.ques6.value =
                                                      !controller.ques6.value;
                                                  controller.ques1.value = true;
                                                  controller.ques3.value = true;
                                                  controller.ques4.value = true;
                                                  controller.ques5.value = true;
                                                  controller.ques2.value = true;
                                                  controller.ques7.value = true;
                                                  controller.ques8.value = true;
                                                  controller.ques9.value = true;
                                                  controller.ques10.value =
                                                      true;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 24.w,
                                                height: 24.w,
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    icon_edit_blue,
                                                    width: 12.w,
                                                    height: 12.w,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        controller.ques6.value == true
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: ReadMoreText(
                                                  stepsController
                                                      .q6Controller.value.text,
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
                                                ))
                                            : TextField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller: stepsController
                                                    .q6Controller.value,
                                                autofocus: true,
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                maxLines: 10,
                                                minLines: 1,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 15),
                                                  prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 21.h,
                                                          maxWidth: 38.w),
                                                  isDense: true,
                                                  hintText:
                                                      'Please type here..',
                                                  hintStyle: TextStyle(
                                                      color: grey_aaaaaa,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  border: InputBorder.none,
                                                ),
                                                cursorColor: black_121212,
                                                onEditingComplete: () {
                                                  controller.ques6.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                onSubmitted: (String value) {
                                                  controller.ques6.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 16.h,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: white_ffffff,
                                      border: Border.all(
                                          width: 1, color: light_grey_f2f2f2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              question_icon,
                                              width: 16.w,
                                              height: 16.h,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: // EDUCATION
                                                    Text(
                                                        SharePreData.strQues7
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  controller.ques7.value =
                                                      !controller.ques7.value;
                                                  controller.ques1.value = true;
                                                  controller.ques3.value = true;
                                                  controller.ques4.value = true;
                                                  controller.ques5.value = true;
                                                  controller.ques6.value = true;
                                                  controller.ques2.value = true;
                                                  controller.ques8.value = true;
                                                  controller.ques9.value = true;
                                                  controller.ques10.value =
                                                      true;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 24.w,
                                                height: 24.w,
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    icon_edit_blue,
                                                    width: 12.w,
                                                    height: 12.w,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        controller.ques7.value == true
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: ReadMoreText(
                                                  stepsController
                                                      .q7Controller.value.text,
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
                                                ))
                                            : TextField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller: stepsController
                                                    .q7Controller.value,
                                                autofocus: true,
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                maxLines: 10,
                                                minLines: 1,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 15),
                                                  prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 21.h,
                                                          maxWidth: 38.w),
                                                  isDense: true,
                                                  hintText:
                                                      'Please type here..',
                                                  hintStyle: TextStyle(
                                                      color: grey_aaaaaa,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  border: InputBorder.none,
                                                ),
                                                cursorColor: black_121212,
                                                onEditingComplete: () {
                                                  controller.ques7.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                onSubmitted: (String value) {
                                                  controller.ques7.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 16.h,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: white_ffffff,
                                      border: Border.all(
                                          width: 1, color: light_grey_f2f2f2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              question_icon,
                                              width: 16.w,
                                              height: 16.h,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: // EDUCATION
                                                    Text(
                                                        SharePreData.strQues8
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  controller.ques8.value =
                                                      !controller.ques8.value;
                                                  controller.ques1.value = true;
                                                  controller.ques3.value = true;
                                                  controller.ques4.value = true;
                                                  controller.ques5.value = true;
                                                  controller.ques6.value = true;
                                                  controller.ques7.value = true;
                                                  controller.ques2.value = true;
                                                  controller.ques9.value = true;
                                                  controller.ques10.value =
                                                      true;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 24.w,
                                                height: 24.w,
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    icon_edit_blue,
                                                    width: 12.w,
                                                    height: 12.w,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        controller.ques8.value == true
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: ReadMoreText(
                                                  stepsController
                                                      .q8Controller.value.text,
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
                                                ))
                                            : TextField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller: stepsController
                                                    .q8Controller.value,
                                                autofocus: true,
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                maxLines: 10,
                                                minLines: 1,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 15),
                                                  prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 21.h,
                                                          maxWidth: 38.w),
                                                  isDense: true,
                                                  hintText:
                                                      'Please type here..',
                                                  hintStyle: TextStyle(
                                                      color: grey_aaaaaa,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  border: InputBorder.none,
                                                ),
                                                cursorColor: black_121212,
                                                onEditingComplete: () {
                                                  controller.ques8.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                onSubmitted: (String value) {
                                                  controller.ques8.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 16.h,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: white_ffffff,
                                      border: Border.all(
                                          width: 1, color: light_grey_f2f2f2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              question_icon,
                                              width: 16.w,
                                              height: 16.h,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: // EDUCATION
                                                    Text(
                                                        SharePreData.strQues9
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  controller.ques9.value =
                                                      !controller.ques9.value;
                                                  controller.ques1.value = true;
                                                  controller.ques3.value = true;
                                                  controller.ques4.value = true;
                                                  controller.ques5.value = true;
                                                  controller.ques6.value = true;
                                                  controller.ques7.value = true;
                                                  controller.ques8.value = true;
                                                  controller.ques2.value = true;
                                                  controller.ques10.value =
                                                      true;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 24.w,
                                                height: 24.w,
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    icon_edit_blue,
                                                    width: 12.w,
                                                    height: 12.w,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        controller.ques9.value == true
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: ReadMoreText(
                                                  stepsController
                                                      .q9Controller.value.text,
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
                                                ))
                                            : TextField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller: stepsController
                                                    .q9Controller.value,
                                                autofocus: true,
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                maxLines: 10,
                                                minLines: 1,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 15),
                                                  prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 21.h,
                                                          maxWidth: 38.w),
                                                  isDense: true,
                                                  hintText:
                                                      'Please type here..',
                                                  hintStyle: TextStyle(
                                                      color: grey_aaaaaa,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  border: InputBorder.none,
                                                ),
                                                cursorColor: black_121212,
                                                onEditingComplete: () {
                                                  controller.ques9.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                onSubmitted: (String value) {
                                                  controller.ques9.value = true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 16.h,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: white_ffffff,
                                      border: Border.all(
                                          width: 1, color: light_grey_f2f2f2)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              question_icon,
                                              width: 16.w,
                                              height: 16.h,
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: // EDUCATION
                                                    Text(
                                                        SharePreData.strQues10
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontFamily:
                                                                helveticaNeue,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  controller.ques10.value =
                                                      !controller.ques10.value;
                                                  controller.ques1.value = true;
                                                  controller.ques3.value = true;
                                                  controller.ques4.value = true;
                                                  controller.ques5.value = true;
                                                  controller.ques6.value = true;
                                                  controller.ques7.value = true;
                                                  controller.ques8.value = true;
                                                  controller.ques9.value = true;
                                                  controller.ques2.value = true;
                                                });
                                              },
                                              child: SizedBox(
                                                width: 24.w,
                                                height: 24.w,
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    icon_edit_blue,
                                                    width: 12.w,
                                                    height: 12.w,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        controller.ques10.value == true
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: ReadMoreText(
                                                  stepsController
                                                      .q10Controller.value.text,
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
                                                ))
                                            : TextField(
                                                textInputAction:
                                                    TextInputAction.done,
                                                controller: stepsController
                                                    .q10Controller.value,
                                                autofocus: true,
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                maxLines: 10,
                                                minLines: 1,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15,
                                                          vertical: 15),
                                                  prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 21.h,
                                                          maxWidth: 38.w),
                                                  isDense: true,
                                                  hintText:
                                                      'Please type here..',
                                                  hintStyle: TextStyle(
                                                      color: grey_aaaaaa,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  border: InputBorder.none,
                                                ),
                                                cursorColor: black_121212,
                                                onEditingComplete: () {
                                                  controller.ques10.value =
                                                      true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                onSubmitted: (String value) {
                                                  controller.ques10.value =
                                                      true;
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                              ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 16.h,
                                ),

                                BlackButton("Save", white_ffffff, () {
                                  controller.ques1.value = true;
                                  controller.ques2.value = true;
                                  controller.ques3.value = true;
                                  controller.ques4.value = true;
                                  controller.ques5.value = true;
                                  controller.ques6.value = true;
                                  controller.ques7.value = true;
                                  controller.ques8.value = true;
                                  controller.ques9.value = true;
                                  controller.ques10.value = true;
                                  FocusScope.of(context).unfocus();
                                  if (stepsController
                                      .q1Controller.value.text.isNotEmpty) {
                                    ques.add({
                                      '"question"':
                                          '"${SharePreData.strQues1}"',
                                      '"answer"':
                                          '"${stepsController.q1Controller.value.text}"',
                                    });
                                  }
                                  if (stepsController
                                      .q2Controller.value.text.isNotEmpty) {
                                    ques.add({
                                      '"question"':
                                          '"${SharePreData.strQues2}"',
                                      '"answer"':
                                          '"${stepsController.q2Controller.value.text}"',
                                    });
                                  }
                                  if (stepsController
                                      .q3Controller.value.text.isNotEmpty) {
                                    ques.add({
                                      '"question"':
                                          '"${SharePreData.strQues3}"',
                                      '"answer"':
                                          '"${stepsController.q3Controller.value.text}"',
                                    });
                                  }
                                  if (stepsController
                                      .q4Controller.value.text.isNotEmpty) {
                                    ques.add({
                                      '"question"':
                                          '"${SharePreData.strQues4}"',
                                      '"answer"':
                                          '"${stepsController.q4Controller.value.text}"',
                                    });
                                  }
                                  if (stepsController
                                      .q5Controller.value.text.isNotEmpty) {
                                    ques.add({
                                      '"question"':
                                          '"${SharePreData.strQues5}"',
                                      '"answer"':
                                          '"${stepsController.q5Controller.value.text}"',
                                    });
                                  }
                                  if (stepsController
                                      .q6Controller.value.text.isNotEmpty) {
                                    ques.add({
                                      '"question"':
                                          '"${SharePreData.strQues6}"',
                                      '"answer"':
                                          '"${stepsController.q6Controller.value.text}"',
                                    });
                                  }
                                  if (stepsController
                                      .q7Controller.value.text.isNotEmpty) {
                                    ques.add({
                                      '"question"':
                                          '"${SharePreData.strQues7}"',
                                      '"answer"':
                                          '"${stepsController.q7Controller.value.text}"',
                                    });
                                  }
                                  if (stepsController
                                      .q8Controller.value.text.isNotEmpty) {
                                    ques.add({
                                      '"question"':
                                          '"${SharePreData.strQues8}"',
                                      '"answer"':
                                          '"${stepsController.q8Controller.value.text}"',
                                    });
                                  }
                                  if (stepsController
                                      .q9Controller.value.text.isNotEmpty) {
                                    ques.add({
                                      '"question"':
                                          '"${SharePreData.strQues9}"',
                                      '"answer"':
                                          '"${stepsController.q9Controller.value.text}"',
                                    });
                                  }
                                  if (stepsController
                                      .q10Controller.value.text.isNotEmpty) {
                                    ques.add({
                                      '"question"':
                                          '"${SharePreData.strQues10}"',
                                      '"answer"':
                                          '"${stepsController.q10Controller.value.text}"',
                                    });
                                  }

                                  print(ques);

                                  List itemList = [];

                                  itemList.clear();
                                  for (var item in ques) {
                                    print(ques.toString());
                                    itemList.add(item);
                                  }
                                  stepsController.questions.clear();
                                  stepsController.questions.value = itemList;
                                  if (checkValidation()) {
                                    // if (stepsController
                                    //         .industryController.value.text !=
                                    //     '') {
                                    //   stepsController.industryName =
                                    //       stepsController
                                    //           .industryController.value.text;
                                    // }

                                    companyDetails.clear();
                                    for (int i = 0; i < cards.length; i++) {
                                      companyDetails.add({
                                        '"title"':
                                            '"${pastCompanyTitleController[i].text}"',
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
                                    stepsController.pastCompanyDetails.value =
                                        itemList;
                                    print(stepsController
                                        .pastCompanyDetails.value);

                                    details.clear();

                                    for (int i = 0;
                                        i < cardsEducation.length;
                                        i++) {
                                      details.add({
                                        '"university_school_name"':
                                            '"${universityController[i].text}"',
                                        '"start_year"':
                                            '"${startyearController[i].text}"',
                                        '"end_year"':
                                            '"${endyearController[i].text}"',
                                      });
                                    }

                                    if (!details.toString().contains("[{"
                                        '"university_school_name"'
                                        ": "
                                        '""'
                                        ", "
                                        '"start_year"'
                                        ": "
                                        '""'
                                        ", "
                                        '"end_year"'
                                        ": "
                                        '""'
                                        "}]")) {
                                      List itemeduList = [];

                                      itemeduList.clear();
                                      for (var item in details) {
                                        itemeduList.add(item);
                                      }
                                      stepsController.educationalDetails
                                          .clear();
                                      stepsController.educationalDetails.value =
                                          itemeduList;
                                      print(stepsController
                                          .educationalDetails.value);

                                      List itemQuesList = [];
                                      itemQuesList.clear();
                                      for (var item in ques) {
                                        itemQuesList.add(item);
                                      }
                                      stepsController.questions.clear();
                                      stepsController.questions.value =
                                          itemQuesList;
                                      checkNet(context).then((value) {
                                        stepsController.questionsInfoAPI(
                                            context, 'normal');
                                      }).then((value) {
                                        stepsController.personalInfoAPI(
                                            context, 'about_us');
                                      });
                                    }
                                  }
                                })
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool checkValidation() {
    bool nameStatus = true;
    bool titleStatus = true;
    bool universityStatus = true;
    bool startYearStatus = true;
    bool endYearStatus = true;
    bool q1 = true;
    bool q2 = true;
    bool q3 = true;
    bool q4 = true;
    bool q5 = true;
    bool q6 = true;
    bool q7 = true;
    bool q8 = true;
    bool q9 = true;
    bool q10 = true;
    if (ques[0].toString() == "{}") {
      ques.removeAt(0);
    }

    if (pastCompanyNameController.last.text == '' &&
        pastCompanyTitleController.last.text == '') {
      pastCompanyNameController.removeLast();
      pastCompanyTitleController.removeLast();
      pastJobImage.removeLast();
      pastJobId.removeLast();
      pastJob.removeLast();
      cards.removeLast();
    }

    if (universityController.last.text == '' &&
        startyearController.last.text == '' &&
        endyearController.last.text == '') {
      universityController.removeLast();
      startyearController.removeLast();
      endyearController.removeLast();
      education.removeLast();
      cardsEducation.removeLast();
    }

    for (var item in pastCompanyNameController) {
      if (item.text == '') {
        nameStatus = false;
      }
    }

    for (var item in pastCompanyTitleController) {
      if (item.text == '') {
        titleStatus = false;
      }
    }

    for (var item in universityController) {
      if (item.text == '') {
        universityStatus = false;
      }
    }

    for (var item in startyearController) {
      if (item.text == '') {
        startYearStatus = false;
      }
    }

    for (var item in endyearController) {
      if (item.text == '') {
        endYearStatus = false;
      }
    }

    if (stepsController.q1Controller.value.text.isNotEmpty) {
      ques.add({
        '"question"': '"${myModel!.data!.questions![0].question!}"',
        '"answer"': '"${stepsController.q1Controller.value.text}"',
      });
    } else {
      q1 = false;
    }

    if (stepsController.q2Controller.value.text.isNotEmpty) {
      ques.add({
        '"question"': '"${myModel!.data!.questions![1].question!}"',
        '"answer"': '"${stepsController.q2Controller.value.text}"',
      });
    } else {
      q2 = false;
    }

    if (stepsController.q3Controller.value.text.isNotEmpty) {
      ques.add({
        '"question"': '"${myModel!.data!.questions![2].question!}"',
        '"answer"': '"${stepsController.q3Controller.value.text}"',
      });
    } else {
      q3 = false;
    }

    if (stepsController.q4Controller.value.text.isNotEmpty) {
      ques.add({
        '"question"': '"${myModel!.data!.questions![3].question!}"',
        '"answer"': '"${stepsController.q4Controller.value.text}"',
      });
    } else {
      q4 = false;
    }

    if (stepsController.q5Controller.value.text.isNotEmpty) {
      ques.add({
        '"question"': '"${myModel!.data!.questions![4].question!}"',
        '"answer"': '"${stepsController.q5Controller.value.text}"',
      });
    } else {
      q5 = false;
    }

    if (stepsController.currentTitleController.value.text.isEmpty) {
      snackBar(context, 'Enter current job title');
      return false;
    } else if (stepsController.companyName.isEmpty) {
      snackBar(context, 'Enter current company name');
      return false;
    }
    //else if (stepsController.industryName == null ||
    //     stepsController.industryName.toString() == '' &&
    //         stepsController.industryController.value.text.isEmpty) {
    //   snackBar(context, 'Enter industry');
    //   return false;
    // }
    else if (stepsController
        .currentCompanyWebsiteController.value.text.isEmpty) {
      snackBar(context, 'Enter current website');
      return false;
    } else if (!RegExp(
            '^(https?://(?:www.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|www.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9].[^s]{2,}|https?://(?:www.|(?!www))[a-zA-Z0-9]+.[^s]{2,}|www.[a-zA-Z0-9]+.[^s]{2,})')
        .hasMatch(stepsController.currentCompanyWebsiteController.value.text)) {
      snackBar(context, 'Enter valid website');
      return false;
    } else if (nameStatus == false) {
      snackBar(context, 'Enter company name');
      return false;
    } else if (titleStatus == false) {
      snackBar(context, 'Enter company title');
      return false;
    } else if (universityStatus == false) {
      snackBar(context, 'Enter university');
      return false;
    } else if (startYearStatus == false) {
      snackBar(context, 'Select start year');
      return false;
    } else if (endYearStatus == false) {
      snackBar(context, 'Select end year');
      return false;
    } else if (q1 == false) {
      snackBar(context,
          'Answer ${myModel!.data!.questions![0].question!.replaceAll('?', '')}');
      return false;
    } else if (q2 == false) {
      snackBar(context,
          'Answer ${myModel!.data!.questions![1].question!.replaceAll('?', '')}');
      return false;
    } else if (q3 == false) {
      snackBar(context,
          'Answer ${myModel!.data!.questions![2].question!.replaceAll('?', '')}');
      return false;
    } else if (q4 == false) {
      snackBar(context,
          'Answer ${myModel!.data!.questions![3].question!.replaceAll('?', '')}');
      return false;
    } else if (q5 == false) {
      snackBar(context,
          'Answer ${myModel!.data!.questions![4].question!.replaceAll('?', '')}');
      return false;
    } else if (q6 == false) {
      snackBar(context,
          'Answer ${myModel!.data!.questions![5].question!.replaceAll('?', '')}');
      return false;
    } else if (q7 == false) {
      snackBar(context,
          'Answer ${myModel!.data!.questions![6].question!.replaceAll('?', '')}');
      return false;
    } else if (q8 == false) {
      snackBar(context,
          'Answer ${myModel!.data!.questions![7].question!.replaceAll('?', '')}');
      return false;
    } else if (q9 == false) {
      snackBar(context,
          'Answer ${myModel!.data!.questions![8].question!.replaceAll('?', '')}');
      return false;
    } else if (q10 == false) {
      snackBar(context,
          'Answer ${myModel!.data!.questions![9].question!.replaceAll('?', '')}');
      return false;
    } else {
      return true;
    }
  }
}
