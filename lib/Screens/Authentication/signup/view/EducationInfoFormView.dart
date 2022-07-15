import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalQueFormView.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Styles/my_height.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utilities/TextfieldUtility.dart';
import '../../../../Widget/EditTextDecoration.dart';

class EducationInfoFormView extends StatefulWidget {
  const EducationInfoFormView({Key? key}) : super(key: key);

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<EducationInfoFormView> {
  StepsController controller = Get.put(StepsController());

  List cards = [""];
  List<Map> details = [{}];

  List<TextEditingController> universityController = [];
  List<TextEditingController> startyearController = [];
  List<TextEditingController> endyearController = [];

  DateTime startDate = DateTime.now();

  bool isDeleteLast = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var element in cards) {
      var university = TextEditingController(text: element);
      var startyear = TextEditingController(text: element);
      var endyear = TextEditingController(text: element);

      universityController.add(university);
      startyearController.add(startyear);
      endyearController.add(endyear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          ToolbarWithHeader(
              step: 2,
              ontap: () async {
                var preferences = MySharedPref();
                SignupModel? myModel = await preferences
                    .getSignupModel(SharePreData.keySignupModel);

                if (myModel!.data!.questions == null ||
                    myModel.data!.questions.toString() == '[]') {
                  Get.to(const AdditionalQueFormView());
                } else if (myModel.data!.questions == null ||
                    myModel.data!.questions.toString() == '[]') {
                  String questionsInfo = "";
                  String lastQuestionsInfo = "";
                  for (int i = 0; i < myModel.data!.questions!.length; i++) {
                    if (myModel.data!.questions![i].type == "normal") {
                      questionsInfo = "Done";
                    } else {
                      lastQuestionsInfo = "Done";
                    }
                  }
                  if (questionsInfo != "Done") {
                    Get.offAll(const AdditionalQueFormView());
                  } else if (lastQuestionsInfo != "Done") {
                    Get.offAll(const AdditionalLastQueView());
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
                      child: Text(str_Education,
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

                    Column(
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cards.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 48.h,
                                    decoration: EditTextDecoration,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 17.w,
                                          right: 17.w,
                                          top: 5.h,
                                          bottom: 5.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: setTextFieldNext(
                                              universityController[index],
                                              "University/School",
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
                                          decoration: EditTextDecoration,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 17.w,
                                                right: 17.w,
                                                top: 5.h,
                                                bottom: 5.h),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: setDobTextFieldNext(
                                                    startyearController[index],
                                                    "Start year",
                                                    false,
                                                    TextInputType.name,
                                                    false,
                                                    "",
                                                    TextInputAction.next,
                                                    (value) {},
                                                    () async {
                                                      DateTime? pickedDate =
                                                          await showModalBottomSheet<
                                                              DateTime>(
                                                        context: context,
                                                        builder: (context) {
                                                          DateTime?
                                                              tempPickedDate =
                                                              DateTime.now();
                                                          return SizedBox(
                                                            height: 250.h,
                                                            child: Column(
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: <
                                                                        Widget>[
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 5.w),
                                                                        child:
                                                                            CupertinoButton(
                                                                          child:
                                                                              const Text(
                                                                            'Cancel',
                                                                            style:
                                                                                TextStyle(color: orange_ff881a),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(right: 5.w),
                                                                        child:
                                                                            CupertinoButton(
                                                                          child: const Text(
                                                                              'Done',
                                                                              style: TextStyle(color: orange_ff881a)),
                                                                          onPressed:
                                                                              () {
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
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        YearPicker(
                                                                      firstDate:
                                                                          DateTime(DateTime.now().year -
                                                                              100),
                                                                      lastDate:
                                                                          DateTime
                                                                              .now(),
                                                                      selectedDate:
                                                                          DateTime
                                                                              .now(),
                                                                      onChanged:
                                                                          (DateTime
                                                                              dateTime) {
                                                                        tempPickedDate =
                                                                            dateTime;
                                                                        startDate =
                                                                            dateTime;
                                                                        Navigator.of(context)
                                                                            .pop(tempPickedDate);
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
                                                          formatter.format(
                                                              pickedDate!);

                                                      startyearController[index]
                                                          .text = formattedDate;
                                                    },
                                                  ),
                                                ),
                                                SvgPicture.asset(
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
                                          decoration: EditTextDecoration,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 17.w,
                                                right: 17.w,
                                                top: 5.h,
                                                bottom: 5.h),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: setDobTextFieldNext(
                                                    endyearController[index],
                                                    "End year",
                                                    false,
                                                    TextInputType.name,
                                                    false,
                                                    "",
                                                    TextInputAction.next,
                                                    (value) {},
                                                    () async {
                                                      if (startyearController[
                                                              index]
                                                          .text
                                                          .isEmpty) {
                                                        snackBar(context,
                                                            'Enter start year');
                                                      } else {
                                                        DateTime? pickedDate =
                                                            await showModalBottomSheet<
                                                                DateTime>(
                                                          context: context,
                                                          builder: (context) {
                                                            DateTime?
                                                                tempPickedDate =
                                                                DateTime.now();
                                                            return SizedBox(
                                                              height: 250.h,
                                                              child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.only(left: 5.w),
                                                                          child:
                                                                              CupertinoButton(
                                                                            child:
                                                                                const Text(
                                                                              'Cancel',
                                                                              style: TextStyle(color: orange_ff881a),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.only(right: 5.w),
                                                                          child:
                                                                              CupertinoButton(
                                                                            child:
                                                                                const Text('Done', style: TextStyle(color: orange_ff881a)),
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop(tempPickedDate);
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const Divider(
                                                                    height: 0,
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          YearPicker(
                                                                        firstDate:
                                                                            startDate,
                                                                        lastDate:
                                                                            DateTime(DateTime.now().year +
                                                                                10),
                                                                        selectedDate:
                                                                            DateTime.now(),
                                                                        onChanged:
                                                                            (DateTime
                                                                                value) {
                                                                          tempPickedDate =
                                                                              value;
                                                                          Navigator.of(context)
                                                                              .pop(tempPickedDate);
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
                                                            formatter.format(
                                                                pickedDate!);

                                                        endyearController[index]
                                                                .text =
                                                            formattedDate;
                                                      }
                                                    },
                                                  ),
                                                ),
                                                SvgPicture.asset(
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
                                    height: 32.h,
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
                                    universityController.removeLast();
                                    startyearController.removeLast();
                                    endyearController.removeLast();
                                    if (cards.length == 1) {
                                      isDeleteLast = false;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 48.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      border: Border.all(
                                          width: 1, color: black_121212)),
                                  child: // Add More
                                      Padding(
                                    padding: EdgeInsets.all(16.r),
                                    child: Center(
                                      child: Text("Remove Last",
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
                              if (universityController.last.value.text == '') {
                                snackBar(context, 'Enter university');
                              } else if (startyearController.last.value.text ==
                                  '') {
                                snackBar(context, 'Enter Start Year');
                              } else if (endyearController.last.value.text ==
                                  '') {
                                snackBar(context, 'Enter End Year');
                              } else {
                                isDeleteLast = true;
                                for (var element in cards) {
                                  var university =
                                      TextEditingController(text: element);
                                  var startyear =
                                      TextEditingController(text: element);
                                  var endyear =
                                      TextEditingController(text: element);

                                  universityController.add(university);
                                  startyearController.add(startyear);
                                  endyearController.add(endyear);
                                }

                                cards.add("");
                              }
                            });
                          },
                          child: Container(
                            height: 48.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(
                                    width: 1.w, color: black_121212)),
                            child: // Add More
                                Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.h),
                                    child: Text("+ ",
                                        style: TextStyle(
                                            color: const Color(0xff121212),
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 22.sp),
                                        textAlign: TextAlign.left),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 16.h, top: 16.h),
                                    child: Text(" Add More",
                                        style: TextStyle(
                                            color: const Color(0xff121212),
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp),
                                        textAlign: TextAlign.left),
                                  ),
                                ],
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
            padding: EdgeInsets.all(24.sp),
            child: BlackNextButton(str_continue, black_121212, () {
              if (universityController.last.value.text == '') {
                snackBar(context, 'Enter university');
              } else if (startyearController.last.value.text == '') {
                snackBar(context, 'Enter Start Year');
              } else if (endyearController.last.value.text == '') {
                snackBar(context, 'Enter End Year');
              } else {
                details.clear();

                for (int i = 0; i < cards.length; i++) {
                  details.add({
                    '"university_school_name"':
                        '"${universityController[i].text}"',
                    '"start_year"': '"${startyearController[i].text}"',
                    '"end_year"': '"${endyearController[i].text}"',
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
                  List itemList = [];

                  itemList.clear();
                  for (var item in details) {
                    itemList.add(item);
                  }
                  controller.educationalDetails.clear();
                  controller.educationalDetails.value = itemList;

                  checkNet(context).then((value) {
                    controller.educationalInfoAPI(context);
                  });
                } else {
                  snackBar(context, 'Add educational details');
                }
              }
            }),
          )
        ],
      ),
    );
  }
}
