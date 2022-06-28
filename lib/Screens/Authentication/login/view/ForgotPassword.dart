import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/InputTextLayout.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/login/controller/LoginController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_strings.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
            ToolbarWithHeaderCenterTitle('Forgot Password'),
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
                    InputTextLayout(
                        str_email + "/" + str_username,
                        controller.inputText.value,
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

                if (controller.inputText.value.text.isEmpty) {
                  snackBar(context, "Enter Email/Username");
                } else {
                  checkNet(context).then((value) {
                    controller.forgotPasswordApi(context);
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
