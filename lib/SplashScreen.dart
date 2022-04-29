import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalQueFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/EducationInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/ExperienceInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/PersonalInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/SignupFormView.dart';
import 'package:blackchecktech/Screens/Home/BottomNavigation.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/Authentication/login/model/SignupModel.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      var preferences = MySharedPref();                        
      SignupModel? myModel = await preferences
          .getSignupModel(SharePreData.keySignupModel);
      
      String personalInfo = await preferences.getStringValue(SharePreData.keyPersonalInfo);
      String experienceInfo = await preferences.getStringValue(SharePreData.keyExperienceInfo);
      String educationalInfo = await preferences.getStringValue(SharePreData.keyEducationalInfo);
      String questionsInfo = await preferences.getStringValue(SharePreData.keyQuestionsInfo);
      String lastQuestionsInfo = await preferences.getStringValue(SharePreData.keyLastQuestionsInfo);

      if(myModel == null){
        Get.offAll(const Welcome());
      }else if (personalInfo == "") {
        Get.offAll(const PersonalInfoFormView());
      }else if (experienceInfo == "") {
        Get.offAll(const ExperienceInfoFormView());
      }else if (educationalInfo == "") {
        Get.offAll(const EducationInfoFormView());
      }else if (questionsInfo == "") {
        Get.offAll(const AdditionalQueFormView());
      }else if(lastQuestionsInfo == ""){
        Get.offAll(AdditionalLastQueView());
      }else{
        Get.offAll(BottomNavigation());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Center(
        child: Image.asset(
          img_logo,
          width: 126,
          height: 126,
        ),
      ),
    );
  }
}