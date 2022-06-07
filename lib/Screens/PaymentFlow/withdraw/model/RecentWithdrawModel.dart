import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

RecentWithdrawModel recentWithdrawModelFromJson(String str) =>
    RecentWithdrawModel.fromJson(json.decode(str));

String recentWithdrawModelToJson(RecentWithdrawModel data) =>
    json.encode(data.toJson());

class RecentWithdrawModel {
  RecentWithdrawModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<RecentWidhrawList>? data;

  factory RecentWithdrawModel.fromJson(Map<String, dynamic> json) =>
      RecentWithdrawModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: RxList<RecentWidhrawList>.from(json["data"].map((x) => RecentWidhrawList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RecentWidhrawList {
  int? id;
  int? userId;
  int? bankId;
  int? isCustomer;
  String? totalAmount;
  String? commission;
  String? paidAmount;
  String? paidDate;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  BankDetails? bankDetails;

  RecentWidhrawList({this.id,
      this.userId,
      this.bankId,
      this.isCustomer,
      this.totalAmount,
      this.commission,
      this.paidAmount,
      this.paidDate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.bankDetails});

  RecentWidhrawList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    bankId = json['bank_id'];
    isCustomer = json['is_customer'];
    totalAmount = json['total_amount'];
    commission = json['commission'];
    paidAmount = json['paid_amount'];
    paidDate = json['paid_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    bankDetails = json['bank_details'] != null
        ? new BankDetails.fromJson(json['bank_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['bank_id'] = this.bankId;
    data['is_customer'] = this.isCustomer;
    data['total_amount'] = this.totalAmount;
    data['commission'] = this.commission;
    data['paid_amount'] = this.paidAmount;
    data['paid_date'] = this.paidDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.bankDetails != null) {
      data['bank_details'] = this.bankDetails?.toJson();
    }
    return data;
  }
}

class BankDetails {
  int? id;
  int? userId;
  String? bankName;
  String? accountNumber;
  String? routingNumber;
  String? swiftCode;
  String? bankAddress;
  int? accountType;
  String? image;
  String? saveAs;
  String? setAmount;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  BankDetails({this.id,
      this.userId,
      this.bankName,
      this.accountNumber,
      this.routingNumber,
      this.swiftCode,
      this.bankAddress,
      this.accountType,
      this.image,
      this.saveAs,
      this.setAmount,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails  (
    id : json['id'],
    userId : json['user_id'],
    bankName : json['bank_name'],
    accountNumber : json['account_number'],
    routingNumber : json['routing_number'],
    swiftCode : json['swift_code'],
    bankAddress : json['bank_address'],
    accountType : json['account_type'],
    image : json['image'],
    saveAs : json['save_as'],
    setAmount : json['set_amount'],
    createdAt : json['created_at'],
    updatedAt : json['updated_at'],
    deletedAt : json['deleted_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'bank_name': bankName,
    'account_number': accountNumber,
    'routing_number': routingNumber,
    'swift_code': swiftCode,
    'bank_address': bankAddress,
    'account_type': accountType,
    'image': image,
    'save_as': saveAs,
    'set_amount': setAmount,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'deleted_at': deletedAt,
  };
}