import 'dart:convert';

import 'package:blackchecktech/Model/BaseModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/UserListModel.dart';
import 'package:blackchecktech/Screens/Networks/api_endpoint.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:photo_manager/photo_manager.dart';

class PostController extends GetxController {
  Rx<TextEditingController> captionController = TextEditingController().obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<UserList> selectedList = <UserList>[].obs;
  RxList<UserList> searchList = <UserList>[].obs;
  RxString location = "".obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxString address = "".obs;
  Rx<TextEditingController> searchLocationController =
      TextEditingController().obs;
  RxList<AssetEntity> assetImages = <AssetEntity>[].obs;

  createPostAPI(BuildContext context) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    var headers = {'Authorization': 'Bearer ' + token!};
    var request =
        http.MultipartRequest('POST', Uri.parse(urlBase + urlCreatePost));

    List taggedUser = [];

    for (var item in selectedList) {
      taggedUser.add(item.id);
    }

    // request.files.add(await http.MultipartFile.fromPath('image', ''));

    request.fields.addAll({
      'caption': captionController.value.text,
      'address': location.toString(),
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'tagged_users': taggedUser.join(',')
    });

    if (assetImages.length > 0) {
      request.files.add(await http.MultipartFile.fromPath(
          'image',
          (assetImages.value[0].relativePath ?? "") +
              "/" +
              (assetImages.value[0].title ?? "")));
    }

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) async {
        String strData = value;
        Map<String, dynamic> userModel = json.decode(strData);
        BaseModel model = BaseModel.fromJson(userModel);

        if (model.statusCode == 500) {
          final tokenUpdate = TokenUpdateRequest();
          await tokenUpdate.updateToken();

          createPostAPI(context);
        } else if (model.statusCode == 200) {
          snackBar(context, model.message!);
          Get.back();
        }
      });
    } else {
      Navigator.pop(context); //pop
      print(response.reasonPhrase);
    }
  }
}
