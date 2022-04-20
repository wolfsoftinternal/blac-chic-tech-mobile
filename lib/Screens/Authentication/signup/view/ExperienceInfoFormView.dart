import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
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
  /*Spinner Code is here*/

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("USA",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "USA"),
      const DropdownMenuItem(
          child: Text("Canada",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "Canada"),
      const DropdownMenuItem(
          child: Text("Brazil",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "Brazil"),
      const DropdownMenuItem(
          child: Text("England",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "England"),
    ];
    return menuItems;
  }

  String? selectedValue;
  final _dropdownFormKey = GlobalKey<FormState>();

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        children: [
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
                      child: Text(str_Experience,
                          style: const TextStyle(
                              color: black_121212,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 24.0),
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Massa nulla.
                    Center(
                      child: Text(str_personal_info_lorem,
                          style: const TextStyle(
                              color: grey_aaaaaa,
                              fontWeight: FontWeight.w500,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              height: 1.5),
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(
                      height: 32,
                    ),

                    // InputTextLayout(
                    //     "Date of birth",
                    //     _birhtdayController,
                    //     false,
                    //     TextInputAction.next,
                    //     TextInputType.emailAddress),

                    // YOUR CURRENT JOB
                    const Text("YOUR CURRENT JOB",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: helvetica_neu_bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.left),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: HeightData.fifty_seven,
                            decoration: EditTextDecoration,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: setTextFieldNext(
                                    _textController,
                                    "Title",
                                    false,
                                    TextInputType.emailAddress,
                                    false,
                                    "",
                                    TextInputAction.next,
                                    () => {
                                      // on Chnages
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: HeightData.fifty_seven,
                            decoration: EditTextDecoration,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: setTextFieldNext(
                                    _textController,
                                    "Comany Name",
                                    false,
                                    TextInputType.emailAddress,
                                    false,
                                    "",
                                    TextInputAction.next,
                                    () => {
                                      // on Chnages
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 32,
                    ),

                    const Text("YOUR PAST JOB",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: helvetica_neu_bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.left),
                    const SizedBox(
                      height: 4,
                    ),
                    // you can add more then one.
                    const Text("you can add more then one.",
                        style: TextStyle(
                            color: Color(0xffaaaaaa),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NeueHelvetica",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0),
                        textAlign: TextAlign.left),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: HeightData.fifty_seven,
                            decoration: EditTextDecoration,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: setTextFieldNext(
                                    _textController,
                                    "Title",
                                    false,
                                    TextInputType.emailAddress,
                                    false,
                                    "",
                                    TextInputAction.next,
                                    () => {
                                      // on Chnages
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: HeightData.fifty_seven,
                            decoration: EditTextDecoration,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: setTextFieldNext(
                                    _textController,
                                    "Comany Name",
                                    false,
                                    TextInputType.emailAddress,
                                    false,
                                    "",
                                    TextInputAction.next,
                                    () => {
                                      // on Chnages
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(width: 1, color: black_121212)),
                      child: // Add More
                          const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Text("+ Add More",
                              style: TextStyle(
                                  color: Color(0xff121212),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NeueHelvetica",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlackNextButton(str_continue, black_121212, () {
              // Get.to(const EducationInfoFormView());
            }),
          )
        ],
      ),
    ));
  }
}
