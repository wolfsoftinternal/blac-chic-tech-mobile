import 'dart:convert';

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';

PostListModel postListModelFromJson(String str) => PostListModel.fromJson(json.decode(str));
String postListModelToJson(PostListModel data) => json.encode(data.toJson());

class PostListModel {
    PostListModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool? success;
    int? statusCode;
    String? message;
    List<PostList>? data;

    factory PostListModel.fromJson(Map<String, dynamic> json) => PostListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<PostList>.from(json["data"].map((x) => PostList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class PostList {
    PostList({
        this.id,
        this.userId,
        this.caption,
        this.address,
        this.latitude,
        this.longitude,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.taggedUsers,
        this.isFocus,
    });

    int? id;
    int? userId;
    String? caption;
    String? address;
    String? latitude;
    String? longitude;
    String? image;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    List<TaggedUser>? taggedUsers;
    int? isFocus;

    factory PostList.fromJson(Map<String, dynamic> json) => PostList(
        id: json["id"],
        userId: json["user_id"],
        caption: json["caption"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        taggedUsers: List<TaggedUser>.from(json["tagged_users"].map((x) => TaggedUser.fromJson(x))),
        isFocus: json["is_focus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "caption": caption,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "image": image,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "tagged_users": List<dynamic>.from(taggedUsers!.map((x) => x.toJson())),
        "is_focus": isFocus,
    };
}

class TaggedUser {
  TaggedUser({
      this.id,
      this.postId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userDetails,
  });

  int? id;
  int? postId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  UserDetails? userDetails;

  factory TaggedUser.fromJson(Map<String, dynamic> json) => TaggedUser(
      id: json["id"],
      postId: json["post_id"],
      userId: json["user_id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      deletedAt: json["deleted_at"],
      userDetails: UserDetails.fromJson(json["user_details"]),
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "post_id": postId,
      "user_id": userId,
      "created_at": createdAt!.toIso8601String(),
      "updated_at": updatedAt!.toIso8601String(),
      "deleted_at": deletedAt,
      "user_details": userDetails!.toJson(),
  };
}