import 'dart:convert';
import 'dart:io';

import 'package:blackchecktech/Model/BaseModel.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/TopicListModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/UserListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/EventDetail.dart';
import 'package:blackchecktech/Screens/Networks/api_endpoint.dart';
import 'package:blackchecktech/Screens/Networks/api_response.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class EventController extends GetxController {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> startDateController = TextEditingController().obs;
  Rx<TextEditingController> endDateController = TextEditingController().obs;
  Rx<TextEditingController> startTimeController = TextEditingController().obs;
  Rx<TextEditingController> venueController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> landmarkController = TextEditingController().obs;
  Rx<TextEditingController> street1Controller = TextEditingController().obs;
  Rx<TextEditingController> street2Controller = TextEditingController().obs;
  String? categoryNameController;
  Rx<TextEditingController> amountController = TextEditingController().obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<UserList> selectedList = <UserList>[].obs;
  RxString inviteList = ''.obs;
  RxList<UserList> searchList = <UserList>[].obs;
  RxList benefitDetails = [].obs;
  RxList admissionDetails = [].obs;
  RxString selectName = "Select All".obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxInt selectedAdmission = 0.obs;
  RxString poster = ''.obs;
  RxList<dynamic> selectedSpeaker = <dynamic>[].obs;
  RxString speakers = ''.obs;
  RxList<UserList> selectedHost = <UserList>[].obs;
  RxString host = ''.obs;
  Rx<TextEditingController> speakerController = TextEditingController().obs;
  Rx<TextEditingController> detailController = TextEditingController().obs;
  RxInt countryId = 0.obs;
  RxInt stateId = 0.obs;
  RxInt cityId = 0.obs;
  RxString admissionType = ''.obs;

  Future<void> createEventAPI(BuildContext context) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    var headers = {'Authorization': 'Bearer ' + token!};
    var request =
        http.MultipartRequest('POST', Uri.parse(urlBase + urlCreateEvent));

    request.files
        .add(await http.MultipartFile.fromPath('poster', poster.value));

    if (admissionType.value == 'ticket_price') {
      request.fields.addAll({
        'title': titleController.value.text,
        'start_date': startDateController.value.text,
        'end_date': endDateController.value.text,
        'start_time': startTimeController.value.text,
        'venue': venueController.value.text,
        'address': 'jkd',
        'details': detailController.value.text,
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'country_id': countryId.toString(),
        'state_id': stateId.toString(),
        'city_id': cityId.toString(),
        'speakers': speakers.value,
        'hosts': host.value,
        'admission_type': admissionType.value,
        'admission_data': admissionDetails.toJson().toString(),
      });
    } else if (admissionType.value == 'invite_only') {
      request.fields.addAll({
        'title': titleController.value.text,
        'start_date': startDateController.value.text,
        'end_date': endDateController.value.text,
        'start_time': startTimeController.value.text,
        'venue': venueController.value.text,
        'address': 'awdd',
        'details': detailController.value.text,
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'country_id': countryId.toString(),
        'state_id': stateId.toString(),
        'city_id': cityId.toString(),
        'speakers': speakers.value,
        'hosts': host.value,
        'admission_type': admissionType.value,
        'invited_users': inviteList.toString(),
        'benifits': benefitDetails.toJson().toString(),
      });
    } else {
      request.fields.addAll({
        'title': titleController.value.text,
        'start_date': startDateController.value.text,
        'end_date': endDateController.value.text,
        'start_time': startTimeController.value.text,
        'venue': venueController.value.text,
        'address': 'efdfd',
        'details': detailController.value.text,
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'country_id': countryId.toString(),
        'state_id': stateId.toString(),
        'city_id': cityId.toString(),
        'speakers': speakers.value,
        'hosts': host.value,
        'admission_type': admissionType.value,
        'benifits': benefitDetails.toJson().toString(),
      });
    }

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) async {
        print(value);
        String strData = value;
        Map<String, dynamic> userModel = json.decode(strData);
        BaseModel model = BaseModel.fromJson(userModel);

        if (model.statusCode == 500) {
          final tokenUpdate = TokenUpdateRequest();
          await tokenUpdate.updateToken();

          createEventAPI(context);
        } else if (model.statusCode == 200) {
          var id = userModel['data']['id'];
          checkNet(context)
              .then((value) => controller.eventDetailAPI(context, id)).then((value) {
                Get.back();
          Get.back();
          Get.back();});
          
        }
      });
    } else {
      Navigator.pop(context); //pop
      print(response.reasonPhrase);
    }
  }
}
