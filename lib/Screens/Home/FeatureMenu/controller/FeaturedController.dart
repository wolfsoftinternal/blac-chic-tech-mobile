import 'dart:convert';

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/FeatureMenu/model/FeaturedListModel.dart';
import 'package:blackchecktech/Screens/Home/transactions/model/PayoutListListModel.dart';
import 'package:blackchecktech/Screens/Home/transactions/model/TranscationListModel.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
import 'package:blackchecktech/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../Model/BaseModel.dart';
import '../../../../Utils/CommonWidget.dart';
import '../../../../Utils/preference_utils.dart';
import '../../../../Utils/share_predata.dart';
import '../../../Networks/api_endpoint.dart';
import '../../../Networks/api_response.dart';

class FeaturedController extends GetxController {

  RxList<FeaturedList> featuredList = <FeaturedList>[].obs;
  RxBool isDataFetched = false.obs;

  // Get all featured list
  allFeaturedListApi() async {

    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlAllFeatures;
    final apiReq = Request();

    await apiReq.postAPIWithBearer(url, null, token.toString()).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData Features' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          isDataFetched.value = true;

         if (model.statusCode == 200) {
            FeaturedListModel featuredListModel = FeaturedListModel.fromJson(userModel);
            featuredList.value = featuredListModel.data!;
          } else if(model.statusCode == 101){
           featuredList.clear();
          }else {
            print(res.reasonPhrase);
          }
        });
      }
    });
  }


  // Create admire
  likeFeatureAPI(BuildContext context, id, position) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'feature_id': id.toString(),
    };

    String url = urlBase + urlLikeFeatures;
    final apiReq = Request();

    await apiReq.postAPI(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

          print('like feature response ' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            likeFeatureAPI(context, id, position);
          } else if (model.statusCode == 200) {
            snackBar(context, model.message!);

            featuredList[position].is_like = 1;
            featuredList.refresh();

            update();
          } else if (model.statusCode == 101) {
            snackBar(context, model.message!);
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  DisLikeFeatureAPI(BuildContext context, id, position) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlDisLikeFeatures;
    final apiReq = Request();
    dynamic body = {
      'feature_id': id.toString(),
    };

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

            DisLikeFeatureAPI(context, id, position);
          } else if (model.statusCode == 200) {
            snackBar(context, model.message!);

            featuredList[position].is_like = 0;
            featuredList.refresh();
            update();
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

}
