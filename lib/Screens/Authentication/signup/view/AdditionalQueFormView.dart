import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/Chip.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Home/BottomNavigation.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/QuestionsDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_tag_editor/tag_editor.dart';

import '../../../../Layout/BlackButtonDialog.dart';
import '../../../../Layout/InputTextLayout.dart';
import '../../../../Styles/my_height.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utilities/TextfieldUtility.dart';
import '../../../../Widget/EditTextDecoration.dart';

class AdditionalQueFormView extends StatefulWidget {
  const AdditionalQueFormView({Key? key}) : super(key: key);

  @override
  _AdditionalQueState createState() => _AdditionalQueState();
}

class _AdditionalQueState extends State<AdditionalQueFormView> {
  StepsController controller = Get.put(StepsController());
  List<String> _values = [];
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
                  if (myModel!.data!.questions == null || myModel.data!.questions.toString() == '[]') {
                    Get.to(const AdditionalLastQueView());
                  } else if (myModel.data!.questions == null || myModel.data!.questions.toString() == '[]') {
                    String lastQuestionsInfo = "";
                    for (int i = 0; i < myModel.data!.questions!.length; i++) {
                      if (myModel.data!.questions![i].type == "additional") {
                        lastQuestionsInfo = "Done";
                      }
                    }
                    if (lastQuestionsInfo != "Done") {
                      Get.to(AdditionalLastQueView());
                    } else {
                      Get.offAll(BottomNavigation());
                    }
                  } else {
                    Get.offAll(BottomNavigation());
                  }
                }),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
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
                                fontSize: 24.sp),
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
                        height: 32.h,
                      ),

                      GestureDetector(
                        onTap: () {
                          showDoneDialog(context, 'q1');
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Padding(
                            padding:  EdgeInsets.all(16.r),
                            child: // What have you done?
                                Text(controller.ques1.value,
                                    maxLines: 1,
                                    style:  TextStyle(
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
                      SizedBox(
                        height: 16.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDoneDialog(context, 'q2');
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Padding(
                            padding:  EdgeInsets.all(16.r),
                            child: // What have you done?
                                Text(controller.ques2.value,
                                    maxLines: 1,
                                    style:  TextStyle(
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
                      SizedBox(
                        height: 16.h,
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q3'),
                        child: Container(
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Padding(
                            padding:  EdgeInsets.all(16.r),
                            child: // What have you done?
                                Text(controller.ques3.value,
                                    maxLines: 1,
                                    style:  TextStyle(
                                        color: grey_aaaaaa,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q4'),
                        child: Container(
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Padding(
                            padding:  EdgeInsets.all(16.r),
                            child: // What have you done?
                                Text(controller.ques4.value,
                                    maxLines: 1,
                                    style:  TextStyle(
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
                      SizedBox(
                        height: 16.h,
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q5'),
                        child: Container(
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Padding(
                            padding:  EdgeInsets.all(16.sp),
                            child: // What have you done?
                                Text(controller.ques5.value,
                                    maxLines: 1,
                                    style:  TextStyle(
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
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(24.r),
              child: BlackNextButton(str_continue, black_121212, () {
                if (controller.q1Controller.value.text.isEmpty &&
                    controller.q2Controller.value.text.isEmpty &&
                    controller.q3Controller.value.text.isEmpty &&
                    controller.q4Controller.value.text.isEmpty &&
                    controller.q5Controller.value.text.isEmpty) {
                  snackBar(context, 'Please answer the questions');
                } else {
                  List ques = [{}];
                  if (ques[0].toString() == "{}") {
                    ques.removeAt(0);
                  }

                  if (controller.q1Controller.value.text.isNotEmpty) {
                    ques.add({
                      '"question"': '"${SharePreData.strQues1}"',
                      '"answer"': '"${controller.q1Controller.value.text}"',
                    });
                  }
                  if (controller.q2Controller.value.text.isNotEmpty) {
                    ques.add({
                      '"question"': '"${SharePreData.strQues2}"',
                      '"answer"': '"${controller.q2Controller.value.text}"',
                    });
                  }
                  if (controller.q3Controller.value.text.isNotEmpty) {
                    ques.add({
                      '"question"': '"${SharePreData.strQues3}"',
                      '"answer"': '"${controller.q3Controller.value.text}"',
                    });
                  }
                  if (controller.q4Controller.value.text.isNotEmpty) {
                    ques.add({
                      '"question"': '"${SharePreData.strQues4}"',
                      '"answer"': '"${controller.q4Controller.value.text}"',
                    });
                  }
                  if (controller.q5Controller.value.text.isNotEmpty) {
                    ques.add({
                      '"question"': '"${SharePreData.strQues5}"',
                      '"answer"': '"${controller.q5Controller.value.text}"',
                    });
                  }

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
                    controller.questionsInfoAPI(context, 'normal');
                  });
                  print(ques);
                }
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
