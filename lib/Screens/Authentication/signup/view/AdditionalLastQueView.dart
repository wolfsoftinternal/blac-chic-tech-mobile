import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../Styles/my_strings.dart';
import '../../../../Widget/EditTextDecoration.dart';

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
            SizedBox(
              height: 60.h,
            ),
            ToolbarWithHeader(
                step: 4,
                ontap: () {
                  Get.offAll(HomePage());
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
                        child: Text(additional_Question_Lbl2,
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

                      Container(
                        decoration: EditTextDecoration,
                        height: 280.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 16.h,
                                    bottom: 2.h,
                                    right: 16.w,
                                    left: 16.w),
                                child: TextFormField(
                                  controller:
                                      controller.addtionalController.value,
                                  minLines: 2,
                                  maxLines: 15,
                                  keyboardType: TextInputType.multiline,
                                  style: TextStyle(
                                      color: black_121212,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp,
                                      height: 1.5.h),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText:
                                        'What should the world know about you ? \nPlease describe it.',
                                    hintStyle: TextStyle(
                                        color: grey_aaaaaa,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp,
                                        height: 1.5.h),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              margin: EdgeInsets.all(16.r),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 10.5.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Minimal in 10 word
                                    Text("Minimal in 10 word",
                                        style: TextStyle(
                                            color: const Color(0xff121212),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: helveticaNeue,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp),
                                        textAlign: TextAlign.left),

                                    SvgPicture.asset(
                                      icon_info,
                                      width: 20.r,
                                      height: 20.r,
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
              padding: EdgeInsets.all(24.r),
              child: BlackNextButton(str_done, black_121212, () {
                // if (controller.addtionalController.value.text.isEmpty) {
                //   snackBar(context, 'Please answer the question');
                // } else if (RegExp(r"[\w-._]+")
                //         .allMatches(controller.addtionalController.value.text)
                //         .length <
                //     10) {
                //   snackBar(context, 'Minimum 10 words required');
                // } else {
                controller.questions.clear();
                controller.questions.add({
                  '"question"': '"What should the world know about you ?"',
                  '"answer"': '"${controller.addtionalController.value.text}"',
                });
                // = controller.addtionalController.value.text;
                checkNet(context).then((value) {
                  controller.questionsInfoAPI(context, 'additional',
                      ScreenMove: "additional");
                });
                //}
              }),
            )
          ],
        ),
      ),
    );
  }
}
