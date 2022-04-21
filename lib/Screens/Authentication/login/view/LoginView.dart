import 'package:blackchecktech/Screens/Authentication/signup/view/SignupFormView.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

  bool selectedsecond = false;
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Stack(
                    children: [
                      BackLayout(),

                      // LOGIN
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text("LOGIN",
                              style: TextStyle(
                                  fontFamily: helvetica_neu_bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.center),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 51,
                  ),
                  Image.asset(
                    img_logo,
                    width: 94,
                    height: 94,
                  ),
                  const SizedBox(
                    height: 57,
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputTextLayout(
                              str_username,
                              controller.inputText.value,
                              false,
                              TextInputAction.next,
                              TextInputType.text, (v) {
                            if (v.isEmpty) {
                              return "Enter Username";
                            } else {
                              return null;
                            }
                          }),
                          const SizedBox(
                            height: 16,
                          ),
                          InputTextLayoutPassword(
                              str_pwd,
                              controller.pswdText.value,
                              false,
                              TextInputAction.next,
                              TextInputType.text, (v) {
                            if (v!.isEmpty) {
                              return "Enter Password";
                            } else {
                              return null;
                            }
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedsecond = !selectedsecond;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(3)),
                                          border: Border.all(
                                              color: selectedsecond
                                                  ? const Color(0xffdbdbdb)
                                                  : orange_ff881a,
                                              width: 1),
                                          color: selectedsecond
                                              ? const Color(0xffffffff)
                                              : orange_ff881a),
                                      child: selectedsecond
                                          ? const Icon(
                                              Icons.check,
                                              size: 18.0,
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              Icons.check,
                                              size: 18.0,
                                              color: Colors.white,
                                            ),
                                    ),
                                    const SizedBox(
                                      width: 11.7,
                                    ),
                                    // Save password
                                    const Text("Remember me",
                                        style: TextStyle(
                                            color: grey_aaaaaa,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.left)
                                  ],
                                ),
                              ),
                              // Forgot password
                              const Text("Forgot password?",
                                  style: TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.right)
                            ],
                          ),
                          const SizedBox(
                            height: 40,
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
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                Get.to(const SignupFormView());
              },
              child: RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    style: TextStyle(
                        color: Color(0xffaaaaaa),
                        fontWeight: FontWeight.w500,
                        fontFamily: "NeueHelvetica",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    text: "Dont have an account yet? "),
                TextSpan(
                  style: TextStyle(
                      color: Color(0xffff881a),
                      fontWeight: FontWeight.w700,
                      fontFamily: "NeueHelvetica",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
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
    ));
  }
}
