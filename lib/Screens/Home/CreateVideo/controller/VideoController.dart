import 'dart:convert';

import 'package:blackchecktech/Model/BaseModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/TopicListModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/UserListModel.dart';
import 'package:blackchecktech/Screens/Networks/api_endpoint.dart';
import 'package:blackchecktech/Screens/Networks/api_response.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
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
  Rx<TextEditingController> linkController = TextEditingController().obs;
  Rx<TextEditingController> descController = TextEditingController().obs;
  Rx<TextEditingController> tagController = TextEditingController().obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  List<String> tagValues = [];

  RxList<TopicList> topicList = <TopicList>[].obs;
  List topicNameList = [].obs;
  String? topicName;
  List<DropdownMenuItem<String>>? dropDownTopicItems;

  RxList<TopicList> languageList = <TopicList>[].obs;
  List languageNameList = [].obs;
  String? languageName;
  List<DropdownMenuItem<String>>? dropDownLanguageItems;

  RxList<UserList> userList = <UserList>[].obs;
  RxList<UserList> selectedList = <UserList>[].obs;

  ScrollController scrollController = ScrollController();
  RxInt PageNumber = 0.obs;
  RxBool isPaginationLoading = false.obs;
  RxBool isSearched = false.obs;
  RxInt userCount = 0.obs;

  initScrolling(BuildContext context, bool pagination) {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        _scrollDown();
        isPaginationLoading.value = true;
        await userListAPI(context, pagination);
        isPaginationLoading.value = false;
      }
    });
  }

  void _scrollDown() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  topicListAPI(BuildContext context) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

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

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            topicListAPI(context);
          } else if (model.statusCode == 200) {
            TopicListModel detail = TopicListModel.fromJson(userModel);

            topicList.value = detail.data!;

            if (topicList.isNotEmpty) {
              for (var item in topicList) {
                topicNameList.add(item.name);
              }
              dropDownTopicItems = getDropDownTopicItems();
              // topicName.value = dropDownTopicItems![0].value!;
            }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  List<DropdownMenuItem<String>> getDropDownTopicItems() {
    List<DropdownMenuItem<String>> items = [];
    for (var topicName in topicNameList) {
      items.add(DropdownMenuItem(
          value: topicName,
          child: Text(
            topicName.toString().capitalize!,
            style: const TextStyle(
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
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlLanguageList;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token.toString()).then((value) {
      http.StreamedResponse res = value;

      languageList.clear();
      languageNameList.clear();
      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            languageListAPI(context);
          } else if (model.statusCode == 200) {
            TopicListModel detail = TopicListModel.fromJson(userModel);

            languageList.value = detail.data!;

            if (languageList.isNotEmpty) {
              for (var item in languageList) {
                languageNameList.add(item.name);
              }
              dropDownLanguageItems = getDropDownLanguageItems();
              // languageName.value = dropDownLanguageItems![0].value!;
            }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  List<DropdownMenuItem<String>> getDropDownLanguageItems() {
    List<DropdownMenuItem<String>> items = [];
    for (var languageName in languageNameList) {
      items.add(DropdownMenuItem(
          value: languageName,
          child: Text(
            languageName.toString().capitalize!,
            style: const TextStyle(
                color: black_121212,
                fontWeight: FontWeight.w500,
                fontFamily: "SFProDisplay",
                fontStyle: FontStyle.normal,
                fontSize: 15.0),
          )));
    }
    return items;
  }

  //Speaker List / Host List
  userListAPI(BuildContext context, bool pagination, [userId, data]) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    dynamic body;

    if (pagination == false) {
      if (userId != null) {
        body = {
          'user_id': userId.toString(),
          'search': searchController.value.text.toString(),
        };
      } else {
        body = {
          'search': searchController.value.text.toString(),
        };
      }
    } else {
      if(userId == null && data != null){
        PageNumber.value = 0;
      }
      PageNumber = PageNumber + 1;
      if (userId != null) {
        body = {
          'user_id': userId.toString(),
          'search': searchController.value.text.toString(),
          'page': PageNumber.toString(),
        };
      } else if (userId == null && data != null) {
        body = data;
      } else {
        body = {
          'search': searchController.value.text.toString(),
          'page': PageNumber.toString(),
        };
      }
    }

    String url = urlBase + urlUserList;
    final apiReq = Request();
    await apiReq.postAPI(url, body, token.toString()).then((value) {
      if (PageNumber == 1) {
        userList.clear();
        print("clear");
      }
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            userListAPI(context, pagination, [userId]);
          } else if (model.statusCode == 200) {
            UserListModel detail = UserListModel.fromJson(userModel);
            userCount.value = detail.user_count!;

            if (pagination == false) {
              userList.value = detail.data!;
            } else {
              if (PageNumber == 1) {
                userList.clear();
                print("clear");
              }
              userList.addAll(detail.data!);
            }
            print("clear" + userList.length.toString());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  createVideoApi(BuildContext context) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    List speaker = [];

    for (var item in selectedList) {
      speaker.add(item.id);
    }

    dynamic body = {
      'description': descController.value.text,
      'topic': topicName.toString(),
      'language': languageName.toString(),
      'speakers': speaker.join(','),
      'title': titleController.value.text,
      'tags': tagValues.join(','),
      'embeded_code': linkController.value.text,
    };

    String url = urlBase + urlVideoCreate;
    final apiReq = Request();
    await apiReq.postAPI(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            createVideoApi(context);
          } else if (model.statusCode == 200) {
            snackBar(context, 'Video Uploaded');
            for (var item in userList) {
              if (item.isSpeakerSelected == true) {
                item.isSpeakerSelected = false;
              }
            }
            Get.back();
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  bool checkVideoValidation(context) {
    if (titleController.value.text.isEmpty) {
      snackBar(context, "Enter video title");
      return false;
    } else if (topicName == null) {
      snackBar(context, 'Enter Topic');
      return false;
    } else if (languageName == null) {
      snackBar(context, 'Enter Language');
      return false;
    } else if (linkController.value.text.isEmpty) {
      snackBar(context, "Enter video link");
      return false;
    } else if (!RegExp(
            r'^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube(-nocookie)?\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$')
        .hasMatch(linkController.value.text)) {
      snackBar(context, "Enter valid video link");
      return false;
    } else if (descController.value.text.isEmpty) {
      snackBar(context, "Enter video description");
      return false;
    } else if (tagValues.isEmpty) {
      snackBar(context, 'Enter related tags');
      return false;
    } else if (selectedList.toString() == '[]') {
      snackBar(context, "Tag Speaker");
      return false;
    } else {
      return true;
    }
  }
}
