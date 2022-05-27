import 'dart:async';
import 'dart:convert';

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/UserListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/EventDetailModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/EventListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/PostListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/VideoListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/EventDetail.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/EventListDetail.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/Profile.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

import '../../../../Model/BaseModel.dart';
import '../../../../Utils/CommonWidget.dart';
import '../../../../Utils/preference_utils.dart';
import '../../../../Utils/share_predata.dart';
import '../../../Networks/api_endpoint.dart';
import '../../../Networks/api_response.dart';

class EventDetailController extends GetxController {
Rx<TextEditingController> searchController = TextEditingController().obs;

  
}
