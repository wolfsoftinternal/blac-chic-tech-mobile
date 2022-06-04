import 'dart:async';
import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CityListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CountryListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/StateListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalQueFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/EducationInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/ExperienceInfoFormView.dart';
import 'package:blackchecktech/Screens/Home/BottomNavigation.dart';
import 'package:blackchecktech/Screens/Home/Settings/controller/SettingsController.dart';
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
import '../../login/model/SignupModel.dart';

class StepsController extends GetxController {
  Rx<TextEditingController> dobController = TextEditingController().obs;
  Rx<TextEditingController> aboutController = TextEditingController().obs;
  Rx<TextEditingController> linkedinController = TextEditingController().obs;
  Rx<TextEditingController> twitterController = TextEditingController().obs;
  Rx<TextEditingController> instagramController = TextEditingController().obs;
  var countrylist = <CountryDatum>[].obs;
  var stateList = <StateDatum>[].obs;
  var cityList = <CityDatum>[].obs;
  RxString strCountryId = "".obs;
  RxString strStateId = "".obs;
  RxString strCityId = "".obs;
  RxString imagePath = "".obs;

  Rx<TextEditingController> currentTitleController =
      TextEditingController().obs;
  Rx<TextEditingController> currentCompanyNameController =
      TextEditingController().obs;
  Rx<TextEditingController> currentCompanyWebsiteController =
      TextEditingController().obs;
  RxList companyList = [].obs;

  RxBool boolComapnyLogo = false.obs;
  Rx<TextEditingController> searchCompanyController =
      TextEditingController().obs;
  RxString companyName = "Company Name".obs;
  RxList pastCompanyDetails = [].obs;
  RxList educationalDetails = [].obs;

  Rx<TextEditingController> q1Controller = TextEditingController().obs;
  Rx<TextEditingController> q2Controller = TextEditingController().obs;
  Rx<TextEditingController> q3Controller = TextEditingController().obs;
  Rx<TextEditingController> q4Controller = TextEditingController().obs;
  Rx<TextEditingController> q5Controller = TextEditingController().obs;

  Rx<TextEditingController> addtionalController = TextEditingController().obs;

  List<String> tagValues = [];

  RxString ques1 = SharePreData.strQues1.obs;
  RxString ques2 = SharePreData.strQues2.obs;
  RxString ques3 = SharePreData.strQues3.obs;
  RxString ques4 = SharePreData.strQues4.obs;
  RxString ques5 = SharePreData.strQues5.obs;

  RxList questions = [].obs;

  SettingsController settingsController = Get.put(SettingsController());
  Rx<TextEditingController> pastJobName = TextEditingController().obs;
  RxString pastJobImage = ''.obs;

  ScrollController scrollController = ScrollController();
  RxInt pageNumber = 1.obs;
  RxBool isPaginationLoading = false.obs;

  initScrolling(BuildContext context) {
    scrollController.addListener(() async {
      print("Scrolling");

      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        _scrollDown();
        isPaginationLoading.value = true;
        pageNumber = pageNumber + 1;
        print("pageNumber $pageNumber");
        dynamic body = {
          'page': pageNumber.toString()
        };
        await companyListAPI(context, body);
        isPaginationLoading.value = false;
      }
    });
  }

  void _scrollDown() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }


  countryListApi() async {
    String url = urlBase + urlCountryList;

    final apiReq = Request();

    await apiReq.postAPIwithoutBearer(url, null).then((value) async {
      http.StreamedResponse res = value;
      countrylist.clear();
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

  cityListApi(String countryId, String stateId) async {
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

  Future<void> personalInfoAPI(BuildContext context, isFrom, [visibility]) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    var headers = {'Authorization': 'Bearer ' + token!};
    var request =
        http.MultipartRequest('POST', Uri.parse(urlBase + urlPersonalInfo));

    if (visibility != null) {
      request.fields.addAll({
        'is_visible': visibility.toString(),
      });
    } else if (isFrom == 'about_us'){
      request.fields.addAll({
        'current_job_title': currentTitleController.value.text,
        'current_job_company_name': companyName.value,
        'current_job_website': currentCompanyWebsiteController.value.text,
        'past_jobs': pastCompanyDetails.toJson().toString(),
        'education': educationalDetails.toJson().toString(),
        'questions': questions.toJson().toString(),
      });
    } else {
      if (imagePath != "") {
        request.files.add(await http.MultipartFile.fromPath(
            'image', imagePath.value.toString()));
      }
      request.fields.addAll({
        'country_id': strCountryId.value.toString(),
        'state_id': strStateId.value.toString(),
        'city_id': strCityId.value.toString(),
        'birthdate': dobController.value.text,
        'about_us': aboutController.value.text,
        'linkedin_url': linkedinController.value.text,
        'instagram_url': instagramController.value.text,
        'twitter_url': twitterController.value.text,
      });
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

          personalInfoAPI(context, imagePath);
        } else if (model.statusCode == 200) {
          SignupModel? signUp = SignupModel.fromJson(userModel);

          var preferences = MySharedPref();
          await preferences.setSignupModel(signUp, SharePreData.keySignupModel);

          if(visibility != null){
            settingsController.visible.value = signUp.data!.isVisible!;
          }else{
            if(isFrom == 'edit_profile'){
              Get.back();
              snackBar(context, 'Profile edited successfully');
            }else if(isFrom == 'about_us'){
              Get.back();
              snackBar(context, 'Profile edited successfully');
            }else{
              Get.to(const ExperienceInfoFormView());
            }
          }
          
        } else {
          Navigator.pop(context); //pop
          snackBar(context, model.message!);
        }
      });
    } else {
      Navigator.pop(context); //pop
      print(response.reasonPhrase);
    }
  }

  companyListAPI(BuildContext context, body) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlCompanyList;
    final apiReq = Request();
    await apiReq.postAPI(url, body, token.toString()).then((value) {
      if(pageNumber==1){
        companyList.clear();
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

            companyListAPI(context, body);
          } else if (model.statusCode == 200) {
            companyList.addAll(userModel['data']);
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  Future<void> createCompanyAPI(BuildContext context, String imagePath) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    var headers = {'Authorization': 'Bearer ' + token!};
    var request =
        http.MultipartRequest('POST', Uri.parse(urlBase + urlCreateCompany));

    request.files.add(await http.MultipartFile.fromPath('logo', imagePath));
    request.fields.addAll({
      'name': currentCompanyNameController.value.text,
    });

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

          createCompanyAPI(context, imagePath);
        } else if (model.statusCode == 200) {
          Get.back();
          Get.back();
        } else {
          Navigator.pop(context); //pop
          snackBar(context, model.message!);
        }
      });
    } else {
      Navigator.pop(context); //pop
      print(response.reasonPhrase);
    }
  }

  experienceInfoAPI(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'current_job_title': currentTitleController.value.text,
      'current_job_company_name': companyName.value,
      'current_job_website': currentCompanyWebsiteController.value.text,
      'past_jobs': pastCompanyDetails.toJson().toString(),
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

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            experienceInfoAPI(context);
          } else if (model.statusCode == 200) {
            SignupModel? signUp = SignupModel.fromJson(userModel);

            var preferences = MySharedPref();
            await preferences.setSignupModel(
                signUp, SharePreData.keySignupModel);
            if (myModel?.data!.educations == null ||
                myModel?.data!.educations.toString() == '[]') {
              Get.to(const EducationInfoFormView());
            } else if (myModel?.data!.questions == null ||
                myModel?.data!.questions.toString() == '[]') {
              Get.to(const AdditionalQueFormView());
            } else if (myModel?.data!.questions == null ||
                myModel?.data!.questions.toString() == '[]') {
              String lastQuestionsInfo = "";
              for (int i = 0; i < myModel!.data!.questions!.length; i++) {
                if (myModel.data!.questions![i].type == "additional") {
                  lastQuestionsInfo = "Done";
                }
              }
              if (lastQuestionsInfo != "Done") {
                Get.to(const AdditionalLastQueView());
              } else {
                Get.offAll(BottomNavigation());
              }
            } else {
              Get.offAll(BottomNavigation());
            }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  educationalInfoAPI(BuildContext context) async {
    var preferences = MySharedPref();
    SignupModel? myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'education': educationalDetails.toJson().toString(),
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

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            experienceInfoAPI(context);
          } else if (model.statusCode == 200) {
            SignupModel? signUp = SignupModel.fromJson(userModel);

            var preferences = MySharedPref();
            await preferences.setSignupModel(
                signUp, SharePreData.keySignupModel);
            if (myModel?.data!.questions == null ||
                myModel?.data!.questions.toString() == '[]') {
              Get.to(const AdditionalQueFormView());
            } else if (myModel?.data!.questions == null ||
                myModel?.data!.questions.toString() == '[]') {
              String lastQuestionsInfo = "";
              for (int i = 0; i < myModel!.data!.questions!.length; i++) {
                if (myModel.data!.questions![i].type == "additional") {
                  lastQuestionsInfo = "Done";
                }
              }
              if (lastQuestionsInfo != "Done") {
                Get.to(const AdditionalLastQueView());
              } else {
                Get.offAll(BottomNavigation());
              }
            } else {
              Get.offAll(BottomNavigation());
            }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  questionsInfoAPI(BuildContext context, type) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'questions': questions.toJson().toString(),
      'type': type.toString()
    };

    String url = urlBase + urlQuestion;
    final apiReq = Request();
    await apiReq.postAPI(url, body, token).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            questionsInfoAPI(context, type);
          } else if (model.statusCode == 200) {
            SignupModel? signUp = SignupModel.fromJson(userModel);

            var preferences = MySharedPref();
            await preferences.setSignupModel(
                signUp, SharePreData.keySignupModel);
            SignupModel? myModel =
                await preferences.getSignupModel(SharePreData.keySignupModel);
            if (myModel?.data!.questions == null ||
                myModel?.data!.questions.toString() == '[]') {
              Get.to(const AdditionalLastQueView());
            } else if (myModel?.data!.questions != null ||
                myModel?.data!.questions.toString() != '[]') {
              String questionsInfo = "";
              String lastQuestionsInfo = "";
              for (int i = 0; i < myModel!.data!.questions!.length; i++) {
                if (myModel.data!.questions![i].type == "normal") {
                  questionsInfo = "Done";
                } else {
                  lastQuestionsInfo = "Done";
                }
              }
              if (questionsInfo != "Done") {
                Get.offAll(const AdditionalQueFormView());
              } else if (lastQuestionsInfo != "Done") {
                Get.offAll(const AdditionalLastQueView());
              } else {
                Get.offAll(BottomNavigation());
              }
            } else {
              Get.offAll(BottomNavigation());
            }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  bool checkPersonalValidation(context) {
    if (imagePath.value.isEmpty) {
      snackBar(context, "Upload Image");
      return false;
    } else if (strCountryId.value.isEmpty) {
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
    } else if (aboutController.value.text.isEmpty) {
      snackBar(context, "Enter About yourself");
      return false;
      // } else if (linkedinController.value.text.isEmpty) {
      //   snackBar(context, "Enter Linkedin Account");
      //   return false;
      // } else if (twitterController.value.text.isEmpty) {
      //   snackBar(context, "Entered Twitter Account");
      //   return false;
      // } else if (instagramController.value.text.isEmpty) {
      //   snackBar(context, "Entered Instagram Account");
      //   return false;
    } else {
      return true;
    }
  }

  bool checkAddCompanyValidation(context) {
    if (boolComapnyLogo.value == false) {
      snackBar(context, "Upload Company Logo");
      return false;
    } else if (currentCompanyNameController.value.text.isEmpty) {
      snackBar(context, "Enter Company Name");
      return false;
    } else {
      return true;
    }
  }

  bool checkExperienceValidation(context) {
    if (currentTitleController.value.text.isEmpty) {
      snackBar(context, "Enter current job title");
      return false;
    } else if (companyName.value == 'Company Name') {
      snackBar(context, "Enter current company name");
      return false;
    } else {
      return true;
    }
  }
}
