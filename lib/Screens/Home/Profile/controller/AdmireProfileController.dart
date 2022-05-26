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

class AdmireProfileController extends GetxController {
  RxList<AdmireList> admireList = <AdmireList>[].obs;
  RxList<AdmireList> otherAdmireList = <AdmireList>[].obs;
  Rx<UserDetails> details = UserDetails().obs;
  RxList<PostList> postList = <PostList>[].obs;
  RxList<PostList> postDetailList = <PostList>[].obs;
  RxList<VideoList> videoList = <VideoList>[].obs;
  RxList<VideoList> videoDetailList = <VideoList>[].obs;
  RxList<EventList> eventList = <EventList>[].obs;
  RxList<EventList> eventDetailList = <EventList>[].obs;
  List<VideoPlayerController> videoController = [];
  List<VideoPlayerController> videoControllerList = [];
  Rx<EventList> eventDetails = EventList().obs;
  late List initializeVideoPlayerFuture = [];
  late List initializeVideoPlayerFutureList = [];
  List video = [];
  Rx<Duration> position = Duration().obs;
  Rx<Duration> duration = Duration().obs;
  RxBool isRearrange = false.obs;
  RxList<UserList> selectedList = <UserList>[].obs;
  RxList<UserList> searchList = <UserList>[].obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxInt selectedIndex = 1.obs;
  RxString admire = ''.obs;
  // EventController controller = Get.put(EventController());

  admireListAPI(BuildContext context, body) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urladmireList;
    final apiReq = Request();
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

            admireListAPI(context, body);
          } else if (model.statusCode == 200) {
            AdmireListModel detail = AdmireListModel.fromJson(userModel);

            if (body == null) {
              admireList.value = detail.data!;
            } else {
              otherAdmireList.value = detail.data!;
            }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  admireDeleteAPI(BuildContext context, id) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlDeleteAdmire;
    final apiReq = Request();
    dynamic body = {
      'admire_id': id.toString(),
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

            admireDeleteAPI(context, id);
          } else if (model.statusCode == 200) {
            admireListAPI(context, null);
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  userProfileAPI(BuildContext context) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlUserProfile;
    final apiReq = Request();

    await apiReq.postAPI(url, null, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            userProfileAPI(context);
          } else if (model.statusCode == 200) {
            SignupModel admireListModel = SignupModel.fromJson(userModel);

            details.value = admireListModel.data!;
            Get.to(Profile());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  admireProfileAPI(BuildContext context, id) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlOtherProfile;
    final apiReq = Request();

    dynamic body = {
      'user_id': id.toString(),
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

            admireProfileAPI(context, id);
          } else if (model.statusCode == 200) {
            UserDetails admireListModel =
                UserDetails.fromJson(userModel['data']);

            details.value = admireListModel;
            print(details);
            Get.to(Profile());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  postListAPI(BuildContext context, body) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlPostList;
    final apiReq = Request();

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

            postListAPI(context, body);
          } else if (model.statusCode == 200) {
            PostListModel detail = PostListModel.fromJson(userModel);

            if (body == null) {
              postList.value = detail.data!;
            } else {
              postDetailList.value = detail.data!;
            }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  videoListAPI(BuildContext context, body) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlVideoList;
    final apiReq = Request();

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

            videoListAPI(context, body);
          } else if (model.statusCode == 200) {
            VideoListModel detail = VideoListModel.fromJson(userModel);

            if (body == null) {
              videoList.value = detail.data!;
              for (int i = 0; i < videoList.length; i++) {
                if (videoList[i].file == null) {
                  videoList.remove(videoList[i]);
                }
                videoControllerList
                    .add(VideoPlayerController.network(videoList[i].file!));
                initializeVideoPlayerFutureList
                    .add(videoControllerList[i].initialize());
              }
            } else {
              videoDetailList.value = detail.data!;
              videoController.clear();
              for (int i = 0; i < videoDetailList.length; i++) {
                if (videoDetailList[i].file == null) {
                  videoDetailList.remove(videoDetailList[i]);
                }
                videoController.add(
                    VideoPlayerController.network(videoDetailList[i].file!));
                initializeVideoPlayerFuture
                    .add(videoController[i].initialize());
              }
            }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  eventListAPI(BuildContext context, body) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlEventList;
    final apiReq = Request();

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

            eventListAPI(context, body);
          } else if (model.statusCode == 200) {
            EventListModel detail = EventListModel.fromJson(userModel);

            if (body == null) {
              eventList.value = detail.data!;
            } else {
              eventDetailList.value = detail.data!;
            }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  eventDetailAPI(BuildContext context, id) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'event_id': id.toString(),
    };

    String url = urlBase + urlEventDetail;
    final apiReq = Request();

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

            eventDetailAPI(context, id);
          } else if (model.statusCode == 200) {
            EventDetailModel detail = EventDetailModel.fromJson(userModel);
            eventDetails.value = detail.data!;
            Get.to(EventDetail());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  eventDeleteAPI(BuildContext context, id) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'event_id': id.toString(),
    };

    String url = urlBase + urlDeleteEvent;
    final apiReq = Request();

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

            eventDetailAPI(context, id);
          } else if (model.statusCode == 200) {
            Get.back();
            Get.back();
            Get.to(EventListDetail(
              id: id,
            ));
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  replaceAdmireAPI(BuildContext context, id, number) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'admire_id': id.toString(),
      'admire_number': number.toString()
    };

    String url = urlBase + urlReplaceAdmire;
    final apiReq = Request();

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

            replaceAdmireAPI(context, id, number);
          } else if (model.statusCode == 200) {
            Get.back();
            Get.back();
            Get.to(EventListDetail(
              id: id,
            ));
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  createAdmireAPI(BuildContext context, id) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'admire_id': id.toString(),
    };

    String url = urlBase + urlCreateAdmire;
    final apiReq = Request();

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

            createAdmireAPI(context, id);
          } else if (model.statusCode == 200) {
            snackBar(context, model.message!);
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }
}
