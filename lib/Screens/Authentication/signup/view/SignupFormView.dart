import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/SignupController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/PersonalInfoFormView.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Layout/BlackNextButton.dart';
import '../../../../Layout/InputTextLayout.dart';
import '../../../../Layout/InputTextLayoutPassword.dart';
import '../../../../Styles/my_icons.dart';
import '../../../../Styles/my_strings.dart';
import 'FullInformationStepsView.dart';

class SignupFormView extends StatefulWidget {
  const SignupFormView({Key? key}) : super(key: key);

  @override
  _SignupDetailState createState() => _SignupDetailState();
}

class _SignupDetailState extends State<SignupFormView> {
  SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              height: 60.h,
            ),
            BackLayout(),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(left: 24.w, right: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(
                        height: 24.h,
                      ),
                      // Let’s get started
                      Center(
                        child: Text(str_lets,
                            style:  TextStyle(
                                color: black_121212,
                                fontFamily: helvetica_neu_bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 24.0.sp),
                            textAlign: TextAlign.left),
                      ),
                       SizedBox(
                        height: 16.h,
                      ),
                      // Tell us a little bit about yourself to create your account.
                      Center(
                        child: Text(str_tell_us,
                            style:  TextStyle(
                                color: grey_aaaaaa,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0.sp,
                                height: 1.2.h),
                            textAlign: TextAlign.center),
                      ),

                       SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputTextLayout(
                              str_first_name,
                              controller.firstnameController.value,
                              false,
                              TextInputAction.next,
                              TextInputType.text,
                              (v) {}
                            )
                          ),
                           SizedBox(
                            width: 8.h,
                          ),
                          Expanded(
                            child: InputTextLayout(
                              str_last_name,
                              controller.lastnameController.value,
                              false,
                              TextInputAction.next,
                              TextInputType.text,
                              (v) {}
                            )
                          ),
                        ],
                      ),
                       SizedBox(
                        height: 16.h,
                      ),
                      InputTextLayout(
                        str_username, 
                        controller.usernameController.value,
                        false,
                        TextInputAction.next,
                        TextInputType.text,
                        (v) {}
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      InputTextLayout(
                        str_email,
                        controller.emailController.value,
                        false,
                        TextInputAction.next,
                        TextInputType.emailAddress,
                        (v) {}
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      InputTextLayoutPassword(
                        str_pwd,
                        controller.passwordController.value,
                        false,
                        TextInputAction.next,
                        TextInputType.text,
                        (v) {}
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      InputTextLayoutPassword(
                        str_confirmPwd,
                        controller.confirmpasswordController.value,
                        false,
                        TextInputAction.done,
                        TextInputType.text, (v) {}
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            icon_info,
                            width: 15.r,
                            height: 15.r,
                          ),
                           SizedBox(
                            width: 7.w,
                          ),
                          Expanded(
                            child: Container(
                              child: setHelveticaMedium(
                                  str_pwd_validation_text,
                                  11.sp,
                                  grey_aaaaaa,
                                  FontWeight.w500,
                                  FontStyle.normal,
                                  null,
                                  3),
                            ),
                          )
                        ],
                      ),
                      // const SizedBox(
                      //   height: 70,
                      // ),
                      // BlackNextButton(str_signup, white_ffffff, () {
                      //   DialogUtils.showCustomDialog(context);
                      // }),
                    ],
                  ),
                ),
              ),
            ),
             Padding(
              padding:  EdgeInsets.only(left: 24.w, right: 24.w),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BlackNextButton(str_signup, white_ffffff, () {
                  FocusScope.of(context).unfocus();
                  if (controller.checkValidation(context)) {
                    checkNet(context).then((value) {
                      controller.signupAPI(context);
                    });
                  }
                }),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04,)
          ],
        ),
      ),
    );
  }
}

class DialogUtils {
  static DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0.r)), //this right here
            child: SizedBox(
              height: 290.h,
              child: Padding(
                padding:  EdgeInsets.all(12.0.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      img_varification,
                      width: 120.r,
                      height: 97.r,
                      fit: BoxFit.cover,
                    ),
                     SizedBox(
                      height: 27.h,
                    ),
                    // We Sent You An Email
                    Text(str_we_have,
                        style:  TextStyle(
                            color: black_121212,
                            fontFamily: helvetica_neu_bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0.sp),
                        textAlign: TextAlign.left),
                     SizedBox(
                      height: 12.h,
                    ),
                    // Tap on the email link to activate your account.
                    Text(str_tap_on,
                        style:  TextStyle(
                            color: grey_aaaaaa,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0.sp,
                            height: 1.5.h),
                        textAlign: TextAlign.center),
                     SizedBox(
                      height: 10.h,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black.withOpacity(0.75)),
                        onPressed: () {
                          Navigator.pop(context);
                          Get.to(const FullInformationStepsView());
                        },
                        child: const Text("Continue"))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
