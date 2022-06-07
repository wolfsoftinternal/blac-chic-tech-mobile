import 'dart:convert';
import 'package:blackchecktech/Screens/Home/Profile/model/EventListModel.dart';

PayoutListModel eventListModelFromJson(String str) =>
    PayoutListModel.fromJson(json.decode(str));

String payoutListModelToJson(PayoutListModel data) =>
    json.encode(data.toJson());

class PayoutListModel {
  PayoutListModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<PayoutList>? data;

  factory PayoutListModel.fromJson(Map<String, dynamic> json) =>
      PayoutListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<PayoutList>.from(
            json["data"].map((x) => PayoutList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PayoutList {
  PayoutList({
    this.id,
    this.userId,
    this.bank_id,
    this.amount,
    this.commission,
    this.amount_to_pay,
    this.status,
    this.paid_date,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  int? userId;
  String? bank_id;
  String? amount;
  String? commission;
  int? amount_to_pay;
  int? status;
  String? paid_date;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory PayoutList.fromJson(Map<String, dynamic> json) =>
      PayoutList(
        id: json["id"],
        userId: json["user_id"],
        bank_id: json["bank_id"],
        amount: json["amount"],
        commission: json["commission"],
        amount_to_pay: json["amount_to_pay"],
        paid_date: json["paid_date"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "bank_id": bank_id,
        "amount": amount,
        "commission": commission,
        "amount_to_pay": amount_to_pay,
        "paid_date": paid_date,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,

      };




}

class TransactionEventDetails {
  TransactionEventDetails({
    this.id,
    this.userId,
    this.title,
    this.startDate,
    this.startTime,
    this.startDateTime,
    this.endDate,
    this.endTime,
    this.endDateTime,
    this.venue,
    this.address,
    this.latitude,
    this.longitude,
    this.poster,
    this.countryId,
    this.stateId,
    this.cityId,
    this.details,

  });

  int? id;
  int? userId;
  String? title;
  String? startDate;
  String? startTime;
  DateTime? startDateTime;
  dynamic endDate;
  dynamic endTime;
  dynamic endDateTime;
  String? venue;
  String? address;
  String? latitude;
  String? longitude;
  dynamic poster;
  int? countryId;
  int? stateId;
  int? cityId;
  String? details;


  factory TransactionEventDetails.fromJson(Map<String, dynamic> json) => TransactionEventDetails(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    startDate: json["start_date"],
    startTime: json["start_time"],
    startDateTime: DateTime.parse(json["start_date_time"]),
    endDate: json["end_date"],
    endTime: json["end_time"],
    endDateTime: json["end_date_time"],
    venue: json["venue"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    poster: json["poster"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    details: json["details"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "start_date": startDate,
    "start_time": startTime,
    "start_date_time": startDateTime!.toIso8601String(),
    "end_date": endDate,
    "end_time": endTime,
    "end_date_time": endDateTime,
    "venue": venue,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "poster": poster,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "details": details,

  };
}
