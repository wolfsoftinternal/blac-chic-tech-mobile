import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalQueFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/EducationInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/ExperienceInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/PersonalInfoFormView.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';

import 'Screens/Authentication/login/model/SignupModel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isSplash = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      var preferences = MySharedPref();
      SignupModel? myModel =
          await preferences.getSignupModel(SharePreData.keySignupModel);

      // String personalInfo = await preferences.getStringValue(SharePreData.keyPersonalInfo);
      // String experienceInfo = await preferences.getStringValue(SharePreData.keyExperienceInfo);
      // String educationalInfo = await preferences.getStringValue(SharePreData.keyEducationalInfo);
      // String questionsInfo = await preferences.getStringValue(SharePreData.keyQuestionsInfo);
      // String lastQuestionsInfo = await preferences.getStringValue(SharePreData.keyLastQuestionsInfo);

      // if(myModel == null){
      //   Get.offAll(const Welcome());
      // }else if (personalInfo == "") {
      //   Get.offAll(const PersonalInfoFormView());
      // }else if (experienceInfo == "") {
      //   Get.offAll(const ExperienceInfoFormView());
      // }else if (educationalInfo == "") {
      //   Get.offAll(const EducationInfoFormView());
      // }else if (questionsInfo == "") {
      //   Get.offAll(const AdditionalQueFormView());
      // }else if(lastQuestionsInfo == ""){
      //   Get.offAll(AdditionalLastQueView());
      // }else{
      //   Get.offAll(BottomNavigation());
      // }
      Future.delayed(Duration(milliseconds: 150), () {
        setState(() {
          isSplash = false;
        });
      });
      if (myModel == null) {
        Get.offAll(const Welcome());
      } else if (myModel.data!.aboutUs == "" || myModel.data!.aboutUs == null) {
        Get.offAll(const PersonalInfoFormView());
      } else if (myModel.data!.currentJobs == null ||
          myModel.data!.currentJobs.toString() == '[]') {
        Get.offAll(const ExperienceInfoFormView());
      } else if (myModel.data!.educations == null ||
          myModel.data!.educations.toString() == '[]') {
        Get.offAll(const EducationInfoFormView());
      } else if (myModel.data!.questions == null ||
          myModel.data!.questions.toString() == '[]') {
        Get.offAll(const AdditionalQueFormView());
      } else if (myModel.data!.questions != null ||
          myModel.data!.questions.toString() != '[]') {
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
          // Get.back();
          // Navigator.of(context).pushAndRemoveUntil(_createRoute(), (Route<dynamic> route) => false,);
        }
      } else {
        Get.offAll(HomePage());
      }
    });
    // checkFirstCall();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 2),
      pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  checkFirstCall() async {
    bool ifc = await IsFirstRun.isFirstCall();
    var preferences = MySharedPref();
    bool val = await preferences.getStringValue(SharePreData.strIfc);
    setState(() {
      if (val == true) {
      } else if (ifc == true) {
        preferences.clear();
      }
    });
    preferences.setString(SharePreData.strIfc, 'true');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Visibility(
        visible: isSplash,
        child: Center(
          child: SvgPicture.asset(
            logo,
            width: 126,
            height: 126,
          ),
        ),
      ),
    );
  }
}
