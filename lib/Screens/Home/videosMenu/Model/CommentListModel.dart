// To parse this JSON data, do
//
//     final commentListModel = commentListModelFromJson(jsonString);

import 'dart:convert';

CommentListModel commentListModelFromJson(String str) =>
    CommentListModel.fromJson(json.decode(str));

String commentListModelToJson(CommentListModel data) =>
    json.encode(data.toJson());

class CommentListModel {
  CommentListModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<CommentModel>? data;

  factory CommentListModel.fromJson(Map<String, dynamic> json) =>
      CommentListModel(
        success: json["success"] == null ? null : json["success"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<CommentModel>.from(
                json["data"].map((x) => CommentModel.fromJson(x))),
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

class CommentModel {
  CommentModel({
    this.id,
    this.videoId,
    this.userId,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userDetails,
  });

  int? id;
  int? videoId;
  int? userId;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  UserDetails? userDetails;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"] == null ? null : json["id"],
        videoId: json["video_id"] == null ? null : json["video_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        comment: json["comment"] == null ? null : json["comment"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        userDetails: json["user_details"] == null
            ? null
            : UserDetails.fromJson(json["user_details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "video_id": videoId == null ? null : videoId,
        "user_id": userId == null ? null : userId,
        "comment": comment == null ? null : comment,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "user_details": userDetails == null ? null : userDetails!.toJson(),
      };
}

class UserDetails {
  UserDetails({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.userName,
    this.email,
    this.password,
    this.dateOfBirth,
    this.countryId,
    this.stateId,
    this.cityId,
    this.image,
    this.linkedinUrl,
    this.instagramUrl,
    this.twitterUrl,
    this.socialType,
    this.socialId,
    this.aboutUs,
    this.address,
    this.latitude,
    this.longitude,
    this.website,
    this.otp,
    this.role,
    this.wallet,
    this.emailVerifiedAt,
    this.isActive,
    this.isConfirm,
    this.isVisible,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? userName;
  String? email;
  String? password;
  dynamic dateOfBirth;
  int? countryId;
  int? stateId;
  int? cityId;
  String? image;
  dynamic linkedinUrl;
  dynamic instagramUrl;
  dynamic twitterUrl;
  dynamic socialType;
  dynamic socialId;
  String? aboutUs;
  dynamic address;
  dynamic latitude;
  dynamic longitude;
  dynamic website;
  dynamic otp;
  int? role;
  String? wallet;
  dynamic emailVerifiedAt;
  int? isActive;
  int? isConfirm;
  int? isVisible;
  dynamic rememberToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        userName: json["user_name"] == null ? null : json["user_name"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        dateOfBirth: json["date_of_birth"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        stateId: json["state_id"] == null ? null : json["state_id"],
        cityId: json["city_id"] == null ? null : json["city_id"],
        image: json["image"] == null ? null : json["image"],
        linkedinUrl: json["linkedin_url"],
        instagramUrl: json["instagram_url"],
        twitterUrl: json["twitter_url"],
        socialType: json["social_type"],
        socialId: json["social_id"],
        aboutUs: json["about_us"] == null ? null : json["about_us"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        website: json["website"],
        otp: json["otp"],
        role: json["role"] == null ? null : json["role"],
        wallet: json["wallet"] == null ? null : json["wallet"],
        emailVerifiedAt: json["email_verified_at"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        isConfirm: json["is_confirm"] == null ? null : json["is_confirm"],
        isVisible: json["is_visible"] == null ? null : json["is_visible"],
        rememberToken: json["remember_token"],
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
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "full_name": fullName == null ? null : fullName,
        "user_name": userName == null ? null : userName,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "date_of_birth": dateOfBirth,
        "country_id": countryId == null ? null : countryId,
        "state_id": stateId == null ? null : stateId,
        "city_id": cityId == null ? null : cityId,
        "image": image == null ? null : image,
        "linkedin_url": linkedinUrl,
        "instagram_url": instagramUrl,
        "twitter_url": twitterUrl,
        "social_type": socialType,
        "social_id": socialId,
        "about_us": aboutUs == null ? null : aboutUs,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "website": website,
        "otp": otp,
        "role": role == null ? null : role,
        "wallet": wallet == null ? null : wallet,
        "email_verified_at": emailVerifiedAt,
        "is_active": isActive == null ? null : isActive,
        "is_confirm": isConfirm == null ? null : isConfirm,
        "is_visible": isVisible == null ? null : isVisible,
        "remember_token": rememberToken,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
