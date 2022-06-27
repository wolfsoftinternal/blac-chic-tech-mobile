import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalQueFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/CompanyList.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
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

  bool isDeleteLast = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var element in cards) {
      var titleController = TextEditingController(text: element);
      var nameController = TextEditingController(text: element);
      var websiteController = TextEditingController(text: element);

      pastCompanyTitleController.add(titleController);
      pastCompanyNameController.add(nameController);
      pastCompanyWebsiteController.add(websiteController);
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
                      for (int i = 0; i < myModel.data!.questions!.length; i++) {
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
                                  bottom: 5.h
                                ),
                                child: Center(
                                  child: setTextFieldNext(
                                      controller.currentTitleController.value,
                                      "Title",
                                      false,
                                      TextInputType.name,
                                      false,
                                      "",
                                      TextInputAction.next,
                                      () => {
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
                                      bottom: 5.h
                                    ),
                                    child: GestureDetector(
                                        onTap: () {
                                          Get.to(const CompanyList());
                                        },
                                        child: Text(
                                          controller.companyName.value,
                                          style: TextStyle(
                                              color: controller.companyName
                                                          .value ==
                                                      'Company Name'
                                                  ? grey_aaaaaa
                                                  : black_121212,
                                              fontWeight: FontWeight.w500,
                                              fontFamily:
                                                  helveticaNeueNeue_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                        )),
                                    // child: setTextFieldNext(
                                    //   controller.currentCompanyNameController.value,
                                    //   "Company Name",
                                    //   false,
                                    //   TextInputType.name,
                                    //   false,
                                    //   "",
                                    //   TextInputAction.next,
                                    //   () => {
                                    //     // on Chnages
                                    //   },
                                    //   (){
                                    //     Get.to(CompanyList());
                                    //   },
                                    //   true,
                                    // ),
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
                                  left: 17.w,
                                  right: 17.w,
                                  top: 5.h,
                                  bottom: 5.h
                                ),
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
                              },(){},
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 32.h,
                      ),

                      Text("YOUR PAST JOB",
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
                      SizedBox(height: 16.h,),
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
                                                  bottom: 5.h
                                                ),
                                                child: setTextFieldNext(
                                                  pastCompanyTitleController[
                                                      index],
                                                  "Title",
                                                  false,
                                                  TextInputType.name,
                                                  false,
                                                  "",
                                                  TextInputAction.next,
                                                  (value) {}, (){}
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 48.h,
                                            decoration: EditTextDecoration,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: 17.w,
                                                right: 17.w,
                                                top: 14.h,
                                              ),
                                              child: GestureDetector(
                                              onTap: () {
                                                Get.to(const CompanyList(
                                                                isFrom:
                                                                    'experience_pastjob'))!
                                                            .then((value) {
                                                          pastCompanyNameController[index] =
                                                              controller.pastJobController[index];
                                                          setState(() {});
                                                        });
                                              },
                                              child: Text(pastCompanyNameController[index].value.text == '' ? 'Company Name' :
                                                pastCompanyNameController[index].value.text,
                                                style: TextStyle(
                                                    color: pastCompanyNameController[index].value.text == ''
                                                        ? grey_aaaaaa
                                                        : black_121212,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                              )),
                                              // child: setTextFieldNext(
                                              //   pastCompanyNameController[
                                              //       index],
                                              //   "Company Name",
                                              //   false,
                                              //   TextInputType.name,
                                              //   false,
                                              //   "",
                                              //   TextInputAction.next,
                                              //   (value) {},(){}
                                              // ),
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
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 17.w,
                                            right: 17.w,
                                            top: 5.h,
                                            bottom: 5.h
                                          ),
                                          child: setTextFieldNext(
                                            pastCompanyWebsiteController[index],
                                            "Company Website",
                                            false,
                                            TextInputType.name,
                                            false,
                                            "",
                                            TextInputAction.next,
                                            (value) {}, () {}
                                          ),
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
                                            bottom: 5.h
                                          ),
                                      child: Center(
                                        child: Text("Remove Last",
                                            style: TextStyle(
                                                color: const Color(0xff121212),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: helveticaNeueNeue_medium,
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
                                isDeleteLast = true;
                                for (var element in cards) {
                                  var titleController =
                                      TextEditingController(text: element);
                                  var nameController =
                                      TextEditingController(text: element);
                                  var websiteController =
                                      TextEditingController(text: element);

                                  pastCompanyTitleController
                                      .add(titleController);
                                  pastCompanyNameController.add(nameController);
                                  pastCompanyWebsiteController
                                      .add(websiteController);

                                  if (element.toString() == "") {
                                    pastCompanyTitleController.remove(element);
                                  }
                                }
                                cards.add("");
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
                                            bottom: 5.h
                                          ),
                                  child: Center(
                                    child: Text("+ Add More",
                                        style: TextStyle(
                                            color: const Color(0xff121212),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: helveticaNeueNeue_medium,
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
                if (controller.checkExperienceValidation(context)) {
                  companyDetails.clear();

                  for (int i = 0; i < cards.length; i++) {
                    companyDetails.add({
                      '"title"': '"${pastCompanyTitleController[i].text}"',
                      '"company_name"':
                          '"${pastCompanyNameController[i].text}"',
                      '"website"': '"${pastCompanyWebsiteController[i].text}"',
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
              }),
            )
          ],
        ),
      ),
    );
  }
}
