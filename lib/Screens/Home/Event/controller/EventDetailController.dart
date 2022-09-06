import 'dart:convert';

import 'package:blackchecktech/Screens/Authentication/signup/model/CityListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/EventListModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../Model/BaseModel.dart';
import '../../../../Utils/preference_utils.dart';
import '../../../../Utils/share_predata.dart';
import '../../../Networks/api_endpoint.dart';
import '../../../Networks/api_response.dart';
import '../../../Networks/token_update_request.dart';
import '../../Profile/model/VideoListModel.dart';

class EventDetailController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  var cityList = <CityDatum>[].obs;
  RxString strCityId = "".obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  RxList<EventList> eventList = <EventList>[].obs;
  RxList<EventList> upcomingEventList = <EventList>[].obs;
  RxList<EventList> pastEventList = <EventList>[].obs;
  Rx<EventList> eventDetails = EventList().obs;
  ScrollController scrollController = ScrollController();
  ScrollController pastUpcomingScrollController = ScrollController();
  RxInt pageNumber = 0.obs;
  RxInt pastUpcomingPageNumber = 1.obs;
  RxBool isPaginationLoading = false.obs;
  RxBool isPastUpcomingPaginationLoading = false.obs;
  RxBool isLoading = true.obs;

  initScrolling(BuildContext context) {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        _scrollDown();
        isPaginationLoading.value = true;
        pageNumber = pageNumber + 1;
        dynamic body = {
          'page': pageNumber.toString(),
          'event_type': 'upcoming',
        };
        await allEventListApi(body);
      }
    });
  }

  void _scrollDown() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  initPastUpcomingScrolling(BuildContext context) {
    pastUpcomingScrollController.addListener(() async {
      if (pastUpcomingScrollController.position.maxScrollExtent ==
          pastUpcomingScrollController.position.pixels) {
        _scrollDown();
        isPastUpcomingPaginationLoading.value = true;
        pastUpcomingPageNumber = pastUpcomingPageNumber + 1;
        dynamic body = {
          'page': pastUpcomingPageNumber.toString(),
        };
        await UpcomingPastEventListApi(body);
      }
    });
  }

  void _pastUpcomingScrollDown() {
    pastUpcomingScrollController
        .jumpTo(pastUpcomingScrollController.position.maxScrollExtent);
  }

  cityListApi() async {
    cityList.clear();
    String url = urlBase + urlCityListAll;
    final apiReq = Request();

    await apiReq.postAPIwithoutBearer(url, null).then((value) async {
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

  UpcomingPastEventListApi(body) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    String url = urlBase + urlUpcomingPast;
    final apiReq = Request();

    apiReq.postAPI(url, body, token.toString()).then((value) {
      if (pastUpcomingPageNumber == 1) {
        upcomingEventList.clear();
        pastEventList.clear();
      }
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData order' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 200) {
            EventListModel detail = EventListModel.fromJson(userModel);
            // eventList.addAll(detail.data!);
            pastEventList.clear();
            upcomingEventList.clear();
            for (var item in detail.data!) {
              if (item.event_status == 1) {
                pastEventList.add(item);
              } else {
                upcomingEventList.add(item);
              }
            }

            print(pastEventList.length);
            print(upcomingEventList.length);

            isLoading.value = false;
            isPastUpcomingPaginationLoading.value = false;
          } else {
            print(res.reasonPhrase);
            isLoading.value = false;
            isPastUpcomingPaginationLoading.value = false;
          }
        });
      }
    });
  }

  allEventListApi(body) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    String url = urlBase + urlallEventList;
    final apiReq = Request();

    apiReq.postAPI(url, body, token.toString()).then((value) {
      if (pageNumber == 1) {
        eventList.clear();
      }
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData order' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 200) {
            EventListModel detail = EventListModel.fromJson(userModel);
            eventList.addAll(detail.data!);

            isLoading.value = false;
            isPaginationLoading.value = false;
          } else {
            print(res.reasonPhrase);
            isLoading.value = false;
            isPaginationLoading.value = false;
          }
        });
      }
    });
  }
}
