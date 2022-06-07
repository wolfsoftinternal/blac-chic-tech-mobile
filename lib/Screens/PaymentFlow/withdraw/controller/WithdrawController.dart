import 'dart:convert';

import 'package:blackchecktech/Screens/Home/transactions/view/TransactionsPayoutsTabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../../Model/BaseModel.dart';
import '../../../../Utils/CommonWidget.dart';
import '../../../../Utils/GeneralFunctions.dart';
import '../../../../Utils/preference_utils.dart';
import '../../../../Utils/share_predata.dart';
import '../../../Networks/api_endpoint.dart';
import '../../../Networks/api_response.dart';
import '../../../Networks/token_update_request.dart';
import '../model/SelectBankAccountModel.dart';
import '../view/ChooseBankAccountPage.dart';

class WithdrawController extends GetxController {
  var preferences = MySharedPref();

  //recent withdrawals
  RxString walletAmount = "".obs;
  RxList withdrawalList = [].obs;
  RxList searchList = [].obs;
  RxString recentDate = "".obs;
  RxString recentTime = "".obs;
  RxString account = "".obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;

  //Add Bank Account
  Rx<TextEditingController> setAmount = TextEditingController().obs;
  Rx<TextEditingController> accName = TextEditingController().obs;
  Rx<TextEditingController> bankName = TextEditingController().obs;
  Rx<TextEditingController> accountNo = TextEditingController().obs;
  Rx<TextEditingController> routingNo = TextEditingController().obs;
  Rx<TextEditingController> bankAddress = TextEditingController().obs;
  RxInt selectedSaveAsIndex = 1.obs;

  //Select Bank Account
  RxInt selectedAccountIndex = 0.obs;
  RxList bankAccountList = [].obs;
  RxInt bankId = 0.obs;
  Rx<TextEditingController> addAmount = TextEditingController().obs;

  //Add Bank Account
  addAccountApi(BuildContext context) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlAddAccount;
    final apiReq = Request();

    var saveAs = 'personal_account';

    if (selectedSaveAsIndex.value == 2) {
      saveAs = 'buisness_account';
    } else if (selectedSaveAsIndex.value == 3) {
      saveAs = 'family_account';
    }

    var body = {
      'bank_name': bankName.value.text,
      'account_name': accName.value.text,
      'account_number': accountNo.value.text,
      'routing_number': routingNo.value.text,
      'bank_address': bankAddress.value.text,
      'save_as': saveAs
    };

    await apiReq
        .postAPIWithBearer(url, body, token.toString())
        .then((value) async {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

            print('strData order' + strData);

          Map<String, dynamic> addAccountModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(addAccountModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            addAccountApi(context);
          } else if (model.statusCode == 200) {
            Get.back();
            Get.back();
            Get.to(WithdrawChooseBankAccount(walletAmount: walletAmount.value,));
          } else {
            Navigator.pop(context);
            snackBar(context, model.message ?? "");
          }
        });
      } else {
        snackBar(context, res.reasonPhrase ?? "");
      }
    });
  }

  //Choose Bank Account
  selectAccountApi() async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlBankAccountList;
    final apiReq = Request();

    await apiReq
        .postAPIWithBearer(url, null, token.toString())
        .then((value) async {
      print(value);
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

          print('strData bank list' + strData);

          Map<String, dynamic> selectBankModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(selectBankModel);

          printData("Select Account message", model.message.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            selectAccountApi();
          } else if (model.statusCode == 200) {
            SelectBankAccountModel selectBankAccountModel =
                SelectBankAccountModel.fromJson(selectBankModel);

            bankAccountList.value = selectBankAccountModel.data!;
            bankId.value = selectBankAccountModel.data?[0].id ?? 0;
          } else {
            printData("Select Account", model.statusCode.toString());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  //Withdraw Amount
  sendWithdrawRequestApi() async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urlSendWithdrawRequest;
    final apiReq = Request();

    print('bank id hhahaha' + bankId.value.toString());

    var body = {
      'bank_id': bankId.value.toString(),
      'amount': addAmount.value.text,
    };

    await apiReq
        .postAPIWithBearer(url, body, token.toString())
        .then((value) async {
      print(value);
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;

          print('request send response ' + strData);

          Map<String, dynamic> selectBankModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(selectBankModel);

          printData("Send Withdraw Request", model.message.toString());

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            sendWithdrawRequestApi();
          } else if (model.statusCode == 200) {
            Get.back();
            Get.back();
            Get.to(TransactionsPayoutsTabs());
          } else {
            printData("Send Withdraw Request", model.statusCode.toString());
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });
  }

  searchWithdrawals() async {
    if (searchController.value.text != '') {
      for (var i in searchList) {
        var date = DateTime.parse(
            i.createdAt.substring(0, 10) + ' ' + i.createdAt.substring(11, 23));
        var recentDate = DateFormat("MMM dd yyyy").format(date);

        print(recentDate);

        print(recentDate.toString().contains(searchController.value.text));

        if (i.paidAmount != null &&
                i.paidAmount.contains(searchController.value.text) ||
            i.bankDetails != null &&
                i.bankDetails.accountNumber
                    .contains(searchController.value.text) ||
            recentDate != null &&
                recentDate
                    .toLowerCase()
                    .toString()
                    .contains(searchController.value.text.toLowerCase())) {
          withdrawalList.add(i);
        } else {
          print("No Value Matched");
        }
      }
    } else {
      //  recentWithdrawalApi();
    }
  }
}
