import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CityListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CountryListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/StateListModel.dart';
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
import '../../login/model/LoginModel.dart';

class StepsController extends GetxController {
  Rx<TextEditingController> dobController = TextEditingController().obs;
  Rx<TextEditingController> linkedinController = TextEditingController().obs;
  Rx<TextEditingController> twitterController = TextEditingController().obs;
  Rx<TextEditingController> instagramController = TextEditingController().obs;
  var countrylist = <CountryDatum>[].obs;
  var stateList = <StateDatum>[].obs;
  var cityList = <CityDatum>[].obs;
  RxString strCountryId = "".obs;
  RxString strStateId = "".obs;
  RxString strCityId = "".obs;

  countryListApi() async {
    String url = urlBase + urlCountryList;

    final apiReq = Request();

    await apiReq.postAPIwithoutBearer(url, null).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 200) {
            CountryListModel countryListModel =
                CountryListModel.fromJson(userModel);

            countrylist.addAll(countryListModel.data!);

            printData("Country List length ", countrylist.length.toString());

          } else {
            print(res.reasonPhrase);
          }
        });
      }
    });
  }

  stateListApi(String countryId) async {
    //Clearing statelist and citylist
    stateList.clear();
    cityList.clear();

    String url = urlBase + urlStateList;

    final apiReq = Request();

    dynamic body = {
      'country_id': countryId,
    };

    await apiReq.postAPIwithoutBearer(url, body).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 200) {
            StateListModel stateListM = StateListModel.fromJson(userModel);
            stateList.addAll(stateListM.data!);
          } else {
            print(res.reasonPhrase);
          }
        });
      }
    });
  }

  cityListApi(String countryId,String stateId) async {
    //clearing city list
    cityList.clear();

    String url = urlBase + urlCityList;

    final apiReq = Request();

    dynamic body = {
      'country_id': countryId,
      'state_id': stateId,
    };

    await apiReq.postAPIwithoutBearer(url, body).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 200) {
            CityListModel cityListModel = CityListModel.fromJson(userModel);
            cityList.addAll(cityListModel.data!);

          } else {
            print(res.reasonPhrase);
          }
        });
      }
    });
  }

  personalInfoAPI(BuildContext context) async {
    // var preferences = MySharedPref();
    // //User Personal details
    // SigninModel myModel =
    // await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
    // var token = myModel?.data.token;
    // dynamic body = {
    //   'search':search,
    // };

    // String url = urlBase + urlStoreList;
    // final apiReq = Request();
    // await apiReq.postAPI(url, body, token).then((value) {
    //   http.StreamedResponse res = value;

    //   printData("Category List API response status code" , res.statusCode.toString());

    //   if (res.statusCode == 200) {
    //     res.stream.bytesToString().then((value) async {
    //       String strData = value;
    //       Map<String, dynamic> userModel = json.decode(strData);
    //       BaseModel model = BaseModel.fromJson(userModel);

    //       printData("Category List API response message" , model.message.toString());

    //       if(model.statusCode ==500){
    //         final tokenUpdate = TokenUpdateRequest();
    //         await tokenUpdate.updateToken();

    //         displayMarketList("");
    //       }else if(model.statusCode==200){
    //         MarketListModel categoryModel = MarketListModel.fromJson(userModel);
    //         marketList.value = categoryModel.marketList;

    //         //CategoryList.addAll(categoryModel.data);

    //         printData("marketList list", marketList.toString());
    //         printData("marketList  length", marketList.length.toString());

    //         if(marketList.length>0){
    //           isLoading(false);
    //           boolDisplayMarketProduct.value = true;
    //         }else{
    //           boolDisplayMarketProduct.value = false;
    //         }

    //         printData("Category list", boolDisplayMarketProduct.toString());
    //       }

    //     });
    //   }else{
    //     print(res.reasonPhrase);
    //   }

    // });
  }

  bool checkValidation(context) {
    if (strCountryId.value.isEmpty) {
      snackBar(context, "Enter Country");
      return false;
    } else if (strStateId.value.isEmpty) {
      snackBar(context, "Enter State");
      return false;
    } else if (strCityId.value.isEmpty) {
      snackBar(context, "Enter City");
      return false;
    } else if (dobController.value.text.isEmpty) {
      snackBar(context, "Enter Date of Birth");
      return false;
    } else if (linkedinController.value.text.isEmpty) {
      snackBar(context, "Enter Linkedin Account");
      return false;
    } else if (twitterController.value.text.isEmpty) {
      snackBar(context, "Entered Twitter Account");
      return false;
    } else if (instagramController.value.text.isEmpty) {
      snackBar(context, "Entered Instagram Account");
      return false;
    } else {
      return true;
    }
  }
}
