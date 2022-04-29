import 'dart:async';
import 'dart:convert';

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/Profile.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
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

class AdmireProfileController extends GetxController {
  RxList<AdmireList> admireList = <AdmireList>[].obs;
  Rx<AdmireDetails> details = AdmireDetails().obs;
  
  admireListAPI(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = myModel?.data!.token;

    String url = urlBase + urladmireList;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if(model.statusCode == 500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            admireListAPI(context);
          }else if(model.statusCode==200){
            AdmireListModel detail =
            AdmireListModel.fromJson(userModel);

            admireList.value = detail.data!;
          }
        });
      }else{
        print(res.reasonPhrase);
      }
    });
  }

  admireDeleteAPI(BuildContext context, id) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = myModel?.data!.token;

    String url = urlBase + urladmireDelete;
    final apiReq = Request();
    dynamic body = {
      'admire_id': id.toString(),
    };

    await apiReq.postAPI(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if(model.statusCode == 500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            admireDeleteAPI(context, id);
          }else if(model.statusCode==200){
            admireListAPI(context);
          }
        });
      }else{
        print(res.reasonPhrase);
      }
    });
  }

  userProfileAPI(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = myModel?.data!.token;

    String url = urlBase + urlUserProfile;
    final apiReq = Request();

    await apiReq.postAPI(url, null, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if(model.statusCode == 500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            userProfileAPI(context);
          }else if(model.statusCode==200){
            AdmireDetails admireListModel =
            AdmireDetails.fromJson(userModel);

            details.value = admireListModel;
            Get.to(Profile());
          }
        });
      }else{
        print(res.reasonPhrase);
      }
    });
  }

  admireProfileAPI(BuildContext context, id) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = myModel?.data!.token;

    String url = urlBase + urlUserProfile;
    final apiReq = Request();

    dynamic body = {
      'user_id': id.toString(),
    };
    await apiReq.postAPI(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if(model.statusCode == 500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            admireProfileAPI(context, id);
          }else if(model.statusCode==200){
            AdmireDetails admireListModel =
            AdmireDetails.fromJson(userModel['data']);

            details.value = admireListModel;
            print(details);
            Get.to(Profile());
          }
        });
      }else{
        print(res.reasonPhrase);
      }
    });
  }
}
