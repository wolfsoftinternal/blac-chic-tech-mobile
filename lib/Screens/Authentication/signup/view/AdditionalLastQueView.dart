import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/login/view/LoginView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Home/BottomNavigation.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../Layout/BlackButtonDialog.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Widget/EditTextDecoration.dart';
import 'AdditionalQueFormView.dart';

class AdditionalLastQueView extends StatefulWidget {
  const AdditionalLastQueView({Key? key}) : super(key: key);

  @override
  _AdditionalQueSecondState createState() => _AdditionalQueSecondState();
}

class _AdditionalQueSecondState extends State<AdditionalLastQueView> {
   StepsController controller = Get.put(StepsController());  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white_ffffff,
      body: Obx(
        () => Column(
    children: [
        const SizedBox(
          height: 60,
        ),
        ToolbarWithHeader(
          step: 4,
          ontap: (){
            Get.offAll(BottomNavigation());
          }
        ),
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

                  Container(
                    decoration: EditTextDecoration,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 2, right: 24, left: 24),
                            child: TextFormField(
                              controller: controller.addtionalController.value,
                              minLines: 2,
                              maxLines: 15,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                  color: black_121212,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: 'What should the world know about you ? \nPlease describe it.',
                                hintStyle: TextStyle(
                                    color: grey_aaaaaa,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: helveticaNeueNeue_medium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          margin: EdgeInsets.all(16),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                // Minimal in 10 word
                                Text("Minimal in 10 word",
                                    style: const TextStyle(
                                        color: const Color(0xff121212),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NeueHelvetica",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    textAlign: TextAlign.left),

                                SvgPicture.asset(
                                  icon_info,
                                  width: 20,
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlackNextButton(str_done, black_121212, () {
            if(controller.addtionalController.value.text.isEmpty){
              snackBar(context, 'Please answer the question');
            }else if(RegExp(r"[\w-._]+").allMatches(controller.addtionalController.value.text).length < 10){
              snackBar(context, 'Minimum 10 words required');
            }else{
              controller.questions.value = controller.addtionalController.value.text;
              checkNet(context).then((value) {
                controller.questionsInfoAPI(context, 'additional');
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

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showDoneDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)), //this right here
            child: Container(
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // WHAT HAVE YOU DONE ?
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: Text("WHAT HAVE YOU DONE ?",
                          style: const TextStyle(
                              color: black_121212,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left),
                    ),
                  ),

                  Container(
                    height: 0.7,
                    color: Colors.black12,
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 24, left: 24),
                      child: TextFormField(
                        minLines: 2,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w500,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Please type here...',
                          hintStyle: TextStyle(
                              color: grey_aaaaaa,
                              fontWeight: FontWeight.w500,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: BlackButtonDialog("Done", white_ffffff, () {}),
                  )
                ],
              ),
            ),
          );
        });
  }
}
