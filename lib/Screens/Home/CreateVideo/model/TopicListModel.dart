import 'dart:convert';

TopicListModel topicListModelFromJson(String str) => TopicListModel.fromJson(json.decode(str));

String topicListModelToJson(TopicListModel data) => json.encode(data.toJson());

class TopicListModel {
    TopicListModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool? success;
    int? statusCode;
    String? message;
    List<TopicList>? data;

    factory TopicListModel.fromJson(Map<String, dynamic> json) => TopicListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<TopicList>.from(json["data"].map((x) => TopicList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class TopicList {
    TopicList({
        this.id,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int? id;
    String? name;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    factory TopicList.fromJson(Map<String, dynamic> json) => TopicList(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : null,
        updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null,
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
