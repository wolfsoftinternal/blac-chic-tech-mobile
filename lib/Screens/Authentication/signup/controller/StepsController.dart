import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CityListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CountryListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/StateListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalQueFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/EducationInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/ExperienceInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/PersonalInfoFormView.dart';
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

  Rx<TextEditingController> currentTitleController = TextEditingController().obs;
  Rx<TextEditingController> currentCompanyNameController = TextEditingController().obs;
  Rx<TextEditingController> currentCompanyWebsiteController = TextEditingController().obs;
  RxList companyList = [].obs;

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
    var preferences = MySharedPref();
    SignupModel? myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = myModel?.data!.token;

    dynamic body = {

    };

    String url = urlBase + urlPersonalInfo;
    final apiReq = Request();
    await apiReq.postAPI(url, body, token).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if(model.statusCode == 500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            personalInfoAPI(context);
          }else if(model.statusCode==200){
            Get.to(ExperienceInfoFormView());
          }
        });
      }else{
        print(res.reasonPhrase);
      }
    });
  }

  companyListAPI(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = myModel?.data!.token;

    String url = urlBase + urlCompanyList;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if(model.statusCode == 500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            companyListAPI(context);
          }else if(model.statusCode==200){
            companyList.value = userModel['data'];
          }
        });
      }else{
        print(res.reasonPhrase);
      }
    });
  }

  createCompanyAPI(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = myModel?.data!.token;

    dynamic body = {

    };

    String url = urlBase + urlCreateCompany;
    final apiReq = Request();
    await apiReq.postAPI(url, body, token).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if(model.statusCode == 500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            createCompanyAPI(context);
          }else if(model.statusCode==200){

          }
        });
      }else{
        print(res.reasonPhrase);
      }
    });
  }

  experienceInfoAPI(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = myModel?.data!.token;

    dynamic body = {

    };

    String url = urlBase + urlExperienceInfo;
    final apiReq = Request();
    await apiReq.postAPI(url, body, token).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if(model.statusCode == 500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            experienceInfoAPI(context);
          }else if(model.statusCode==200){
            Get.to(EducationInfoFormView());
          }
        });
      }else{
        print(res.reasonPhrase);
      }
    });
  }

  educationalInfoAPI(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = myModel?.data!.token;

    dynamic body = {

    };

    String url = urlBase + urlEducationalInfo;
    final apiReq = Request();
    await apiReq.postAPI(url, body, token).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if(model.statusCode == 500){
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            experienceInfoAPI(context);
          }else if(model.statusCode==200){
            Get.to(AdditionalQueFormView());
          }
        });
      }else{
        print(res.reasonPhrase);
      }
    });
  }

  bool checkPersonalValidation(context) {
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
