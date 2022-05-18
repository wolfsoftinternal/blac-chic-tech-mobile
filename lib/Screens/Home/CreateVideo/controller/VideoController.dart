import 'dart:convert';
import 'dart:io';

import 'package:blackchecktech/Model/BaseModel.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/TopicListModel.dart';
import 'package:blackchecktech/Screens/Networks/api_endpoint.dart';
import 'package:blackchecktech/Screens/Networks/api_response.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  RxString videoFile = ''.obs;
  RxString duration = ''.obs;
  VideoPlayerController? videoController;

  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> descController = TextEditingController().obs;
  Rx<TextEditingController> tagController = TextEditingController().obs;
  List<String> tagValues = [];

  RxList<TopicList> topicList = <TopicList>[].obs;
  List topicNameList = [].obs;
  RxString topicName = "Select Topic".obs;
  List<DropdownMenuItem<String>>? dropDownTopicItems;

  RxList<TopicList> languageList = <TopicList>[].obs;
  List languageNameList = [].obs;
  RxString languageName = "Select Language".obs;
  List<DropdownMenuItem<String>>? dropDownLanguageItems;

  topicListAPI(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = myModel?.data!.token;

    String url = urlBase + urlTopicList;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token.toString()).then((value) {
      http.StreamedResponse res = value;

      topicList.clear();
      topicNameList.clear();
      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if(model.statusCode == 500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            topicListAPI(context);
          }else if(model.statusCode==200){
            TopicList detail =
            TopicList.fromJson(userModel);

            topicList.add(detail);
            
            if (topicList.isNotEmpty) {
            for (var item in topicList) {
              topicNameList.add(item.name);
            }
            dropDownTopicItems = getDropDownTopicItems();
            topicName.value = dropDownTopicItems![0].value!;
        }
          }
        });
      }else{
        print(res.reasonPhrase);
      }
    });
  }

  List<DropdownMenuItem<String>> getDropDownTopicItems() {
    List<DropdownMenuItem<String>> items = [];
    for (var topicName in topicNameList) {
      items.add(new DropdownMenuItem(
          value: topicName,
          child: new Text(
            topicName,
            style: TextStyle(
                color: black_121212,
                fontWeight: FontWeight.w500,
                fontFamily: "SFProDisplay",
                fontStyle: FontStyle.normal,
                fontSize: 15.0),
          )));
    }
    return items;
  }

  languageListAPI(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = myModel?.data!.token;

    String url = urlBase + urlLanguageList;
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

            languageListAPI(context);
          }else if(model.statusCode==200){
            TopicList detail =
            TopicList.fromJson(userModel);

            languageList.add(detail);
          }
        });
      }else{
        print(res.reasonPhrase);
      }
    });
  }
}
