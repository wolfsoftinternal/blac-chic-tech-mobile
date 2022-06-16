import 'dart:convert';
import 'dart:io';

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/UserListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/EventDetailModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/EventListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/PostListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/RegisteredUserModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/VideoListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/EventDetail.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/EventListDetail.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/Profile.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/SeeAllAdmires.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../Model/BaseModel.dart';
import '../../../../UIScreen/EventTicket.dart';
import '../../Event/view/EventTicketForSuccss.dart';
import '../../../../Utils/CommonWidget.dart';
import '../../../../Utils/preference_utils.dart';
import '../../../../Utils/share_predata.dart';
import '../../../Networks/api_endpoint.dart';
import '../../../Networks/api_response.dart';
import '../../Event/model/OrderListModel.dart';

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
  Rx<EventList> eventDetails = EventList().obs;
  late List initializeVideoPlayerFuture = [];
  late List initializeVideoPlayerFutureList = [];
  List video = [];
  Rx<Duration> position = const Duration().obs;
  Rx<Duration> duration = const Duration().obs;
  RxBool isRearrange = false.obs;
  RxList<UserList> selectedList = <UserList>[].obs;
  RxList<UserList> searchList = <UserList>[].obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxInt selectedIndex = 1.obs;
  RxString admire = ''.obs;
  RxInt count = 1.obs;
  RxInt total = 0.obs;
  RxInt finalTotal = 0.obs;
  RxBool isWallet = false.obs;
  CheckoutResponse? checkoutResponse;
  PaystackPlugin paystack = PaystackPlugin();
  static const String PAYSTACK_KEY =
      "pk_test_c343f7fa48c5e5368ab068b511d9d8aa2977a231";
  ScrollController postScrollController = ScrollController();
  RxInt postPageNumber = 1.obs;
  RxBool isPostPaginationLoading = false.obs;
  ScrollController videoScrollController = ScrollController();
  RxInt videoPageNumber = 1.obs;
  RxBool isVideoPaginationLoading = false.obs;
  ScrollController eventScrollController = ScrollController();
  RxInt eventPageNumber = 1.obs;
  RxBool isEventPaginationLoading = false.obs;
  Rx<TextEditingController> registeredUserSearch = TextEditingController().obs;
  Rx<RegisterUserModel> registerList = RegisterUserModel().obs;
  RxBool isLimitReached = false.obs;
  RxList<UserList> userList = <UserList>[].obs;
  RxList<YoutubePlayerController> videoController = <YoutubePlayerController>[].obs;


  initScrolling(BuildContext context, userId, [postId]) {
    postScrollController.addListener(() async {
      if (postScrollController.position.maxScrollExtent ==
          postScrollController.position.pixels) {
        _scrollDown();
        isPostPaginationLoading.value = true;
        postPageNumber = postPageNumber + 1;

        if(postId == null){
          dynamic body = {
            'user_id': userId.toString(),
            'page': postPageNumber.toString()
          };
          await postListAPI(context, body);
        }else{
          dynamic body = {
            'user_id': userId.toString(),
            'post_id': postId.toString(),
            'page': postPageNumber.toString(),
          };
          await postListAPI(context, body, 'detail');
        }
        isPostPaginationLoading.value = false;
      }
    });
  }

  void _scrollDown() {
    postScrollController.jumpTo(postScrollController.position.maxScrollExtent);
  }

  initVideoScrolling(BuildContext context, userId, [videoId]) {
    videoScrollController.addListener(() async {
      if (videoScrollController.position.maxScrollExtent ==
          videoScrollController.position.pixels) {
        _videoScrollDown();
        isVideoPaginationLoading.value = true;
        videoPageNumber = videoPageNumber + 1;

        if(videoId == null){
          dynamic body = {
            'user_id': userId.toString(),
            'page': videoPageNumber.toString()
          };
          await videoListAPI(context, body);
        }else{
          dynamic body = {
            'user_id': userId.toString(),
            'video_id': videoId.toString(),
            'page': videoPageNumber.toString(),
          };
          await videoListAPI(context, body, 'detail');
        }
        isVideoPaginationLoading.value = false;
      }
    });
  }

  void _videoScrollDown() {
    videoScrollController.jumpTo(videoScrollController.position.maxScrollExtent);
  }

  initEventScrolling(BuildContext context, userId, [eventId]) {
    eventScrollController.addListener(() async {
      if (eventScrollController.position.maxScrollExtent ==
          eventScrollController.position.pixels) {
        _eventScrollDown();
        isEventPaginationLoading.value = true;
        eventPageNumber = eventPageNumber + 1;

        if(eventId == null){
          dynamic body = {
            'user_id': userId.toString(),
            'page': eventPageNumber.toString()
          };
          await eventListAPI(context, body);
        }else{
          dynamic body = {
            'user_id': userId.toString(),
            'event_id': eventId.toString(),
            'page': eventPageNumber.toString(),
          };
          await eventListAPI(context, body, 'detail');
        }
       
        isEventPaginationLoading.value = false;
      }
    });
  }

  void _eventScrollDown() {
    eventScrollController.jumpTo(eventScrollController.position.maxScrollExtent);
  }

  admireListAPI(BuildContext context, body) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    SignupModel? myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);

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

              print('admire list ' + admireList.value.toString());
              if (myModel!.data!.id != details.value.id) {
                var admireValue = '';
                for (var item in admireList) {
                  if (details.value.id == item.admireId) {
                    admireValue = 'Admired';
                  }
                }

                if(admireValue == 'Admired'){
                  admire.value = 'Admired';
                }else{
                  admire.value = 'Admire';
                }
              }
              
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

  admireDeleteAPI(BuildContext context, id, [isFrom]) async {
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
            if(isFrom == 'profile'){
              snackBar(context, 'Admire Deleted');
            }else{
              admireListAPI(context, null); 
            }
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

          print('strData userdetails get ' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            userProfileAPI(context);
          } else if (model.statusCode == 200) {
            SignupModel admireListModel = SignupModel.fromJson(userModel);

            details.value = admireListModel.data!;
            Get.to(const Profile());
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
            Get.to(const Profile());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  // SelectedUserProfileAPI(BuildContext context, id) async {
  //   var preferences = MySharedPref();
  //   var token = await preferences.getStringValue(SharePreData.keytoken);

  //   String url = urlBase + urlOtherProfile;
  //   final apiReq = Request();

  //   dynamic body = {
  //     'user_id': id.toString(),
  //   };
  //   await apiReq.postAPI(url, body, token.toString()).then((value) {
  //     http.StreamedResponse res = value;

  //     if (res.statusCode == 200) {
  //       res.stream.bytesToString().then((value) async {
  //         String strData = value;
  //         Map<String, dynamic> userModel = json.decode(strData);
  //         BaseModel model = BaseModel.fromJson(userModel);

  //         if (model.statusCode == 500) {
  //           final tokenUpdate = TokenUpdateRequest();
  //           await tokenUpdate.updateToken();

  //           SelectedUserProfileAPI(context, id);
  //         } else if (model.statusCode == 200) {
  //           UserDetails userDetailsModel =
  //               UserDetails.fromJson(userModel['data']);

  //           details.value = userDetailsModel;

  //           print('details name ' + details.value.firstName!);
  //         }
  //       });
  //     } else {
  //       print(res.reasonPhrase);
  //     }
  //   });
  // }

  postListAPI(BuildContext context, body, [isFrom]) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlPostList;
    final apiReq = Request();

    await apiReq.postAPI(url, body, token.toString()).then((value) {
      if(postPageNumber == 1){
        // if(isFrom == null){
          postList.clear();
        // }else{
        //   postDetailList.clear();
        // }
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

            postListAPI(context, body, [isFrom]);
          } else if (model.statusCode == 200) {
            PostListModel detail = PostListModel.fromJson(userModel);

            // if (isFrom == null) {
              postList.addAll(detail.data!);
            // } else {
            //   postDetailList.addAll(detail.data!);
            // }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  videoListAPI(BuildContext context, body, [isFrom]) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlVideoList;
    final apiReq = Request();

    await apiReq.postAPI(url, body, token.toString()).then((value) {
      if(videoPageNumber == 1){
          videoList.clear();
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

            videoListAPI(context, body);
          } else if (model.statusCode == 200) {
            VideoListModel detail = VideoListModel.fromJson(userModel);
            videoList.addAll(detail.data!);

            List videoId = []; 
            YoutubePlayerController controller;
            for(var item in videoList){
              if(item.embededCode.toString().contains("iframe")){
                String src = item.embededCode.toString().split('=')[3];
                src = src.replaceAll(' title', '');
                src = src.replaceAll('"', '');
                videoId.add(YoutubePlayer.convertUrlToId(src));
              }else{
                String src = item.embededCode.toString();
                src = src.replaceAll('"', '');
                videoId.add(YoutubePlayer.convertUrlToId(src));
              }          
            }

            for(int i = 0; i < videoList.length; i++){
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
                    hideControls: false,
                  ),
                );
                videoController.add(controller);
              }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  eventListAPI(BuildContext context, body, [isFrom]) async {
    if(eventPageNumber == 1){
      // if(isFrom == null){
      eventList.clear();
      // }else{
      //   eventDetailList.clear();
      // }
    }
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
            // if (isFrom == null) {
            eventList.addAll(detail.data!);
            print(eventList.length);
            // } else {
            //   eventDetailList.addAll(detail.data!);
            //   print(eventDetailList.length);
            // }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  eventDetailAPI(BuildContext context, id, [type]) async {
    print('Event detail api call');

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

            eventDetailAPI(context, id, type);
          } else if (model.statusCode == 200) {
            EventDetailModel detail = EventDetailModel.fromJson(userModel);
            eventDetails.value = detail.data!;

            Get.to(EventDetail(type: type));
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

            eventDetailAPI(context, id, null);
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

  replaceAdmireAPI(BuildContext context, id, newId, userID) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'admire_id': id.toString(),
      'new_admire_id': newId.toString()
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

            replaceAdmireAPI(context, id, newId, body);
          } else if (model.statusCode == 200) {
            snackBar(context, 'Admire Replaced');
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  rearrangeAdmireAPI(BuildContext context, id, num2) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'admire_id': id.toString(),
      'number': num2.toString()
    };

    String url = urlBase + urlRearrangeAdmire;
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

            rearrangeAdmireAPI(context, id, num2);
          } else if (model.statusCode == 200) {
            admireListAPI(context, null);
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  replaceUserList(BuildContext context, id) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlSystemUser;
    final apiReq = Request();

    dynamic body = {
      'search': searchController.value.text,
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
            UserListModel detail =
            UserListModel.fromJson(userModel);
            userList.value = detail.data!;
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
            admire.value = 'Admired';
            snackBar(context, model.message!);
          }else if(model.statusCode == 101){
            if(model.message == 'Admire Limit has been reached'){
              isLimitReached.value = true;
              Get.to(SeeAllAdmires(type: 'user', limit: 'completed'));
            }
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return '${DateTime.now().millisecondsSinceEpoch}';

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  //GetUi
  PaymentCard _getCardUI() {
    return PaymentCard(
        number: "4084084084084081",
        cvc: "408",
        expiryMonth: 02,
        expiryYear: 23);
  }

  Future initializePlugin() async {
    print("PAYSTACK_KEY-> " + PAYSTACK_KEY);
    await paystack.initialize(publicKey: PAYSTACK_KEY);
  }

  //Method Charging card
  chargeCardAndMakePayment(BuildContext context, selectedPositionOfAdmission,
      OrderListModel orderDetail, int debitedFromWallet) async {
    var preferences = MySharedPref();
    SignupModel? modelM =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    var userEmail = modelM!.data!.email;
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = finalTotal.value * 100
        ..email = userEmail
        ..reference = _getReference()
        ..card = _getCardUI();

      checkoutResponse = await paystack.checkout(
        context,
        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
      );

      if (checkoutResponse!.status == true) {
        dynamic bodyForOrderUpdate;
        if (isWallet.value) {
          bodyForOrderUpdate = {
            'transaction_id': orderDetail.data!.id!.toString(),
            'payment_transaction_id': checkoutResponse!.reference!,
            'status': "1",
            'is_wallet': "true",
            'wallet_amount': debitedFromWallet.toString(),
            'trans_amount': finalTotal.value.toString(),
          };
        } else {
          bodyForOrderUpdate = {
            'transaction_id': orderDetail.data!.id!.toString(),
            'payment_transaction_id': checkoutResponse!.reference!,
            'status': "1",
            'wallet_amount': debitedFromWallet.toString(),
            'trans_amount': finalTotal.value.toString(),
          };
        }

        OrderUpdateAPI(
            context, bodyForOrderUpdate, selectedPositionOfAdmission);

        print("Transaction successful message " +
            checkoutResponse!.message.toString());
        print("Transaction successful obs " + checkoutResponse.obs.string);
        // callTopupApi(context, 'success', checkoutResponse.reference);
      } else {
        print("Transaction failed");
        // callTopupApi(context, checkoutResponse.message, "0");
      }
    });
  }


  OrderCreateAPI(BuildContext context, body,selectedPositionOfAdmission) async {

    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlCreateOrder;
    final apiReq = Request();

    await apiReq.postAPI(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData order' + strData);

          Map<String, dynamic> orderModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(orderModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            OrderCreateAPI(context, body, selectedPositionOfAdmission);
          } else if (model.statusCode == 200) {
            OrderListModel detail = OrderListModel.fromJson(orderModel);

            print('orderDetails  id ' + detail.data!.id!.toString());
            print('orderDetails  total_price ' +
                detail.data!.total_price.toString());

            var debitedFromWallet = 0;
            if(isWallet.value) {
              if (finalTotal.value > 0) {
                debitedFromWallet = int.parse(details.value.wallet ?? "0");
              } else {
                debitedFromWallet = total.value - finalTotal.value;
              }
            }

            if(finalTotal.value > 0){
              chargeCardAndMakePayment(
                  context, selectedPositionOfAdmission, detail, debitedFromWallet);
            }else{

              // Here if user check the wallet
              // If ticket value is less than wallet balance, that time final value will be 0.
              // So direct order api will be call


              dynamic bodyForOrderUpdate;

              if(isWallet.value){
                bodyForOrderUpdate = {
                  'transaction_id': detail.data!.id!.toString(),
                  'payment_transaction_id': "wallet",
                  'status': "1",
                  'is_wallet': "true",
                  'wallet_amount': debitedFromWallet.toString(),
                  'trans_amount': finalTotal.value.toString(),
                };

              }else{
                bodyForOrderUpdate = {
                  'transaction_id': detail.data!.id!.toString(),
                  'payment_transaction_id': "wallet",
                  'status': "1",
                  'wallet_amount': debitedFromWallet.toString(),
                  'trans_amount': finalTotal.value.toString(),
                };
              }

              OrderUpdateAPI(
                  context, bodyForOrderUpdate, selectedPositionOfAdmission);
            }


          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }


  OrderUpdateAPI(BuildContext context, body,selectedPositionOfAdmission) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlOrderUpdate;
    final apiReq = Request();

    await apiReq.postAPI(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

          print('get success order details ' + strData);

          Map<String, dynamic> orderModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(orderModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            OrderUpdateAPI(context, body, selectedPositionOfAdmission);
          } else if (model.statusCode == 200) {
            OrderListModel detail = OrderListModel.fromJson(orderModel);

            var debitedFromWallet = 0;

            if(isWallet.value){
              if(finalTotal.value > 0){
                debitedFromWallet = int.parse(details.value.wallet??"0");
              }else{
                debitedFromWallet = total.value - finalTotal.value;
              }
            }

            Navigator.pop(context);



            // Get.off(() => EventTicket(
            // ));

            Get.off(() => EventTicketForSuccess(
              eventDetails: eventDetails.value,
              selectedAdmissionPosition: selectedPositionOfAdmission,
              orderDetails: detail,
              debitedFromWallet: debitedFromWallet,
              debitedFromPayStack: finalTotal.value,
            ));

            //  chargeCardAndMakePayment(context,selectedPositionOfAdmission, orderListModel);
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  registeredUserApi(BuildContext context, id) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlRegisteredUser;
    final apiReq = Request();
    dynamic body = {
        'event_id': id.toString(),
        'search': registeredUserSearch.value.text,
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

            registeredUserApi(context, id);
          } else if (model.statusCode == 200) {
            RegisterUserModel detail = RegisterUserModel.fromJson(userModel);
            registerList.value = detail;
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  postLikeApi(BuildContext context, id) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlPostLike;
    final apiReq = Request();
    dynamic body = {
      'post_id': id.toString(),
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

            postLikeApi(context, id);
          } else if (model.statusCode == 200) {
            print(model.message);
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  postDisLikeApi(BuildContext context, id) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlPostDisLike;
    final apiReq = Request();
    dynamic body = {
      'post_id': id.toString(),
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

            postDisLikeApi(context, id);
          } else if (model.statusCode == 200) {
            print(model.message);
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }
}
