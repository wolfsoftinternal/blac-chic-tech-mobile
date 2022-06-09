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

  // Get all featured list
  allFeaturedListApi() async {

    String url = urlBase + urlAllFeatures;
    final apiReq = Request();

    await apiReq.postAPIwithoutBearer(url, null).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData Features' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

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


}
