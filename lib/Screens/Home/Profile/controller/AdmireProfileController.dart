import 'dart:convert';
import 'dart:io';

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
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
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

import '../../../../Model/BaseModel.dart';
import '../../../../UIScreen/EventTicketTxnId.dart';
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
  List<VideoPlayerController> videoController = [];
  List<VideoPlayerController> videoControllerList = [];
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

              print('admire list '+ admireList.value.toString());

            } else {
              otherAdmireList.value = detail.data!;

              print('admire list '+ otherAdmireList.value[0].admireDetails!.firstName!);
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


  SelectedUserProfileAPI(BuildContext context, id) async {
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

            SelectedUserProfileAPI(context, id);
          } else if (model.statusCode == 200) {
            UserDetails userDetailsModel =
            UserDetails.fromJson(userModel['data']);

            details.value = userDetailsModel;

            print('details name ' + details.value.firstName!);
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  postListAPI(BuildContext context, body, [isFrom]) async {

    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlPostList;
    final apiReq = Request();

    await apiReq.postAPI(url, body, token.toString()).then((value) {
      if(postPageNumber == 1){
        if(isFrom == null){
          postList.clear();
        }else{
          postDetailList.clear();
        }
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

            if (isFrom == null) {
              postList.addAll(detail.data!);
            } else {
              postDetailList.addAll(detail.data!);
            }
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
        if(isFrom == null){
          videoList.clear();
        }else{
          videoDetailList.clear();
        }
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

            if (isFrom == null) {
              videoList.addAll(detail.data!);
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
              videoDetailList.addAll(detail.data!);
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

  eventDetailAPI(BuildContext context, id, [isFrom]) async {
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

            eventDetailAPI(context, id);
          } else if (model.statusCode == 200) {
            EventDetailModel detail = EventDetailModel.fromJson(userModel);
            eventDetails.value = detail.data!;

            if (isFrom != null) {
              Get.to(const EventDetail(isFrom: 'event'));
            } else {
              Get.to(const EventDetail());
            }
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
            if (userID == null) {
              admireListAPI(context, null);
            } else {
              admireListAPI(context, userID);
            }
            Get.back();
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  rearrangeAdmireAPI(BuildContext context, id, num) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    dynamic body = {
      'admire_id': id.toString(),
      'admire_number': num.toString()
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

            rearrangeAdmireAPI(context, id, num);
          } else if (model.statusCode == 200) {
            admireListAPI(context, null);
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
  chargeCardAndMakePayment(BuildContext context,selectedPositionOfAdmission, OrderListModel orderDetail) async {
    var preferences = MySharedPref();
    SignupModel? modelM =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    var userEmail = modelM!.data!.email;
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = total.value * 100
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
        dynamic bodyForOrderUpdate = {
          'transaction_id': orderDetail.data!.id!.toString(),
          'payment_transaction_id': checkoutResponse!.reference!,
          'status': "1",
        };

        OrderUpdateAPI(context, bodyForOrderUpdate, selectedPositionOfAdmission);
        

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

            OrderCreateAPI(context, body,selectedPositionOfAdmission);
          } else if (model.statusCode == 200) {

            OrderListModel detail = OrderListModel.fromJson(orderModel);

            print('orderDetails  id ' + detail.data!.id!.toString());
            print('orderDetails  total_price ' + detail.data!.total_price.toString());

            chargeCardAndMakePayment(context,selectedPositionOfAdmission, detail);
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
          Map<String, dynamic> orderModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(orderModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            OrderCreateAPI(context, body,selectedPositionOfAdmission);
          } else if (model.statusCode == 200) {
            OrderListModel detail = OrderListModel.fromJson(orderModel);

            Get.to(EventTicketTxnId(eventDetails: eventDetails.value,
              selectedAdmissionPosition: selectedPositionOfAdmission,
              orderDetails: detail,
            ));

          //  chargeCardAndMakePayment(context,selectedPositionOfAdmission, orderListModel);
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }
}
