import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'RecentWithdrawModel.dart';

SelectBankAccountModel selectBankAccountModelFromJson(String str) =>
    SelectBankAccountModel.fromJson(json.decode(str));

String selectBankAccountModelToJson(SelectBankAccountModel data) =>
    json.encode(data.toJson());

class SelectBankAccountModel {
  SelectBankAccountModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<BankDetails>? data;

  factory SelectBankAccountModel.fromJson(Map<String, dynamic> json) =>
      SelectBankAccountModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: RxList<BankDetails>.from(
            json["data"].map((x) => BankDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
