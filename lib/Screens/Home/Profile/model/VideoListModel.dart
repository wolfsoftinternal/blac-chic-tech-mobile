import 'dart:convert';

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
        this.file,
        this.embededCode,
        this.caption,
        this.topic,
        this.language,
        this.duration,
        this.eventSpoken,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int? id;
    int? userId;
    String? file;
    dynamic embededCode;
    String? caption;
    String? topic;
    String? language;
    String? duration;
    String? eventSpoken;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    factory VideoList.fromJson(Map<String, dynamic> json) => VideoList(
        id: json["id"],
        userId: json["user_id"],
        file: json["file"],
        embededCode: json["embeded_code"],
        caption: json["caption"],
        topic: json["topic"],
        language: json["language"],
        duration: json["duration"],
        eventSpoken: json["event_spoken"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "file": file,
        "embeded_code": embededCode,
        "caption": caption,
        "topic": topic,
        "language": language,
        "duration": duration,
        "event_spoken": eventSpoken,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
