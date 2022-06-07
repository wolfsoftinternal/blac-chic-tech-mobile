// To parse this JSON data, do
//
//     final findSpeakerModel = findSpeakerModelFromJson(jsonString);

import 'dart:convert';

FindSpeakerModel findSpeakerModelFromJson(String str) =>
    FindSpeakerModel.fromJson(json.decode(str));

String findSpeakerModelToJson(FindSpeakerModel data) =>
    json.encode(data.toJson());

class FindSpeakerModel {
  FindSpeakerModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<FindSpeaker>? data;

  factory FindSpeakerModel.fromJson(Map<String, dynamic> json) =>
      FindSpeakerModel(
        success: json["success"] == null ? null : json["success"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<FindSpeaker>.from(
                json["data"].map((x) => FindSpeaker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status_code": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FindSpeaker {
  FindSpeaker({
    this.id,
    this.image,
    this.fullName,
    this.userName,
  });

  int? id;
  String? image;
  String? fullName;
  String? userName;

  factory FindSpeaker.fromJson(Map<String, dynamic> json) => FindSpeaker(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        userName: json["user_name"] == null ? null : json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image": image == null ? null : image,
        "full_name": fullName == null ? null : fullName,
        "user_name": userName == null ? null : userName,
      };
}
