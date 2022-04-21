import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../Model/BaseModel.dart';
import '../../../../Utils/CommonWidget.dart';
import '../../../../Utils/GeneralFunctions.dart';
import '../../../../Utils/preference_utils.dart';
import '../../../../Utils/share_predata.dart';
import '../../../Networks/api_endpoint.dart';
import '../../../Networks/api_response.dart';
import '../model/LoginModel.dart';

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

    bool isExist =
        await preferences.getBoolValue(SharePreData.keyRememberedUserInfo);

    if (isExist != null) {
      boolRemember.value = isExist;

      if (isExist == true) {
        getStoredUserDetails();
      }
    }
  }

  callLoginApi(BuildContext context) async {
    onLoading(context, "Loading..");

    String url = urlBase + urlGetLogin;
    final apiReq = Request();
    // FirebaseMessaging.instance.getToken().then((value) {
    //   String token = value;
    //   printData("Token", token);

    // });
    dynamic body = {
      'email': inputText.value.text,
      'password': pswdText.value.text
    };

    await apiReq.postAPIwithoutAuth(url, body).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          Navigator.pop(context); //pop dialogdsds

          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          print("status code " + model.statusCode.toString());
          print("status code " + model.message.toString());

          if (model.statusCode == 200) {
            snackBar(context, model.message!);
            LoginModel loginInModel = LoginModel.fromJson(userModel);
            var preferences = MySharedPref();
            await preferences.setLoginInModel(
                loginInModel, SharePreData.keyLoginModel);

            if (boolRemember.value == true) {
              await preferences.setBool(
                  SharePreData.keyRememberedUserInfo, true);
              await preferences.setString(SharePreData.keyRememberPassword,
                  pswdText.value.text.toString());
            }

            // if (loginInModel.data!.userName == null) {
            //   Get.offAll(UserName());
            // } else if (loginInModel.data.password == null) {
            //   Get.offAll(Password());
            // } else {
            //   Get.offAll(BottomNavigation());
            // }
          } else {
            // Get.offAll(SignIn()); //pop dialogdsds
            snackBar(context, model.message!);
          }
        });
      } else if (res.statusCode == 101) {
        Navigator.pop(context); //pop dialogdsds
        snackBar(context, "Enter valid Credentials");
      }
    });
  }

  Future<void> getStoredUserDetails() async {
    var preferences = MySharedPref();
    LoginModel? profileModel =
        await preferences.getLoginInModel(SharePreData.keyLoginModel);

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
