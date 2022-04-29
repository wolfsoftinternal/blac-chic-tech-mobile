import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalQueFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/EducationInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/ExperienceInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/PersonalInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/SignupFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/SignupInfoView.dart';
import 'package:blackchecktech/Screens/Home/BottomNavigation.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Styles/my_icons.dart';
import '../../../../Styles/my_strings.dart';
import '../../login/view/LoginView.dart';

class RegisterInfoView extends StatelessWidget {
  const RegisterInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: FittedBox(
                        child: Image.asset(img_girl), fit: BoxFit.cover)),
                Image.asset(
                  img_logo,
                  width: 72,
                  height: 72,
                )
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
                color: white_ffffff,
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BlackNextButton(str_register, white_ffffff, () async {
                        var preferences = MySharedPref();                        
                        SignupModel? myModel = await preferences
                            .getSignupModel(SharePreData.keySignupModel);
                        
                        String personalInfo = await preferences.getStringValue(SharePreData.keyPersonalInfo);
                        String experienceInfo = await preferences.getStringValue(SharePreData.keyExperienceInfo);
                        String educationalInfo = await preferences.getStringValue(SharePreData.keyEducationalInfo);
                        String questionsInfo = await preferences.getStringValue(SharePreData.keyQuestionsInfo);
                        String lastQuestionsInfo = await preferences.getStringValue(SharePreData.keyLastQuestionsInfo);

                        if(myModel == null){
                          Get.to(const SignupFormView());
                        }else if (personalInfo == "") {
                          Get.to(const PersonalInfoFormView());
                        }else if (experienceInfo == "") {
                          Get.to(const ExperienceInfoFormView());
                        }else if (educationalInfo == "") {
                          Get.to(const EducationInfoFormView());
                        }else if (questionsInfo == "") {
                          Get.to(const AdditionalQueFormView());
                        }else if(lastQuestionsInfo == ""){
                          Get.to(AdditionalLastQueView());
                        }else{
                          Get.offAll(BottomNavigation());
                        }
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const LoginView());
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xfff2f2f2),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: // Already have an account
                              Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Center(
                              child: Text(str_already_have_second,
                                  style: const TextStyle(
                                      color: black_121212,
                                      fontFamily: helvetica_neu_bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      // By continuing and signing up for an account, you confirm that you agree to Black Chic Tech User Agre
                      RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(children: [
                            TextSpan(
                                style: TextStyle(
                                    color: Color(0xff121212),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Helvetica",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.0,
                                    height: 1.5),
                                text:
                                    "By continuing and signing up for an account, you confirm that you agree to Black Chic Tech "),
                            TextSpan(
                                style: TextStyle(
                                    color: Color(0xffff881a),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Helvetica",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.0,
                                    height: 1.5),
                                text: "User Agreement,"),
                            TextSpan(
                                style: TextStyle(
                                    color: Color(0xff121212),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Helvetica",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.0,
                                    height: 1.5),
                                text:
                                    " and acknowledge that you have read Black Chic Tech "),
                            TextSpan(
                                style: TextStyle(
                                    color: Color(0xffff881a),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Helvetica",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.0,
                                    height: 1.5),
                                text: "Privacy Notice."),
                          ]))
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
