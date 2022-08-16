import 'dart:convert';

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
import 'package:blackchecktech/Welcome.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../Model/BaseModel.dart';
import '../../../../Utils/CommonWidget.dart';
import '../../../../Utils/preference_utils.dart';
import '../../../../Utils/share_predata.dart';
import '../../../Networks/api_endpoint.dart';
import '../../../Networks/api_response.dart';

class SettingsController extends GetxController {
  RxInt visible = 1.obs;
  Rx<TextEditingController> firstnameController = TextEditingController().obs;
  Rx<TextEditingController> lastnameController = TextEditingController().obs;
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxBool linkedin = true.obs;
  RxBool twitter = true.obs;
  RxBool instagram = true.obs;
  RxBool website = true.obs;
  RxBool about = true.obs;
  RxBool ques0 = true.obs;
  RxBool ques1 = true.obs;
  RxBool ques2 = true.obs;
  RxBool ques3 = true.obs;
  RxBool ques4 = true.obs;
  RxBool ques5 = true.obs;
  RxBool ques6 = true.obs;
  RxBool ques7 = true.obs;
  RxBool ques8 = true.obs;
  RxBool ques9 = true.obs;
  RxBool ques10 = true.obs;
  RxBool ques11 = true.obs;
  RxBool additional = true.obs;

  userLogout(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = await preferences.getStringValue(SharePreData.keytoken);
    print("token :: " + token.toString());
    String url = urlBase + urlLogout;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          print("Logout :: " + strData.toString());
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            userLogout(context);
          } else if (model.statusCode == 200) {
            bool boolRememberedUser = await preferences
                .getBoolValue(SharePreData.keyRememberedUserInfo);
            String pswd = await preferences
                .getStringValue(SharePreData.keyRememberPassword);

            await preferences.clear();

            if (boolRememberedUser == true) {
              myModel!.data!.password = pswd;
              await preferences.setRememberModel(
                  myModel, SharePreData.key_UserInfoModel);
              await preferences.setBool(
                  SharePreData.keyRememberedUserInfo, true);
            }

            Get.offAll(Welcome());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  deleteAccount(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlDeleteAccount;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            userLogout(context);
          } else if (model.statusCode == 200) {
            // deletePeerboardMember(context);
            await preferences.clear();
            Get.offAll(Welcome());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  Future<dynamic> deletePeerboardMember(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel;
    myModel = await preferences.getSignupModel(SharePreData.keySignupModel);

    var email = myModel!.data!.email.toString();

    var header = Options(
      headers: {
        'Authorization': '2360d5f790268aa27fe70a28cc5548a3',
      },
    );
    var response = await Dio()
        .post('https://api.peerboard.com/v1/members/$email',
            data: {
              "external_id": myModel.data!.id.toString(),
              "email": email,
            },
            options: header)
        .then((value) async {
      if (value.statusCode == 200) {
        await preferences.clear();
        Get.offAll(Welcome());
      }
    });
  }

  bool checkValidation(context) {
    if (firstnameController.value.text.isEmpty) {
      snackBar(context, "Enter First Name");
      return false;
    } else if (lastnameController.value.text.isEmpty) {
      snackBar(context, "Enter Last Name");
      return false;
    } else if (usernameController.value.text.isEmpty) {
      snackBar(context, "Enter Username");
      return false;
    } else if (!GetUtils.isEmail(emailController.value.text)) {
      snackBar(context, "Enter valid email");
      return false;
    } else {
      return true;
    }
  }
}
