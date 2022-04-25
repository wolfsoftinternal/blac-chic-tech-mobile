import 'package:blackchecktech/Screens/Authentication/signup/view/PersonalInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/RegisterInfoView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/SignupInfoView.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'Layout/BlackNextButton.dart';
import 'Screens/Authentication/login/view/LoginView.dart';
import 'Styles/my_strings.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/ExperienceInfoFormView.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white_ffffff,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
                height: double.infinity,
                width: double.infinity,
                child:
                    FittedBox(child: Image.asset(img_girl), fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    img_logo,
                    width: 72,
                    height: 72,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 33),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlackNextButton(str_get_started, white_ffffff, () {
                      Get.to(const SignupInfoView());
                  }),

                  const SizedBox(
                    height: 16,
                  ),

                  // footer text
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        print("Clicked");
                        Get.to(const LoginView());
                      },
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            style: const TextStyle(
                                color: white_ffffff,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            text: str_already_have),
                        TextSpan(
                            // recognizer: TapGestureRecognizer()
                            //   ..onTap = () {
                            //     print("Clicked");
                            //     Get.to(const LoginView());
                            //   },
                            style: const TextStyle(
                                color: orange_ff881a,
                                fontFamily: helvetica_neu_bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            text: str_signin)
                      ])),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
