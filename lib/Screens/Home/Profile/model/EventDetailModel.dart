import 'dart:convert';

import 'package:blackchecktech/Screens/Home/Profile/model/EventListModel.dart';

EventDetailModel eventDetailModelFromJson(String str) => EventDetailModel.fromJson(json.decode(str));

String eventDetailModelToJson(EventDetailModel data) => json.encode(data.toJson());

class EventDetailModel {
    EventDetailModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool? success;
    int? statusCode;
    String? message;
    EventList? data;

    factory EventDetailModel.fromJson(Map<String, dynamic> json) => EventDetailModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data : json['data'] != null ? EventList.fromJson(json['data']) : null,
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": data!.toJson(),
    };
}

