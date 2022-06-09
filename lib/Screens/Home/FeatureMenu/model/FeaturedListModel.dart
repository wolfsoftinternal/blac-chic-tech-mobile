import 'dart:convert';
import 'package:blackchecktech/Screens/Home/Profile/model/EventListModel.dart';

FeaturedListModel eventListModelFromJson(String str) =>
    FeaturedListModel.fromJson(json.decode(str));

String FeaturedListModelToJson(FeaturedListModel data) =>
    json.encode(data.toJson());

class FeaturedListModel {
  FeaturedListModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<FeaturedList>? data;

  factory FeaturedListModel.fromJson(Map<String, dynamic> json) =>
      FeaturedListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<FeaturedList>.from(
            json["data"].map((x) => FeaturedList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FeaturedList {
  FeaturedList({
    this.id,
    this.image,
    this.writer_name,
    this.title,
    this.sub_text,
    this.description,
    this.link,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? image;
  String? writer_name;
  String? title;
  String? sub_text;
  String? description;
  String? link;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory FeaturedList.fromJson(Map<String, dynamic> json) => FeaturedList(
        id: json["id"],
        image: json["image"],
        writer_name: json["writer_name"],
        title: json["title"],
        sub_text: json["sub_text"],
        description: json["description"],
        link: json["link"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "writer_name": writer_name,
        "title": title,
        "sub_text": sub_text,
        "description": description,
        "link": link,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
