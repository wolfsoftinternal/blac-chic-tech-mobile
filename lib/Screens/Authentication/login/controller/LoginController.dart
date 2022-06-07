import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalQueFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/EducationInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/ExperienceInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/PersonalInfoFormView.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../Model/BaseModel.dart';
import '../../../../Utils/CommonWidget.dart';
import '../../../../Utils/preference_utils.dart';
import '../../../../Utils/share_predata.dart';
import '../../../Networks/api_endpoint.dart';
import '../../../Networks/api_response.dart';
import '../model/SignupModel.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> inputText = TextEditingController().obs;
  Rx<TextEditingController> pswdText = TextEditingController().obs;

  RxBool boolRemember = false.obs;

  @override
  void onInit() {
    super.onInit();
    print("init State");

    checker();
  }

  checker() async {
    var preferences = MySharedPref();
    var rememberMe = await preferences.getBoolValue(SharePreData.keyRememberedUserInfo);
    
    if(rememberMe == null){
      await preferences.setBool(SharePreData.keyRememberedUserInfo, false);
    }
    boolRemember.value = await preferences.getBoolValue(SharePreData.keyRememberedUserInfo);

    if (boolRemember.value == true) {
      getStoredUserDetails();
    }
  }

  callLoginApi(BuildContext context) async {
    String url = urlBase + urlGetLogin;
    final apiReq = Request();
    dynamic body = {
      'email': inputText.value.text,
      'password': pswdText.value.text
    };

    await apiReq.postAPIwithoutAuth(url, body).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 200) {
            SignupModel loginInModel = SignupModel.fromJson(userModel);
            print("Login Token :: " + loginInModel.data.toString());

            var preferences = MySharedPref();

            await preferences.setSignupModel(
                loginInModel, SharePreData.keySignupModel);

            await preferences.setString(
                SharePreData.keytoken, loginInModel.data!.token.toString());

            if (boolRemember.value == true) {
              await preferences.setBool(
                  SharePreData.keyRememberedUserInfo, true);
              await preferences.setString(SharePreData.keyRememberPassword,
                  pswdText.value.text.toString());
            }else{
              await preferences.setBool(
                  SharePreData.keyRememberedUserInfo, false);
            }

            SignupModel? myModel =
                await preferences.getSignupModel(SharePreData.keySignupModel);

            if (myModel!.data!.aboutUs == "" || myModel.data!.aboutUs == null) {
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
              }
            } else {
              Get.offAll(HomePage());
            }
          } else {
            snackBar(context, model.message!);
          }
        });
      } else if (res.statusCode == 101) {
        snackBar(context, "Enter valid Credentials");
      }
    });
  }

  Future<void> getStoredUserDetails() async {
    var preferences = MySharedPref();
    SignupModel? profileModel =
        await preferences.getSignupModel(SharePreData.key_UserInfoModel);

    inputText.value.text = profileModel!.data!.email!;
    pswdText.value.text = profileModel.data!.password!;
  }

  bool checkValidation(context) {
    if (inputText.value.text.isEmpty) {
      snackBar(context, "Enter Username");
      return false;
    } else if (pswdText.value.text.isEmpty) {
      snackBar(context, "Enter password");
      return false;
    } else if (pswdText.value.text.length < 6) {
      snackBar(context, "Password should not be less than 6 digits");
      return false;
    } else {
      return true;
    }
  }
}
