import 'dart:convert';

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';

VideoListModel videoListModelFromJson(String str) => VideoListModel.fromJson(json.decode(str));

String videoListModelToJson(VideoListModel data) => json.encode(data.toJson());

class VideoListModel {
    VideoListModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool? success;
    int? statusCode;
    String? message;
    List<VideoList>? data;

    factory VideoListModel.fromJson(Map<String, dynamic> json) => VideoListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<VideoList>.from(json["data"].map((x) => VideoList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class VideoList {
    VideoList({
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
        this.userDetails,
        this.speakerList,
        this.isFocus,
        this.like_count,
        this.is_like,
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
    UserDetails? userDetails;
    List<String>? speakerList;
    int? isFocus;
    int? like_count;
    int? is_like;

    factory VideoList.fromJson(Map<String, dynamic> json) => VideoList(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        topic: json["topic"],
        language: json["language"],
        file: json["file"],
        embededCode: json["embeded_code"],
        tags: json["tags"],
        speakers: json["speakers"],
        status: json["status"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        userDetails: json["user_details"] == null
            ? null
            : UserDetails.fromJson(json["user_details"]),
        speakerList: json["speaker_list"] == null ? null : List<String>.from(json["speaker_list"].map((x) => x)),
        isFocus: json["is_focus"],
        like_count: json["like_count"],
        is_like: json["is_like"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "topic": topic,
        "language": language,
        "file": file,
        "embeded_code": embededCode,
        "tags": tags,
        "speakers": speakers,
        "status": status,
        "description": description,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "user_details": userDetails == null ? null : userDetails!.toJson(),
        "speaker_list": List<dynamic>.from(speakerList!.map((x) => x)),
        "is_focus": isFocus,
        "like_count": like_count,
        "is_like": is_like,
    };
}
