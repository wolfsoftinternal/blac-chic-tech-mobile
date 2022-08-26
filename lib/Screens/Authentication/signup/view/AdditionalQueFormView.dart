import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/QuestionsDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';

import '../../../../Styles/my_strings.dart';
import '../../../../Widget/EditTextDecoration.dart';

class AdditionalQueFormView extends StatefulWidget {
  const AdditionalQueFormView({Key? key}) : super(key: key);

  @override
  _AdditionalQueState createState() => _AdditionalQueState();
}

class _AdditionalQueState extends State<AdditionalQueFormView> {
  StepsController controller = Get.put(StepsController());
  final List<String> _values = [];
  @override
  void initState() {
    super.initState();
    print(":::::::::::::Call Review::::::::::::::");
  }

  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
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
            ToolbarWithHeader(
                step: 3,
                ontap: () async {
                  var preferences = MySharedPref();
                  SignupModel? myModel = await preferences
                      .getSignupModel(SharePreData.keySignupModel);
                  if (myModel!.data!.questions == null ||
                      myModel.data!.questions.toString() == '[]') {
                    Get.to(const AdditionalLastQueView());
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
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 32.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Personal Information
                      Center(
                        child: Text(str_Additional_Questions,
                            style: TextStyle(
                                color: black_121212,
                                fontWeight: FontWeight.w900,
                                fontFamily: helvetica_neu_bold,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.7,
                                fontSize: 24.sp),
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Massa nulla.
                      Center(
                        child: Text(additional_Question_Lbl1,
                            style: TextStyle(
                                color: grey_aaaaaa,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp,
                                letterSpacing: 0.8,
                                height: 1.5.h),
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.w, right: 16.w, top: 4.h, bottom: 10.h),
                        child: Text(SharePreData.strQues0,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: black_121212,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDoneDialog(context, 'q0');
                        },
                        child: Container(
                          height: 46.h,
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: Text(controller.ques0.value,
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.w, right: 16.w, top: 4.h, bottom: 10.h),
                        child: Text(SharePreData.strQues1,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: black_121212,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDoneDialog(context, 'q1');
                        },
                        child: Container(
                          height: 46.h,
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: Text(controller.ques1.value,
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.w, right: 16.w, top: 4.h, bottom: 10.h),
                        child: Text(SharePreData.strQues2,
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: black_121212,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDoneDialog(context, 'q2');
                        },
                        child: Container(
                          height: 46.h,
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: // What have you done?
                                  Text(controller.ques2.value,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: grey_aaaaaa,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.w, right: 16.w, top: 4.h, bottom: 10.h),
                        child: Text(SharePreData.strQues3,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: black_121212,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q3'),
                        child: Container(
                          height: 46.h,
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: // What have you done?
                                  Text(controller.ques3.value,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: grey_aaaaaa,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.w, right: 16.w, top: 4.h, bottom: 10.h),
                        child: Text(SharePreData.strQues4,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: black_121212,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q4'),
                        child: Container(
                          height: 46.h,
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: // What have you done?
                                  Text(controller.ques4.value,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: grey_aaaaaa,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.w, right: 16.w, top: 4.h, bottom: 10.h),
                        child: Text(SharePreData.strQues5,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: black_121212,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q5'),
                        child: Container(
                          height: 46.h,
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: // What have you done?
                                  Text(controller.ques5.value,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: grey_aaaaaa,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.w, right: 16.w, top: 4.h, bottom: 10.h),
                        child: Text(SharePreData.strQues6,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: black_121212,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q6'),
                        child: Container(
                          height: 46.h,
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: // What have you done?
                                  Text(controller.ques6.value,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: grey_aaaaaa,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.w, right: 16.w, top: 4.h, bottom: 10.h),
                        child: Text(SharePreData.strQues7,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: black_121212,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q7'),
                        child: Container(
                          height: 46.h,
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: // What have you done?
                                  Text(controller.ques7.value,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: grey_aaaaaa,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.w, right: 16.w, top: 4.h, bottom: 10.h),
                        child: Text(SharePreData.strQues8,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: black_121212,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q8'),
                        child: Container(
                          height: 46.h,
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: // What have you done?
                                  Text(controller.ques8.value,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: grey_aaaaaa,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.w, right: 16.w, top: 4.h, bottom: 10.h),
                        child: Text(SharePreData.strQues9,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: black_121212,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q9'),
                        child: Container(
                          height: 46.h,
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: // What have you done?
                                  Text(controller.ques9.value,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: grey_aaaaaa,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.w, right: 16.w, top: 4.h, bottom: 10.h),
                        child: Text(SharePreData.strQues10,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: black_121212,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q10'),
                        child: Container(
                          height: 46.h,
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w),
                              child: // What have you done?
                                  Text(controller.ques10.value,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: grey_aaaaaa,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.r),
              child: BlackNextButton(str_continue, black_121212, () {
                // if (controller.q0Controller.value.text == "" ||
                //     controller.q0Controller.value.text.isEmpty &&
                //         controller.q1Controller.value.text == "" ||
                //     controller.q1Controller.value.text.isEmpty &&
                //         controller.q2Controller.value.text == "" ||
                //     controller.q2Controller.value.text.isEmpty &&
                //         controller.q3Controller.value.text == "" ||
                //     controller.q3Controller.value.text.isEmpty &&
                //         controller.q4Controller.value.text == "" ||
                //     controller.q4Controller.value.text.isEmpty &&
                //         controller.q5Controller.value.text == "" ||
                //     controller.q5Controller.value.text.isEmpty &&
                //         controller.q6Controller.value.text == "" ||
                //     controller.q6Controller.value.text.isEmpty &&
                //         controller.q7Controller.value.text == "" ||
                //     controller.q7Controller.value.text.isEmpty &&
                //         controller.q8Controller.value.text == "" ||
                //     controller.q8Controller.value.text.isEmpty &&
                //         controller.q9Controller.value.text == "" ||
                //     controller.q9Controller.value.text.isEmpty &&
                //         controller.q10Controller.value.text == "" ||
                //     controller.q10Controller.value.text.isEmpty) {
                //   print(controller.q0Controller.value.text);
                //   snackBar(context, 'Please answer the questions');
                // } else {
                List ques = [{}];
                if (ques[0].toString() == "{}") {
                  ques.removeAt(0);
                }

                // if (controller.q0Controller.value.text.isNotEmpty) {
                ques.add({
                  '"question"': '"${SharePreData.strQues0}"',
                  '"answer"': '"${controller.q0Controller.value.text}"',
                });
                //  }

                // if (controller.q1Controller.value.text.isNotEmpty) {
                ques.add({
                  '"question"': '"${SharePreData.strQues1}"',
                  '"answer"': '"${controller.q1Controller.value.text}"',
                });
                // }
                // if (controller.q2Controller.value.text.isNotEmpty) {
                ques.add({
                  '"question"': '"${SharePreData.strQues2}"',
                  '"answer"': '"${controller.q2Controller.value.text}"',
                });
                //  }
                //  if (controller.q3Controller.value.text.isNotEmpty) {
                ques.add({
                  '"question"': '"${SharePreData.strQues3}"',
                  '"answer"': '"${controller.q3Controller.value.text}"',
                });
                //  }
                // if (controller.q4Controller.value.text.isNotEmpty) {
                ques.add({
                  '"question"': '"${SharePreData.strQues4}"',
                  '"answer"': '"${controller.q4Controller.value.text}"',
                });
                //  }
                //  if (controller.q5Controller.value.text.isNotEmpty) {
                ques.add({
                  '"question"': '"${SharePreData.strQues5}"',
                  '"answer"': '"${controller.q5Controller.value.text}"',
                });
                //  }
                //  if (controller.q6Controller.value.text.isNotEmpty) {
                ques.add({
                  '"question"': '"${SharePreData.strQues6}"',
                  '"answer"': '"${controller.q6Controller.value.text}"',
                });
                //   }
                //  if (controller.q7Controller.value.text.isNotEmpty) {
                ques.add({
                  '"question"': '"${SharePreData.strQues7}"',
                  '"answer"': '"${controller.q7Controller.value.text}"',
                });
                //   }
                // if (controller.q8Controller.value.text.isNotEmpty) {
                ques.add({
                  '"question"': '"${SharePreData.strQues8}"',
                  '"answer"': '"${controller.q8Controller.value.text}"',
                });
                // }
                //  if (controller.q9Controller.value.text.isNotEmpty) {
                ques.add({
                  '"question"': '"${SharePreData.strQues9}"',
                  '"answer"': '"${controller.q9Controller.value.text}"',
                });
                //  }
                //  if (controller.q10Controller.value.text.isNotEmpty) {
                ques.add({
                  '"question"': '"${SharePreData.strQues10}"',
                  '"answer"': '"${controller.q10Controller.value.text}"',
                });
                // }

                print(ques);

                List itemList = [];

                itemList.clear();
                for (var item in ques) {
                  itemList.add(item);
                }
                controller.questions.clear();
                controller.questions.value = itemList;

                print(controller.questions.value);
                checkNet(context).then((value) {
                  controller.questionsInfoAPI(context, 'normal',
                      ScreenMove: "Register_Flow_Que");
                });
                print(ques);
                //}
              }),
            )
          ],
        ),
      ),
    );
  }

  void showDoneDialog(BuildContext context, quesIndex) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return QuestionsDialog(quesIndex);
        });
  }
}
