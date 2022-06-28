import 'package:blackchecktech/Screens/Authentication/login/view/ForgotPassword.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/SignupFormView.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Layout/BlackNextButton.dart';
import '../../../../Layout/InputTextLayout.dart';
import '../../../../Layout/InputTextLayoutPassword.dart';
import '../../../../Layout/ToolbarBackOnly.dart';
import '../../../../Styles/my_colors.dart';
import '../../../../Styles/my_icons.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utils/internet_connection.dart';
import '../controller/LoginController.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  // bool selectedsecond = false;
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Stack(
                      children: [
                        BackLayout(),

                        // LOGIN
                         Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: Center(
                            child: Text("LOGIN",
                                style: TextStyle(
                                    fontFamily: helvetica_neu_bold,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 1.5,
                                    fontSize: 16.0.sp),
                                textAlign: TextAlign.center),
                          ),
                        )
                      ],
                    ),
                     SizedBox(
                      height: 51.h,
                    ),
                    Image.asset(
                      img_logo,
                      width: 94.r,
                      height: 94.r,
                    ),
                     SizedBox(
                      height: 57.h,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputTextLayout(
                                str_email + "/" + str_username,
                                controller.inputText.value,
                                false,
                                TextInputAction.next,
                                TextInputType.text, (v) {}),
                             SizedBox(
                              height: 20.h,
                            ),
                            InputTextLayoutPassword(
                                str_pwd,
                                controller.pswdText.value,
                                false,
                                TextInputAction.next,
                                TextInputType.text, (v) {}),
                             SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      // selectedsecond = !selectedsecond;
                                      controller.boolRemember.value = !controller.boolRemember.value;
                                          // selectedsecond;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 22.h,
                                          width: 22.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                   BorderRadius.all(
                                                      Radius.circular(3.r)),
                                              border: Border.all(
                                                  color: controller.boolRemember.value
                                                      ? orange_ff881a
                                                      : const Color(0xffdbdbdb),
                                                  width: 1),
                                              color: controller.boolRemember.value
                                                  ? orange_ff881a
                                                  : const Color(0xffffffff)),
                                          child: controller.boolRemember.value
                                              ?  Icon(
                                                  Icons.check,
                                                  size: 18.0.r,
                                                  color: Colors.white,
                                                )
                                              :  Icon(
                                                  Icons.check,
                                                  size: 18.0.r,
                                                  color: Colors.white,
                                                )),
                                       SizedBox(
                                        width: 8.w,
                                      ),
                                      // Save password
                                       Text("Remember me",
                                          style: TextStyle(
                                              color: grey_aaaaaa,
                                              fontFamily:
                                                  helveticaNeueNeue_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.0.sp),
                                          textAlign: TextAlign.left)
                                    ],
                                  ),
                                ),
                                // Forgot password
                                 InkWell(
                                  onTap: (){
                                    Get.to(ForgotPassword());
                                  },
                                   child: Text("Forgot password?",
                                      style: TextStyle(
                                          color: grey_aaaaaa,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.0.sp),
                                      textAlign: TextAlign.right),
                                 )
                              ],
                            ),
                             SizedBox(
                              height: 40.h,
                            ),
                            BlackNextButton(str_login, white_ffffff, () {
                              // if (formKey.currentState!.validate()) {}
                              FocusScope.of(context).unfocus();

                              if (controller.checkValidation(context)) {
                                checkNet(context).then((value) {
                                  controller.callLoginApi(context);
                                });
                              }
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Text
            Padding(
              padding:  EdgeInsets.all(12.0.r),
              child: GestureDetector(
                onTap: () {
                  Get.to(const SignupFormView());
                },
                child: RichText(
                    text:  TextSpan(children: [
                  TextSpan(
                      style: TextStyle(
                          color: const Color(0xffaaaaaa),
                          fontWeight: FontWeight.w500,
                          fontFamily: helveticaNeueNeue_medium,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0.sp),
                      text: "Dont have an account yet? "),
                  TextSpan(
                    style: TextStyle(
                        color: const Color(0xffff881a),
                        fontWeight: FontWeight.w700,
                        fontFamily: helvetica_neu_bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0.sp),
                    text: "Create Account",
                    // recognizer: TapGestureRecognizer()
                    //   ..onTap = () {
                    //     Get.to(const SignupFormView());
                    //   },
                  )
                ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
