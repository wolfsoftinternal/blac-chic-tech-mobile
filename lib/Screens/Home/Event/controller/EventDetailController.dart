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
  RxInt pageNumber = 1.obs;
  RxInt pastUpcomingPageNumber = 1.obs;
  RxBool isPaginationLoading = false.obs;
  RxBool isPastUpcomingPaginationLoading = false.obs;
  

  initScrolling(BuildContext context, body) {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        _scrollDown();
        isPaginationLoading.value = true;
        // pageNumber = pageNumber + 1;
        await allEventListApi(body);
        isPaginationLoading.value = false;
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
        await allEventListApi(body);
        isPastUpcomingPaginationLoading.value = false;
      }
    });
  }

  void _pastUpcomingScrollDown() {
    pastUpcomingScrollController.jumpTo(pastUpcomingScrollController.position.maxScrollExtent);
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

  allEventListApi(body) async {
    String url = urlBase + urlallEventList;
    final apiReq = Request();

    await apiReq.postAPIwithoutBearer(url, body).then((value) async {
      if(pageNumber == 1){
        eventList.clear();
        upcomingEventList.clear();
        pastEventList.clear();
      }
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData order' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 200) {
            List<EventList> upcoming = [];
            List<EventList> past = [];

            EventListModel detail = EventListModel.fromJson(userModel);
            eventList.value = detail.data!;

            for(var item in eventList){
              if(item.event_type == 'past'){
                past.add(item);
              }else{
                upcoming.add(item);
              }
            }
            upcomingEventList.value = upcoming;
            pastEventList.value = past;
          } else if(model.statusCode == 101){
            eventList.clear();
            upcomingEventList.clear();
            pastEventList.clear();
          }else {
            print(res.reasonPhrase);
          }
        });
      }
    });
  }

  // allEventDetailApi(id) async {
  //   String url = urlBase + urlallEventDetail;
  //   final apiReq = Request();

  //   dynamic body = {
  //     'event_id': id.toString(),
  //   };

  //   await apiReq.postAPIwithoutBearer(url, body).then((value) async {
  //     http.StreamedResponse res = value;

  //     if (res.statusCode == 200) {
  //       await res.stream.bytesToString().then((value) async {
  //         String strData = value;
  //         Map<String, dynamic> userModel = json.decode(strData);
  //         BaseModel model = BaseModel.fromJson(userModel);

  //         if (model.statusCode == 200) {
  //           EventDetailModel detail = EventDetailModel.fromJson(userModel);
  //           eventDetails.value = detail.data!;
  //           Get.to(EventDetail());
  //         }else {
  //           print(res.reasonPhrase);
  //         }
  //       });
  //     }
  //   });
  // }




}
