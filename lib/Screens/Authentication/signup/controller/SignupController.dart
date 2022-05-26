import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/PersonalInfoFormView.dart';
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
import '../../login/model/SignupModel.dart';

class SignupController extends GetxController {
  Rx<TextEditingController> firstnameController = TextEditingController().obs;
  Rx<TextEditingController> lastnameController = TextEditingController().obs;
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmpasswordController = TextEditingController().obs;

  Future<void> signupAPI(BuildContext context) async {
    String url = urlBase + urlSignup;
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll({
      'first_name': firstnameController.value.text,
      'last_name': lastnameController.value.text,
      'user_name': usernameController.value.text,
      'email': emailController.value.text,
      'password': passwordController.value.text,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) async {
        String strData = value;
        Map<String, dynamic> userModel = json.decode(strData);
        BaseModel model = BaseModel.fromJson(userModel);

        if(model.statusCode==200){
          SignupModel? signUp = SignupModel.fromJson(userModel);

          var preferences = MySharedPref();
          await preferences.setSignupModel(signUp, SharePreData.keySignupModel);

          await preferences.setString(SharePreData.keytoken, signUp.data!.token.toString());

          Get.off(PersonalInfoFormView());
        }
        else if(model.statusCode==101){
          snackBar(context, model.message!);
        }else{
          snackBar(context,"Resend Code");
        }

      });
    } else {
      Navigator.pop(context); //pop
      snackBar(context, response.reasonPhrase!);
    }
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
    } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(passwordController.value.text)) {
      snackBar(context, "Enter valid password");
      return false;
    } else if (confirmpasswordController.value.text.isEmpty) {
      snackBar(context, "Enter Confirm Password");
      return false;
    } else if (passwordController.value.text != confirmpasswordController.value.text) {
      snackBar(context, "Entered password does not match");
      return false;
    } else {
      return true;
    }
  }
}
