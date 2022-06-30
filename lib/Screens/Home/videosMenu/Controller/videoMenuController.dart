import 'dart:convert';

import 'package:blackchecktech/Model/BaseModel.dart';
import 'package:blackchecktech/Model/FindSpeakerModel.dart';
import 'package:blackchecktech/Model/SpeakersVideoModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/CommentListModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/DefaultModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/FindSpeakerModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/MyPlayListModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/SpeakerVideoModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/TopicModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/VideoDetailModel.dart';
import 'package:blackchecktech/Screens/Networks/api_endpoint.dart';
import 'package:blackchecktech/Screens/Networks/api_response.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoMenuController extends GetxController {
  RxBool isLoadingBCT = false.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingButton = false.obs;
  RxList<VideoList> videoList = <VideoList>[].obs;
  RxList<VideoList> videoAllList = <VideoList>[].obs;
  Rx<SpeakerVideoModel> speakerVideoModel = SpeakerVideoModel().obs;
  RxInt searchVideoPage = 1.obs;

  Rx<SpeakerVideoModel> detailsVideoModel = SpeakerVideoModel().obs;
  RxList<VideoList> videoDetailsList = <VideoList>[].obs;
  RxInt detailsVideoPage = 1.obs;

  var topicList = <TopicListModel>[].obs;
  var topicListAll = <TopicListModel>[].obs;
  Rx<TopicListModel> selectedTopic = TopicListModel(id: -1).obs;
  RxList<TopicListModel> selectMutiTopicList = <TopicListModel>[].obs;
  RxList<String> selectIdTopic = <String>[].obs;
  RxBool isHeart = false.obs;
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
  RxList<VideoList> myPlayList = <VideoList>[].obs;
  Rx<SpeakerVideoModel> myPlayListModel = SpeakerVideoModel().obs;
  Rx<int> myPlayListPage = 1.obs;

  RxList<CommentModel> commentModelList = <CommentModel>[].obs;
  Rx<TextEditingController> commentTxt = TextEditingController().obs;

  RxList<FindSpeaker> findSpeakerList = <FindSpeaker>[].obs;
  RxBool hasMore = false.obs;
  RxBool hasDataMore = false.obs;
  Rx<SpeakerVideoModel> speakerVideoList = SpeakerVideoModel().obs;
  RxList<VideoList> speakerList = <VideoList>[].obs;
  RxInt speakerListPage = 1.obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  Rx<int> findSpeakerPage = 1.obs;
  Rx<FindSpeakerModel> findspeakerVideoList = FindSpeakerModel().obs;
  Rx<SpeakerVideoModel> videoMenuModelList = SpeakerVideoModel().obs;
  Rx<int> videoMenuPage = 1.obs;
  RxList<YoutubePlayerController> videoController =
      <YoutubePlayerController>[].obs;
  RxList<YoutubePlayerController> playlistController =
      <YoutubePlayerController>[].obs;
  RxList<YoutubePlayerController> playerController =
      <YoutubePlayerController>[].obs;
  RxList<YoutubePlayerController> videoDetailsNextController =
      <YoutubePlayerController>[].obs;
  RxList<YoutubePlayerController> searchVideoList =
      <YoutubePlayerController>[].obs;
  RxString totalVideoCount = "0".obs;
  RxBool checkCount = false.obs;
  ScrollController scrollListController = ScrollController();
  ScrollController scrollListDetailController = ScrollController();
  ScrollController scrollPlaylistController = ScrollController();
  ScrollController scrollSearchListController = ScrollController();
  RxBool isPaginationLoading = false.obs;
  RxInt pageNo = 1.obs;
  RxInt detailPageNo = 0.obs;
  RxInt playlistPageNo = 0.obs;
  RxInt searchListPageNo = 0.obs;

  @override
  void onInit() {
    topicListAPI();
    languageListAPI();
    filtterListMethod("");
    videoListSearchAPI(topicFilter: "");

    super.onInit();
  }

  videoListApi({String? topicFilter, String? languageFilter}) async{
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlHomeVideoList;
    final apiReq = Request();

    String topicString1;
    String languageString1;

    if (topicFilter != null && topicFilter.toString() != '[]') {
      String topicString = topicFilter.toString().replaceAll('[', '');
      topicString1 = topicString.replaceAll(']', '');
      if (topicString1.substring(topicString1.length - 1) == ",") {
        topicString1.substring(0, topicString1.length - 1);
      }
    } else {
      topicString1 = "";
    }
    if (languageFilter != null && languageFilter.toString() != '[]') {
      String languageString = languageFilter.toString().replaceAll('[', '');
      languageString1 = languageString.replaceAll(']', '');
      if (languageString1.substring(languageString1.length - 1) == ",") {
        languageString1.substring(0, languageString1.length - 1);
      }
    } else {
      languageString1 = "";
    }
    if (languageString1.length > 1) {
      if (languageString1.substring(languageString1.length - 1) == ",") {
        languageString1.substring(0, languageString1.length - 1);
      }
    }
    if (topicString1.length > 1) {
      if (topicString1.substring(topicString1.length - 1) == ",") {
        topicString1.substring(0, topicString1.length - 1);
      }
    }

    dynamic body = {
      'topic': topicString1,
      'language': languageString1,
      'page': pageNo.value.toString()
    };

    await apiReq.postAPI(url, body, token.toString()).then((value) {
      if(pageNo.value == 1){
        videoList.clear();
      }
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData userdetails get ' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            videoListApi();
          } else if (model.statusCode == 200) {
            SpeakerVideoModel admireListModel = SpeakerVideoModel.fromJson(userModel);
            videoList.addAll(admireListModel.data!);

            print(videoList.length);

            if (checkCount.value == false) {
              totalVideoCount.value =
                  videoList.length.toString();
              checkCount.value = true;
            }

            videoMenuPageMethod();
          }
          isLoadingBCT.value = false;
        });
      } else {
        isLoadingBCT.value = false;
      }
    });
  }

  // videoListAPI({String? topicFilter, String? languageFilter}) async {
  //   print("CALL LIST API :: " + pageNo.value.toString());

  //   var preferences = MySharedPref();
  //   var token = await preferences.getStringValue(SharePreData.keytoken);
  //   String topicString1;
  //   String languageString1;

  //   if (topicFilter != null && topicFilter.toString() != '[]') {
  //     String topicString = topicFilter.toString().replaceAll('[', '');
  //     topicString1 = topicString.replaceAll(']', '');
  //     if (topicString1.substring(topicString1.length - 1) == ",") {
  //       topicString1.substring(0, topicString1.length - 1);
  //     }
  //   } else {
  //     topicString1 = "";
  //   }
  //   if (languageFilter != null && languageFilter.toString() != '[]') {
  //     String languageString = languageFilter.toString().replaceAll('[', '');
  //     languageString1 = languageString.replaceAll(']', '');
  //     if (languageString1.substring(languageString1.length - 1) == ",") {
  //       languageString1.substring(0, languageString1.length - 1);
  //     }
  //   } else {
  //     languageString1 = "";
  //   }
  //   if (languageString1.length > 1) {
  //     if (languageString1.substring(languageString1.length - 1) == ",") {
  //       languageString1.substring(0, languageString1.length - 1);
  //     }
  //   }
  //   if (topicString1.length > 1) {
  //     if (topicString1.substring(topicString1.length - 1) == ",") {
  //       topicString1.substring(0, topicString1.length - 1);
  //     }
  //   }

  //   dynamic body = {
  //     'topic': topicString1,
  //     'language': languageString1,
  //     'page': pageNo.value.toString()
  //   };
  //   print("body :: " + body.toString());
  //   String url = urlBase + urlHomeVideoList;
  //   final apiReq = Request();
  //   print("Page no :: " + pageNo.value.toString());
  //   await apiReq.postAPI(url, body, token.toString()).then((value) {
  //     if(pageNo.value == 1){
  //       videoList.clear();
  //     }
  //     http.StreamedResponse res = value;
  //     videoMenuModelList.value = SpeakerVideoModel();
  //     if (res.statusCode == 200) {
  //       res.stream.bytesToString().then((value) async {
  //         videoMenuModelList.value = speakerVideoModelFromJson(value);

  //         if (videoMenuModelList.value.statusCode == 500) {
  //           isLoadingBCT.value = false;
  //           final tokenUpdate = TokenUpdateRequest();
  //           await tokenUpdate.updateToken();

  //           videoListAPI();
  //         } else if (videoMenuModelList.value.statusCode == 200) {
  //           print("PASSWORD :: " +
  //               videoMenuModelList.value.data!.length.toString());
  //           if (checkCount.value == false) {
  //             totalVideoCount.value =
  //                 videoMenuModelList.value.data!.length.toString();
  //             checkCount.value = true;
  //           }
  //           videoMenuPageMethod();
  //         } else {
  //           isLoading.value = false;
  //         }
  //       });
  //     } else {
  //       isLoadingBCT.value = false;
  //       print(res.reasonPhrase);
  //     }
  //   });
  // }

  videoMenuPageMethod() {
    // if (videoMenuModelList.value.data!.length < 7) {
    //   hasDataMore.value = false;
    // } else {
    //   hasDataMore.value = true;
    //   pageNo.value++;
    // }
    // videoMenuModelList.value.data!.forEach((element) {
    //   String dataVideos =
    //       element.embededCode.toString().replaceAll("560", "130");
    //   String videoData = dataVideos.replaceAll("315", "60");
    //   videoList.add(VideoList(
    //       id: element.id,
    //       userId: element.userId,
    //       title: element.title,
    //       topic: element.topic,
    //       language: element.language,
    //       file: element.file,
    //       embededCode: videoData,
    //       tags: element.tags,
    //       speakers: element.speakers,
    //       status: element.status,
    //       description: element.description,
    //       deletedAt: element.deletedAt,
    //       speakerList: element.speakerList,
    //       isFocus: element.isFocus,
    //       userDetails: element.userDetails,
    //       createdAt: element.createdAt,
    //       updatedAt: element.updatedAt));
    // });

    List videoId = [];
    videoController.clear();

    for (var item in videoList) {
      if (item.embededCode.toString().contains("iframe")) {
        String src = item.embededCode.toString().split('=')[3];
        src = src.replaceAll(' title', '');
        src = src.replaceAll('"', '');
        videoId.add(YoutubePlayer.convertUrlToId(src));
      } else {
        String src = item.embededCode.toString();
        src = src.replaceAll('"', '');
        videoId.add(YoutubePlayer.convertUrlToId(src));
      }
    }
    for (int i = 0; i < videoId.length; i++) {
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: videoId[i] == null ? "" : videoId[i],
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: false,
          hideControls: true,
        ),
      );
      videoController.add(controller);
    }

    isLoadingBCT.value = false;
  }

  videoListSearchAPI({String? topicFilter}) async {
    isLoading.value = true;
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {'search': topicFilter.toString(), 'page': searchListPageNo.value.toString()};
    //FormData formData = new FormData.fromMap(body);

    String url = urlBase + urlHomeVideoList;
    final apiReq = Request();
    await apiReq.postAPI(url, body, token.toString()).then((value) {
      isLoading.value = false;
      if(searchListPageNo.value == 1){
        videoAllList.clear();
      }
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData userdetails get ' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            videoListSearchAPI();
          } else if (model.statusCode == 200) {
            SpeakerVideoModel admireListModel = SpeakerVideoModel.fromJson(userModel);
            videoAllList.addAll(admireListModel.data!);

            searchVideoMethod();
          }
          isLoadingBCT.value = false;
        });
      } else {
        isLoadingBCT.value = false;
      }
    });
  }

  searchVideoMethod() {
    // int total = 6;
    // var list = <VideoList>[];
    // speakerVideoList.value.data!.forEach((element) {
    //   String dataVideos =
    //       element.embededCode.toString().replaceAll("560", "130");
    //   String videoData = dataVideos.replaceAll("315", "60");
    //   list.add(VideoList(
    //       id: element.id,
    //       userId: element.userId,
    //       title: element.title,
    //       topic: element.topic,
    //       language: element.language,
    //       file: element.file,
    //       embededCode: videoData,
    //       tags: element.tags,
    //       speakers: element.speakers,
    //       status: element.status,
    //       description: element.description,
    //       deletedAt: element.deletedAt,
    //       speakerList: element.speakerList,
    //       isFocus: element.isFocus,
    //       userDetails: element.userDetails,
    //       createdAt: element.createdAt,
    //       updatedAt: element.updatedAt));
    // });
    // if (list.length > searchVideoPage.value * total) {
    //   hasMore.value = true;
    // } else {
    //   hasMore.value = false;
    // }
    // videoAllList.value = List.generate(
    //     list.length > searchVideoPage.value * total
    //         ? searchVideoPage.value * total
    //         : list.length,
    //     (index) => list[index]);

    List videoId = [];

    for (var item in videoAllList) {
      if (item.embededCode.toString().contains("iframe")) {
        String src = item.embededCode.toString().split('=')[3];
        src = src.replaceAll(' title', '');
        src = src.replaceAll('"', '');
        videoId.add(YoutubePlayer.convertUrlToId(src));
      } else {
        String src = item.embededCode.toString();
        src = src.replaceAll('"', '');
        videoId.add(YoutubePlayer.convertUrlToId(src));
      }
    }
    for (int i = 0; i < videoAllList.length; i++) {
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: videoId[i] == null ? "" : videoId[i],
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: false,
          hideControls: true,
        ),
      );
      searchVideoList.add(controller);
    }

    
  }

  videoListDetailApi({VideoList? videoListData}) async {
    isLoading.value = true;
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlHomeVideoList;
    final apiReq = Request();
    detailPageNo = detailPageNo + 1;
    print("page no" + detailPageNo.toString());
    dynamic body = {
      'page': detailPageNo.value.toString()
    };

    await apiReq.postAPI(url, body, token.toString()).then((value) {
      if (detailPageNo == 1) {
        videoDetailsList.clear();
      }
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData userdetails get ' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            videoListDetailApi();
          } else if (model.statusCode == 200) {
            SpeakerVideoModel admireListModel = SpeakerVideoModel.fromJson(userModel);
            videoDetailsList.addAll(admireListModel.data!);

            videoDetailsListMethod(videoListData: videoListData);
          }
          isLoadingBCT.value = false;
        });
      } else {
        isLoadingBCT.value = false;
      }
    });
  }

  // videoListDetailsAPI({VideoList? videoListData}) async {
  //   isLoading.value = true;
  //   var preferences = MySharedPref();
  //   var token = await preferences.getStringValue(SharePreData.keytoken);

  //   String url = urlBase + urlHomeVideoList;
  //   final apiReq = Request();

  //   dynamic body = {
  //     'page': pageNo.value.toString()
  //   };

  //   await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) {
  //     http.StreamedResponse res = value;
  //     if (pageNo == 1) {
  //       videoDetailsList.clear();
  //     }

  //     detailsVideoModel.value = SpeakerVideoModel();
  //     print("Stutus :: " + res.statusCode.toString());
  //     if (res.statusCode == 200) {
  //       res.stream.bytesToString().then((value) async {
  //         print(value.toString());
  //         detailsVideoModel.value = speakerVideoModelFromJson(value);

  //         if (detailsVideoModel.value.statusCode == 500) {
  //           isLoading.value = false;
  //           final tokenUpdate = TokenUpdateRequest();
  //           await tokenUpdate.updateToken();
  //         } else if (detailsVideoModel.value.statusCode == 200) {
  //           print(detailsVideoModel.value.data!);
  //           print(detailsVideoModel.value.data!.length);
  //           videoDetailsList.addAll(detailsVideoModel.value.data!);
  //           print(videoDetailsList.length);
  //           videoDetailsListMethod(videoListData: videoListData);
  //         }
  //       });
  //     } else {
  //       isLoading.value = false;
  //       print(res.reasonPhrase);
  //     }
  //   });
  // }

  videoDetailsListMethod({VideoList? videoListData}) {
    // int total = 6;
    // var list = <VideoList>[];
    // videoDetailsNextController.clear();
    // videoDetailsList.clear();

    // detailsVideoModel.value.data!.forEach((element) {
    //   if (element.id != videoListData!.id) {
    //     String dataVideos =
    //         element.embededCode.toString().replaceAll("560", "130");
    //     String videoDataOne = dataVideos.replaceAll("315", "60");
    //     list.add(VideoList(
    //         id: element.id,
    //         userId: element.userId,
    //         title: element.title,
    //         topic: element.topic,
    //         language: element.language,
    //         file: element.file,
    //         embededCode: videoDataOne,
    //         tags: element.tags,
    //         speakers: element.speakers,
    //         status: element.status,
    //         description: element.description,
    //         deletedAt: element.deletedAt,
    //         speakerList: element.speakerList,
    //         isFocus: element.isFocus,
    //         userDetails: element.userDetails,
    //         createdAt: element.createdAt,
    //         updatedAt: element.updatedAt));
    //   }
    // });
    // if (list.length > detailsVideoPage.value * total) {
    //   hasMore.value = true;
    // } else {
    //   hasMore.value = false;
    // }
    // videoDetailsList.value = List.generate(
    //     list.length > detailsVideoPage.value * total
    //         ? detailsVideoPage.value * total
    //         : list.length,
    //     (index) => list[index]);
    List videoId = [];
    videoDetailsNextController.clear();

    for (var item in videoDetailsList) {
      if (item.embededCode.toString().contains("iframe")) {
        String src = item.embededCode.toString().split('=')[3];
        src = src.replaceAll(' title', '');
        src = src.replaceAll('"', '');
        videoId.add(YoutubePlayer.convertUrlToId(src));
      } else {
        String src = item.embededCode.toString();
        src = src.replaceAll('"', '');
        videoId.add(YoutubePlayer.convertUrlToId(src));
      }
    }
    for (int i = 0; i < videoDetailsList.length; i++) {
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: videoId[i] == null ? "" : videoId[i],
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: false,
          hideControls: true,
        ),
      );
      videoDetailsNextController.add(controller);
    }
    isLoading.value = false;
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

            // videoListSearchAPI();
          } else if (videoDetailModel.statusCode == 200) {
            videoDetail.value = videoDetailModel.data!;
            isHeart.value = videoDetail.value.isLike == 0 ? false : true;
            String text = videoDetail.value.tags.toString();
            result.value = text.split(',');

            var videoId;
            if (videoDetail.value.embededCode.toString().contains("iframe")) {
              String src =
                  videoDetail.value.embededCode.toString().split('=')[3];
              src = src.replaceAll(' title', '');
              src = src.replaceAll('"', '');
              videoId = YoutubePlayer.convertUrlToId(src);
            } else {
              String src = videoDetail.value.embededCode.toString();
              src = src.replaceAll('"', '');
              videoId = YoutubePlayer.convertUrlToId(src);
            }

            playerController.add(YoutubePlayerController(
              initialVideoId: videoId,
              flags: const YoutubePlayerFlags(
                mute: false,
                autoPlay: false,
                disableDragSeek: false,
                loop: false,
                isLive: false,
                forceHD: false,
                enableCaption: false,
                hideControls: false,
              ),
            ));
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

  myPlayListAPI({String? search}) async {
    isLoading.value = true;
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    
    String url = urlBase + urlMyPlayList;
    final apiReq = Request();
    playlistPageNo = playlistPageNo + 1;
    print("dsd $playlistPageNo");
    dynamic body = {'search': search.toString(), 'page': playlistPageNo.value.toString()};

    await apiReq.postAPI(url, body, token.toString()).then((value) {
      if(playlistPageNo.value == 1){
        myPlayList.clear();
      }

      http.StreamedResponse res = value;
      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData userdetails get ' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            isLoading.value = false;
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            myPlayListAPI();
          } else if (model.statusCode == 200) {
            SpeakerVideoModel admireListModel = SpeakerVideoModel.fromJson(userModel);
            myPlayList.addAll(admireListModel.data!);

            pageMyPlayListAdd();
          }else{
            isLoading.value = false;
          }
          isLoadingBCT.value = false;
        });
      } else {
        isLoadingBCT.value = false;
      }
    });
  }

  pageMyPlayListAdd() {
    // int total = 6;
    // var list = <VideoList>[];

    // myPlayListModel.value.data!.forEach((element) {
    //   String dataVideos =
    //       element.embededCode.toString().replaceAll("560", "130");
    //   String videoData = dataVideos.replaceAll("315", "60");
    //   list.add(VideoList(
    //       id: element.id,
    //       userId: element.userId,
    //       title: element.title,
    //       topic: element.topic,
    //       language: element.language,
    //       file: element.file,
    //       embededCode: videoData,
    //       tags: element.tags,
    //       speakers: element.speakers,
    //       status: element.status,
    //       description: element.description,
    //       deletedAt: element.deletedAt,
    //       userDetails: element.userDetails,
    //       // speakerList: element.speakerList,
    //       // isFocus: element.isFocus,
    //       // userDetails: element.userDetails,
    //       createdAt: element.createdAt,
    //       updatedAt: element.updatedAt));
    // });
    // if (list.length > myPlayListPage.value * total) {
    //   hasMore.value = true;
    // } else {
    //   hasMore.value = false;
    // }
    // myPlayList.value = List.generate(
    //     list.length > myPlayListPage.value * total
    //         ? myPlayListPage.value * total
    //         : list.length,
    //     (index) => list[index]);
    // print("myPlayList.value :: " + myPlayList.length.toString());

    List videoId = [];
    YoutubePlayerController controller;
    for (var item in myPlayList) {
      if (item.embededCode.toString().contains("iframe")) {
        String src = item.embededCode.toString().split('=')[3];
        src = src.replaceAll(' title', '');
        src = src.replaceAll('"', '');
        videoId.add(YoutubePlayer.convertUrlToId(src));
      } else {
        String src = item.embededCode.toString();
        src = src.replaceAll('"', '');
        videoId.add(YoutubePlayer.convertUrlToId(src));
      }
    }
    for (int i = 0; i < myPlayList.length; i++) {
      controller = YoutubePlayerController(
        initialVideoId: videoId[i],
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: false,
          hideControls: true,
        ),
      );
      playlistController.add(controller);
    }
    isLoading.value = false;
  }

  videoComments(int videoid) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlComments;
    dynamic body = {'video_id': videoid.toString()};
    isLoading.value = true;
    final apiReq = Request();
    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;
      commentModelList.clear();

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          CommentListModel commentsListModel = commentListModelFromJson(value);
          isLoading.value = false;

          if (commentsListModel.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();
          } else if (commentsListModel.statusCode == 200) {
            commentModelList.value = commentsListModel.data!;

            Future.delayed(const Duration(seconds: 1), () {
              moveDown();
            });
          }
        });
      } else {
        isLoading.value = false;
        print(res.reasonPhrase);
      }
    });
  }

  moveDown() {
    print(":::::::::::::::::::Move JUMP::::::::::::::::::::::::::" +
        scrollController.value.position.minScrollExtent.toString());
    scrollController.value.animateTo(
        scrollController.value.position.minScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200));
  }

  dateTOTimeConvert(String date) {
    final birthday = DateTime.parse(date.toString());
    final date2 = DateTime.now();
    final difference = date2.difference(birthday).inDays;
    print("Difference :: " + difference.toString());
    if (difference == 0) {
      return DateFormat('kk:mm:a').format(birthday);
    } else if (difference == 1) {
      return "Yesterday";
    } else if (difference == 2) {
      return "2 Day";
    } else {
      return DateFormat.yMMMd().format(birthday);
    }
  }

  addCommentApi({String? comment, int? videoId, BuildContext? context}) async {
    isLoadingButton.value = true;

    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'comment': comment.toString(),
      'video_id': videoId.toString()
    };

    String url = urlBase + urlAddComments;
    final apiReq = Request();
    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      isLoadingButton.value = false;

      print("Stutus :: " + res.statusCode.toString());
      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          print(value.toString());
          DefaultModel defaultModel = defaultModelFromJson(value);

          if (defaultModel.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();
          } else if (defaultModel.statusCode == 200) {
            commentTxt.value.clear();
            snackBar(context!, defaultModel.message.toString());
            videoComments(videoId!);
          }
        });
      } else {
        isLoadingButton.value = false;
        print(res.reasonPhrase);
      }
    });
  }

  addToPlatList({int? videoId, BuildContext? context}) async {
    isLoadingButton.value = true;

    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {'video_id': videoId.toString()};

    String url = urlBase + urlAddToPlayList;
    final apiReq = Request();
    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      isLoadingButton.value = false;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          print(value.toString());
          DefaultModel defaultModel = defaultModelFromJson(value);

          print("Stutus :: " + defaultModel.message.toString());
          snackBar(context!, defaultModel.message.toString());
        });
      } else {
        isLoadingButton.value = false;
        print(res.reasonPhrase);
      }
    });
  }

  removeFromPlaylist({int? videoId, BuildContext? context, int? index}) async {
    isLoadingButton.value = true;

    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {'video_id': videoId.toString()};

    String url = urlBase + urlRemoveVideo;
    final apiReq = Request();
    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;
      isLoadingButton.value = false;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          print(value.toString());
          DefaultModel defaultModel = defaultModelFromJson(value);
          myPlayList.removeAt(index!);
          snackBar(context!, defaultModel.message.toString());
        });
      } else {
        isLoadingButton.value = false;
        print(res.reasonPhrase);
      }
    });
  }

  videoLike({BuildContext? context, int? videoId, isFrom}) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {'video_id': videoId.toString()};

    String url = urlBase + urlVideoLike;
    final apiReq = Request();
    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          if (isFrom != "videoDetail") {
            print(value.toString());
            DefaultModel defaultModel = defaultModelFromJson(value);
            isHeart.value = true;
            videoDetail.value.likeCount = videoDetail.value.likeCount! + 1;
            snackBar(context!, defaultModel.message.toString());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  videoUnLike({BuildContext? context, int? videoId, isFrom}) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {'video_id': videoId.toString()};

    String url = urlBase + urlVideoDislike;
    final apiReq = Request();
    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          if (isFrom != "videoDetail") {
            print(value.toString());
            videoDetail.value.likeCount = videoDetail.value.likeCount! - 1;
            DefaultModel defaultModel = defaultModelFromJson(value);
            isHeart.value = false;
            print("Stutus :: " + defaultModel.message.toString());
            snackBar(context!, defaultModel.message.toString());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  findSpeakerApi({String? search}) async {
    isLoading.value = true;
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {'search': search.toString()};
    //FormData formData = new FormData.fromMap(body);

    String url = urlBase + urlFindSpeaker;
    final apiReq = Request();
    try {
      await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) {
        http.StreamedResponse res = value;
        findSpeakerList.clear();

        if (res.statusCode == 200) {
          res.stream.bytesToString().then((value) async {
            print(value.toString());
            findspeakerVideoList.value = findSpeakerModelFromJson(value);

            if (findspeakerVideoList.value.statusCode == 500) {
              isLoading.value = false;
              final tokenUpdate = TokenUpdateRequest();
              await tokenUpdate.updateToken();
            } else if (findspeakerVideoList.value.statusCode == 200) {
              pageAdd();
            }
          });
        } else {
          isLoading.value = false;
          print(res.reasonPhrase);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  pageAdd() {
    int total = 12;
    if (findspeakerVideoList.value.data!.length >
        findSpeakerPage.value * total) {
      hasMore.value = true;
    } else {
      hasMore.value = false;
    }
    findSpeakerList.value = List.generate(
        findspeakerVideoList.value.data!.length > findSpeakerPage.value * total
            ? findSpeakerPage.value * total
            : findspeakerVideoList.value.data!.length,
        (index) => findspeakerVideoList.value.data![index]);
    isLoading.value = false;
  }

  speakerDataVideoAPI({String? search, int? videoId}) async {
    isLoading.value = true;
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'search': search.toString(),
      'speaker_id': videoId.toString()
    };
    //FormData formData = new FormData.fromMap(body);

    String url = urlBase + urlspeakerVideoList;
    final apiReq = Request();
    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;
      speakerList.clear();

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          speakerVideoList.value = speakerVideoModelFromJson(value);

          if (speakerVideoList.value.statusCode == 500) {
            isLoading.value = false;
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();
          } else if (speakerVideoList.value.statusCode == 200) {
            speakerDataVideoPageAdd();
          }
        });
      } else {
        isLoading.value = false;
        print(res.reasonPhrase);
      }
    });
  }

  speakerDataVideoPageAdd() {
    int total = 6;
    var list = <VideoList>[];
    speakerVideoList.value.data!.forEach((element) {
      String dataVideos =
          element.embededCode.toString().replaceAll("560", "130");
      String videoData = dataVideos.replaceAll("315", "60");
      list.add(VideoList(
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
    if (list.length > speakerListPage.value * total) {
      hasMore.value = true;
    } else {
      hasMore.value = false;
    }
    speakerList.value = List.generate(
        list.length > speakerListPage.value * total
            ? speakerListPage.value * total
            : list.length,
        (index) => list[index]);
    isLoading.value = false;
  }
}
