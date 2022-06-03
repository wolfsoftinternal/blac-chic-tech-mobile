import 'dart:convert';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/MyPlayListModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/SpeakerVideoModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/TopicModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/VideoDetailModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/FindSpeaker.dart';
import 'package:blackchecktech/Screens/Networks/api_endpoint.dart';
import 'package:blackchecktech/Screens/Networks/api_response.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VideoMenuController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<VideoList> videoList = <VideoList>[].obs;
  RxList<VideoList> videoAllList = <VideoList>[].obs;
  var topicList = <TopicListModel>[].obs;
  var topicListAll = <TopicListModel>[].obs;
  Rx<TopicListModel> selectedTopic = TopicListModel(id: -1).obs;
  RxList<TopicListModel> selectMutiTopicList = <TopicListModel>[].obs;
  RxList<String> selectIdTopic = <String>[].obs;

  var languageList = <TopicListModel>[].obs;
  var languageListAll = <TopicListModel>[].obs;
  Rx<TopicListModel> selectedLanguage = TopicListModel(id: -1).obs;
  RxList<TopicListModel> selectMutiLanguList = <TopicListModel>[].obs;
  RxList<String> selectIdLanguage = <String>[].obs;

  var filtterList = <TopicListModel>[].obs;
  RxBool isLayoutFirst = false.obs;
  RxBool isTextChange = false.obs;
  var allTopicData = <TopicListModel>[].obs;
  var videoDetail = VideoDetail().obs;

  RxList<String> result = <String>[].obs;
  RxList<MyPlayModel> myPlayList = <MyPlayModel>[].obs;

  @override
  void onInit() {
    print("controller.selectedTopic.value ::" +
        selectedTopic.value.id.toString());
    videoListAPI();
    topicListAPI();
    languageListAPI();
    filtterListMethod("");
    videoListSearchAPI(topicFilter: "");
    myPlayListAPI();
    super.onInit();
  }

  videoListAPI({String? topicFilter, String? languageFilter}) async {
    isLoading.value = true;
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    String topicString1;
    String languageString1;
    if (topicFilter == "") {
      String topicString = topicFilter.toString().replaceAll('[', '');
      topicString1 = topicString.replaceAll(']', '');
    } else {
      topicString1 = "";
    }
    if (topicFilter == "") {
      String languageString = languageFilter.toString().replaceAll('[', '');
      languageString1 = languageString.replaceAll(']', '');
    } else {
      languageString1 = "";
    }

    dynamic body = {'topic': topicString1, 'language': languageString1};
    print("body :: " + body.toString());
    String url = urlBase + urlVideoList;
    final apiReq = Request();
    await apiReq.postAPI(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;
      videoList.clear();
      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          print(value.toString());
          SpeakerVideoModel speakerVideoList = speakerVideoModelFromJson(value);

          if (speakerVideoList.statusCode == 500) {
            isLoading.value = false;
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            videoListAPI();
          } else if (speakerVideoList.statusCode == 200) {
            isLoading.value = false;
            speakerVideoList.data!.forEach((element) {
              String dataVideos =
                  element.embededCode.toString().replaceAll("560", "130");
              String videoData = dataVideos.replaceAll("315", "60");
              videoList.add(VideoList(
                  id: element.id,
                  userId: element.userId,
                  title: element.title,
                  topic: element.topic,
                  language: element.language,
                  file: element.file,
                  embededCode: videoData,
                  tags: element.tags,
                  speakers: element.speakers,
                  status: element.status,
                  description: element.description,
                  deletedAt: element.deletedAt,
                  speakerList: element.speakerList,
                  isFocus: element.isFocus,
                  userDetails: element.userDetails,
                  createdAt: element.createdAt,
                  updatedAt: element.updatedAt));
            });
          } else {
            isLoading.value = false;
          }
        });
      } else {
        isLoading.value = false;
        print(res.reasonPhrase);
      }
    });
  }

  videoListSearchAPI({String? topicFilter}) async {
    isLoading.value = true;
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {'search': topicFilter.toString()};
    //FormData formData = new FormData.fromMap(body);

    String url = urlBase + urlVideoList;
    final apiReq = Request();
    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;
      videoAllList.clear();

      print("Stutus :: " + res.statusCode.toString());
      if (res.statusCode == 200) {
        isLoading.value = false;
        res.stream.bytesToString().then((value) async {
          print(value.toString());
          SpeakerVideoModel speakerVideoList = speakerVideoModelFromJson(value);

          if (speakerVideoList.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            videoListSearchAPI();
          } else if (speakerVideoList.statusCode == 200) {
            speakerVideoList.data!.forEach((element) {
              String dataVideos =
                  element.embededCode.toString().replaceAll("560", "130");
              String videoData = dataVideos.replaceAll("315", "60");
              videoAllList.add(VideoList(
                  id: element.id,
                  userId: element.userId,
                  title: element.title,
                  topic: element.topic,
                  language: element.language,
                  file: element.file,
                  embededCode: videoData,
                  tags: element.tags,
                  speakers: element.speakers,
                  status: element.status,
                  description: element.description,
                  deletedAt: element.deletedAt,
                  speakerList: element.speakerList,
                  isFocus: element.isFocus,
                  userDetails: element.userDetails,
                  createdAt: element.createdAt,
                  updatedAt: element.updatedAt));
            });
          }
        });
      } else {
        isLoading.value = false;
        print(res.reasonPhrase);
      }
    });
  }

  videoDetailsAPI({int? id}) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {"video_id": id.toString()};
    //FormData formData = new FormData.fromMap(body);

    String url = urlBase + urlVideoDetails;
    final apiReq = Request();
    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      print("Stutus videoDetailsAPI :: " + res.statusCode.toString());
      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          print(value.toString());
          VideoDetailModel videoDetailModel = videoDetailModelFromJson(value);
          print("videoDetailModel ::" +
              videoDetailModel.data!.embededCode.toString());

          if (videoDetailModel.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            videoListSearchAPI();
          } else if (videoDetailModel.statusCode == 200) {
            videoDetail.value = videoDetailModel.data!;
            String text = videoDetail.value.tags.toString();
            result.value = text.split(',');
          }
        });
      } else {
        isLoading.value = false;
        print(res.reasonPhrase);
      }
    });
  }

  topicListAPI() async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlTopicList;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token.toString()).then((value) {
      http.StreamedResponse res = value;
      topicList.clear();
      topicListAll.clear();
      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          TopicModel topicAllModel = topicModelFromJson(value);

          if (topicAllModel.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            videoListAPI();
          } else if (topicAllModel.statusCode == 200) {
            topicListAll.value = topicAllModel.data!;
            if (topicListAll.length > 5) {
              for (int i = 0; i < 5; i++) {
                topicList.add(topicListAll[i]);
              }
            } else {
              topicList.value = topicListAll;
            }
            topicList.add(TopicListModel(name: "SEE ALL TOPICS"));
          }

          print("Topic Lenght :: " + topicAllModel.data!.length.toString());
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  languageListAPI() async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlLanguageList;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token.toString()).then((value) {
      http.StreamedResponse res = value;
      languageList.clear();
      languageListAll.clear();
      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          TopicModel languageAllModel = topicModelFromJson(value);

          if (languageAllModel.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            languageListAPI();
          } else if (languageAllModel.statusCode == 200) {
            languageListAll.value = languageAllModel.data!;

            if (languageListAll.length > 5) {
              for (int i = 0; i < 5; i++) {
                languageList.add(languageListAll[i]);
              }
              print("Topic Lenght Lan:: " +
                  languageAllModel.data!.length.toString());
            } else {
              languageList.value = languageListAll;
            }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  void filtterListMethod(String myposition, {bool? check}) {
    print("myposition :: " + myposition.toString() + " " + check.toString());
    if (myposition == "") {
      allTopicData.value = topicListAll;
    } else if (myposition.contains("G-I")) {
      final list = topicListAll
          .where((element) =>
              element.name!.startsWith(RegExp(r'[G-I]', caseSensitive: false)))
          .toList();
      allTopicData.value = list;
    } else if (myposition.contains("J-N")) {
      final list = topicListAll
          .where((element) =>
              element.name!.startsWith(RegExp(r'[J-N]', caseSensitive: false)))
          .toList();
      allTopicData.value = list;
    } else if (myposition.contains("O-S")) {
      final list = topicListAll
          .where((element) =>
              element.name!.startsWith(RegExp(r'[O-S]', caseSensitive: false)))
          .toList();
      allTopicData.value = list;
    } else if (myposition.contains("T-Z")) {
      final list = topicListAll
          .where((element) =>
              element.name!.startsWith(RegExp(r'[T-Z]', caseSensitive: false)))
          .toList();
      allTopicData.value = list;
    } else if (check == true) {
      final list = topicListAll
          .where((element) => element.name!.contains(myposition))
          .toList();
      allTopicData.value = list;
    } else {
      final list = topicListAll
          .where((element) => element.name!.contains(myposition))
          .toList();
      allTopicData.value = list;
    }
  }

  myPlayListAPI() async {
    isLoading.value = true;
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    String topicString1;
    String languageString1;

    //dynamic body = {'topic': topicString1, 'language': languageString1};
    // print("body :: " + body.toString());
    String url = urlBase + urlMyPlayList;
    final apiReq = Request();
    await apiReq.postAPI(url, null, token.toString()).then((value) {
      http.StreamedResponse res = value;
      myPlayList.clear();
      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          print(value.toString());
          MyPlayListModel myPlayListModel = myPlayListModelFromJson(value);

          if (myPlayListModel.statusCode == 500) {
            isLoading.value = false;
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            videoListAPI();
          } else if (myPlayListModel.statusCode == 200) {
            isLoading.value = false;
            myPlayListModel.data!.forEach((element) {
              String dataVideos =
                  element.embededCode.toString().replaceAll("560", "130");
              String videoData = dataVideos.replaceAll("315", "60");
              myPlayList.add(MyPlayModel(
                  id: element.id,
                  userId: element.userId,
                  title: element.title,
                  topic: element.topic,
                  language: element.language,
                  file: element.file,
                  embededCode: videoData,
                  tags: element.tags,
                  speakers: element.speakers,
                  status: element.status,
                  description: element.description,
                  deletedAt: element.deletedAt,
                  // speakerList: element.speakerList,
                  // isFocus: element.isFocus,
                  // userDetails: element.userDetails,
                  createdAt: element.createdAt,
                  updatedAt: element.updatedAt));
            });
          } else {
            isLoading.value = false;
          }
        });
      } else {
        isLoading.value = false;
        print(res.reasonPhrase);
      }
    });
  }
}
