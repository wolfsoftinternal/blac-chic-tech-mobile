import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/InputTextLayout.dart';
import 'package:blackchecktech/Layout/InputTextLayoutPassword.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/login/controller/LoginController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_strings.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  LoginController controller = Get.put(LoginController());
  
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            ToolbarWithHeaderCenterTitle('Reset Password'),
            SizedBox(
              height: 50.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputTextLayoutPassword(
                        'Enter new password',
                        controller.forgotPswdText.value,
                        false,
                        TextInputAction.next,
                        TextInputType.text,
                        (v) {}),
                    SizedBox(height: 16.h,),
                    InputTextLayoutPassword(
                        'Confirm new password',
                        controller.confirmPswdText.value,
                        false,
                        TextInputAction.next,
                        TextInputType.text,
                        (v) {}),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
              child: BlackNextButton('Continue', white_ffffff, () {
                // if (formKey.currentState!.validate()) {}
                FocusScope.of(context).unfocus();

                if (controller.forgotPswdText.value.text.isEmpty) {
                  snackBar(context, "Enter new password");
                }else if (controller.confirmPswdText.value.text.isEmpty) {
                  snackBar(context, "Enter confirm password");
                }else if (controller.forgotPswdText.value.text != controller.confirmPswdText.value.text) {
                  snackBar(context, "Password doesn't match");
                }else {
                  checkNet(context).then((value) {
                    controller.resetPasswordApi(context);
                  });
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}