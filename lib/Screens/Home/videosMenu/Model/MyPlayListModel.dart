// To parse this JSON data, do
//
//     final myPlayListModel = myPlayListModelFromJson(jsonString);

import 'dart:convert';

MyPlayListModel myPlayListModelFromJson(String str) =>
    MyPlayListModel.fromJson(json.decode(str));

String myPlayListModelToJson(MyPlayListModel data) =>
    json.encode(data.toJson());

class MyPlayListModel {
  MyPlayListModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<MyPlayModel>? data;

  factory MyPlayListModel.fromJson(Map<String, dynamic> json) =>
      MyPlayListModel(
        success: json["success"] == null ? null : json["success"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
        message: json["message"] == null ? null : json["message"],
        data: List<MyPlayModel>.from(
            json["data"].map((x) => MyPlayModel.fromJson(x))),
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

class MyPlayModel {
  MyPlayModel({
    this.id,
    this.userId,
    this.title,
    this.topic,
    this.language,
    this.file,
    this.embededCode,
    this.tags,
    this.speakers,
    this.status,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  int? userId;
  String? title;
  String? topic;
  String? language;
  dynamic file;
  String? embededCode;
  String? tags;
  String? speakers;
  int? status;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory MyPlayModel.fromJson(Map<String, dynamic> json) => MyPlayModel(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        title: json["title"] == null ? null : json["title"],
        topic: json["topic"] == null ? null : json["topic"],
        language: json["language"] == null ? null : json["language"],
        file: json["file"],
        embededCode: json["embeded_code"] == null ? null : json["embeded_code"],
        tags: json["tags"] == null ? null : json["tags"],
        speakers: json["speakers"] == null ? null : json["speakers"],
        status: json["status"] == null ? null : json["status"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "title": title == null ? null : title,
        "topic": topic == null ? null : topic,
        "language": language == null ? null : language,
        "file": file,
        "embeded_code": embededCode == null ? null : embededCode,
        "tags": tags == null ? null : tags,
        "speakers": speakers == null ? null : speakers,
        "status": status == null ? null : status,
        "description": description == null ? null : description,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
