import 'dart:convert';
import 'package:blackchecktech/Screens/Home/Profile/model/EventListModel.dart';

TransactionListModel eventListModelFromJson(String str) =>
    TransactionListModel.fromJson(json.decode(str));

String transactionListModelToJson(TransactionListModel data) =>
    json.encode(data.toJson());

class TransactionListModel {
  TransactionListModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<TransactionList>? data;

  factory TransactionListModel.fromJson(Map<String, dynamic> json) =>
      TransactionListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<TransactionList>.from(
            json["data"].map((x) => TransactionList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TransactionList {
  TransactionList({
    this.id,
    this.userId,
    this.event_id,
    this.admission_type,
    this.per_ticket_price,
    this.total_tickets,
    this.total_price,
    this.transaction_id,
    this.barcode,
    this.status,
    this.payment_type,
    this.event_details,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  int? userId;
  String? event_id;
  String? admission_type;
  String? per_ticket_price;
  int? total_tickets;
  String? total_price;
  String? transaction_id;
  String? barcode;
  int? status;
  String? payment_type;
  TransactionEventDetails? event_details;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory TransactionList.fromJson(Map<String, dynamic> json) =>
      TransactionList(
        id: json["id"],
        userId: json["user_id"],
        admission_type: json["admission_type"],
        per_ticket_price: json["per_ticket_price"],
        total_tickets: json["total_tickets"],
        total_price: json["total_price"],
        transaction_id: json["transaction_id"],
        barcode: json["barcode"],
        status: json["status"],
        payment_type: json["payment_type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        event_details: json["event_details"] == null
            ? null
            : TransactionEventDetails.fromJson(json["event_details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "admission_type": admission_type,
        "per_ticket_price": per_ticket_price,
        "total_tickets": total_tickets,
        "total_price": total_price,
        "transaction_id": transaction_id,
        "barcode": barcode,
        "payment_type": payment_type,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "event_details": event_details!.toJson(),
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
