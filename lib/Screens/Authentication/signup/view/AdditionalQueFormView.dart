import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/Chip.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
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
            const SizedBox(
              height: 60,
            ),
            ToolbarWithHeader(
                step: 3,
                ontap: () async {
                  var preferences = MySharedPref();
                  String lastQuestionsInfo = await preferences.getStringValue(SharePreData.keyLastQuestionsInfo);

                  if(lastQuestionsInfo == ""){
                    Get.to(AdditionalLastQueView());
                  }else{
                    Get.offAll(BottomNavigation());
                  }
                }),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
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
                                fontSize: 24.0),
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Massa nulla.
                      Center(
                        child: Text(str_personal_info_lorem,
                            style: TextStyle(
                                color: grey_aaaaaa,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0,
                                height: 1.5),
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 32,
                      ),

                      GestureDetector(
                        onTap: () {
                          showDoneDialog(context, 'q1');
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: // What have you done?
                                Text(
                                  controller.ques1.value,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDoneDialog(context, 'q2');
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: // What have you done?
                                Text(
                                  controller.ques2.value,
                                  maxLines: 1, 
                                    style: const TextStyle(
                                        color: grey_aaaaaa,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    textAlign: TextAlign.left),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q3'),
                        child: Container(
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: // What have you done?
                                Text(controller.ques3.value,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: grey_aaaaaa,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    textAlign: TextAlign.left),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q4'),
                        child: Container(
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: // What have you done?
                                Text(controller.ques4.value,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: grey_aaaaaa,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    textAlign: TextAlign.left),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () => showDoneDialog(context, 'q5'),
                        child: Container(
                          width: double.infinity,
                          decoration: EditTextDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: // What have you done?
                                Text(controller.ques5.value,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: grey_aaaaaa,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
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
              padding: const EdgeInsets.all(24.0),
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
                      'answer1': controller.q1Controller.value.text,
                    });
                  }
                  if (controller.q2Controller.value.text.isNotEmpty) {
                    ques.add({
                      'answer2': controller.q2Controller.value.text,
                    });
                  }
                  if (controller.q3Controller.value.text.isNotEmpty) {
                    ques.add({
                      'answer3': controller.q3Controller.value.text,
                    });
                  }
                  if (controller.q4Controller.value.text.isNotEmpty) {
                    ques.add({
                      'answer4': controller.q4Controller.value.text,
                    });
                  }
                  if (controller.q5Controller.value.text.isNotEmpty) {
                    ques.add({
                      'answer5': controller.q5Controller.value.text,
                    });
                  }

                  print(ques);

                  List itemList = [];

                  itemList.clear();
                  for (var item in ques) {
                    itemList.add(item);
                  }
                  controller.questions.value = itemList.join(",");

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
