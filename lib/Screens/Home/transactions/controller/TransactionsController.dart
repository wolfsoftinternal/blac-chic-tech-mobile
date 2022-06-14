import 'dart:convert';

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/transactions/model/PayoutListListModel.dart';
import 'package:blackchecktech/Screens/Home/transactions/model/TranscationListModel.dart';
import 'package:blackchecktech/Screens/Networks/token_update_request.dart';
import 'package:blackchecktech/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../Model/BaseModel.dart';
import '../../../../Utils/CommonWidget.dart';
import '../../../../Utils/preference_utils.dart';
import '../../../../Utils/share_predata.dart';
import '../../../Networks/api_endpoint.dart';
import '../../../Networks/api_response.dart';

class TransactionsController extends GetxController {

  RxList<TransactionList> transactionList = <TransactionList>[].obs;
  RxList<PayoutList> payoutList = <PayoutList>[].obs;
  Rx<UserDetails> userDetails = UserDetails().obs;

  Rx<TextEditingController> searchControllerForTransactions = TextEditingController().obs;
  ScrollController scrollControllerForTransactions = ScrollController();
  RxInt PageNumberOfTransactions = 0.obs;
  RxBool isPaginationLoadingForTransactions = false.obs;


  // ScrollController scrollControllerForPayouts = ScrollController();
  // RxInt PageNumberForPayouts = 0.obs;
  // RxBool isPaginationLoadingForPayouts = false.obs;

  initScrolling(BuildContext context) {
    scrollControllerForTransactions.addListener(() async {
      if (scrollControllerForTransactions.position.maxScrollExtent ==
          scrollControllerForTransactions.position.pixels) {
        _scrollDown();
        isPaginationLoadingForTransactions.value = true;
        await allTransactionListApi(context, '');
        isPaginationLoadingForTransactions.value = false;
      }
    });
  }

  void _scrollDown() {
    scrollControllerForTransactions.jumpTo(scrollControllerForTransactions.position.maxScrollExtent);
  }


  allTransactionListApi(BuildContext context, String search) async {

    dynamic body;

    if(search.isEmpty){
      PageNumberOfTransactions = PageNumberOfTransactions + 1;
      body = {
        'page': PageNumberOfTransactions.toString(),
      };
    }else{
      PageNumberOfTransactions.value = 0;
      body = {
        'search' : search.toString(),
        // 'page': PageNumber.toString(),
      };
    }


    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    String url = urlBase + urlAllTransactions;
    final apiReq = Request();

    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData transactions' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            allTransactionListApi(context, search);
          }else if (model.statusCode == 200) {
            TransactionListModel detail = TransactionListModel.fromJson(userModel);
            transactionList.value = detail.data!;
          } else if(model.statusCode == 101){
            transactionList.clear();
          }else {
            print(res.reasonPhrase);
          }

          allPayoutListApi();

        });
      }
    });
  }

  allPayoutListApi() async {

    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    String url = urlBase + urlAllPayouts;
    final apiReq = Request();

    await apiReq.postAPIWithBearer(url, null, token.toString()).then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData payouts' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            allPayoutListApi();
          }else if (model.statusCode == 200) {
            PayoutListModel detail = PayoutListModel.fromJson(userModel);
            payoutList.value = detail.data!;
          } else if(model.statusCode == 101){
            payoutList.clear();
          }else {
            print(res.reasonPhrase);
          }
        });
      }
    });
  }

  getUserDetails(BuildContext context) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlUserProfile;
    final apiReq = Request();

    await apiReq.postAPI(url, null, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          print('strData of user details '  +  strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            getUserDetails(context);
          } else if (model.statusCode == 200) {
            SignupModel admireListModel = SignupModel.fromJson(userModel);

            userDetails.value = admireListModel.data!;
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

}
