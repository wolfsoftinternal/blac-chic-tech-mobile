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


  Rx<TextEditingController> searchControllerForPayouts = TextEditingController().obs;
  ScrollController scrollControllerForPayouts = ScrollController();
  RxInt PageNumberForPayouts = 0.obs;
  RxBool isPaginationLoadingForPayouts = false.obs;
  RxBool isPaid = false.obs;
  RxBool isTransactionLoading = false.obs;
  RxBool isPayoutsLoading = false.obs;



  initScrolling(BuildContext context) {
    scrollControllerForTransactions.addListener(() async {
      if (scrollControllerForTransactions.position.maxScrollExtent ==
          scrollControllerForTransactions.position.pixels) {
        _scrollDown();
        isPaginationLoadingForTransactions.value = true;
        await allTransactionListApi(context);
        isPaginationLoadingForTransactions.value = false;
      }
    });
  }

  void _scrollDown() {
    scrollControllerForTransactions.jumpTo(scrollControllerForTransactions.position.maxScrollExtent);
  }

  stopScrollingForTransactions(BuildContext context){
    scrollControllerForTransactions.dispose();
  }



  initScrollingForPayouts(BuildContext context) {
    scrollControllerForPayouts.addListener(() async {
      if (scrollControllerForPayouts.position.maxScrollExtent ==
          scrollControllerForPayouts.position.pixels) {
        _scrollDownForPayouts();
        isPaginationLoadingForPayouts.value = true;
        await allPayoutListApi(context);
        isPaginationLoadingForPayouts.value = false;
      }
    });
  }


  stopScrollingForPayouts(BuildContext context){
    scrollControllerForPayouts.dispose();
  }


  void _scrollDownForPayouts() {
    scrollControllerForPayouts.jumpTo(scrollControllerForPayouts.position.maxScrollExtent);
  }

  allTransactionListApi(BuildContext context) async {
    if(isPaginationLoadingForTransactions.value == true)
    {
      isTransactionLoading.value = false;
    }else{
      isTransactionLoading.value = true;
    }
      dynamic body;
      PageNumberOfTransactions = PageNumberOfTransactions + 1;
      body = {
        'search' : searchControllerForTransactions.value.text.toString(),
        'page': PageNumberOfTransactions.toString(),
      };


    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    String url = urlBase + urlAllTransactions;
    final apiReq = Request();

    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) async {

      if(PageNumberOfTransactions == 1){
        transactionList.clear();
      }

      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData transactions' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
                isTransactionLoading.value = false;

            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            allTransactionListApi(context);
          }else if (model.statusCode == 200) {
            TransactionListModel transactionListModel = TransactionListModel.fromJson(userModel);

            transactionList.addAll(transactionListModel.data!);
            isTransactionLoading.value = false;
          } else if(model.statusCode == 101){

isTransactionLoading.value = false;
          }else {
            isTransactionLoading.value = false;
            print(res.reasonPhrase);
          }

         // allPayoutListApi();

        });
      }
    });
  }

  allPayoutListApi(BuildContext context) async {
    if(isPaginationLoadingForPayouts.value == true)
    {
      isPayoutsLoading.value = false;
    }else{
      isPayoutsLoading.value = true;

    }
    dynamic body;
    PageNumberForPayouts = PageNumberForPayouts + 1;
    body = {
      'search' : searchControllerForPayouts.value.text.toString(),
      'page': PageNumberForPayouts.toString(),
    };

    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);
    String url = urlBase + urlAllPayouts;
    final apiReq = Request();

    await apiReq.postAPIWithBearer(url, body, token.toString()).then((value) async {

      if(PageNumberForPayouts == 1){
        payoutList.clear();
      }

      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        await res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData payouts' + strData);

          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            isPayoutsLoading.value = false;

            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            allPayoutListApi(context);
          }else if (model.statusCode == 200) {
            PayoutListModel payoutListModel = PayoutListModel.fromJson(userModel);

            payoutList.addAll(payoutListModel.data!);
            for(var i=0; i<payoutList.length; i++){
              if(payoutList[i].paid_date == null){
                isPaid.value = true;
              }
            }
            isPayoutsLoading.value = false;
          } else if(model.statusCode == 101){
          //  payoutList.clear();
          isPayoutsLoading.value = false;
          }else {
            print(res.reasonPhrase);
            isPayoutsLoading.value = false;
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
