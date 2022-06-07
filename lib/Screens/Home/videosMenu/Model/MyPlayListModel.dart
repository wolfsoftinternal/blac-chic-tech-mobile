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
        data: json["data"] == null
            ? null
            : List<MyPlayModel>.from(
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
    this.userDetails,
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
        userDetails: json["user_details"] == null
            ? null
            : UserDetails.fromJson(json["user_details"]),
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
  DateTime? dateOfBirth;
  int? countryId;
  int? stateId;
  int? cityId;
  String? image;
  String? linkedinUrl;
  String? instagramUrl;
  String? twitterUrl;
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
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        countryId: json["country_id"] == null ? null : json["country_id"],
        stateId: json["state_id"] == null ? null : json["state_id"],
        cityId: json["city_id"] == null ? null : json["city_id"],
        image: json["image"] == null ? null : json["image"],
        linkedinUrl: json["linkedin_url"] == null ? null : json["linkedin_url"],
        instagramUrl:
            json["instagram_url"] == null ? null : json["instagram_url"],
        twitterUrl: json["twitter_url"] == null ? null : json["twitter_url"],
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
        "date_of_birth": dateOfBirth == null
            ? null
            : "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "country_id": countryId == null ? null : countryId,
        "state_id": stateId == null ? null : stateId,
        "city_id": cityId == null ? null : cityId,
        "image": image == null ? null : image,
        "linkedin_url": linkedinUrl == null ? null : linkedinUrl,
        "instagram_url": instagramUrl == null ? null : instagramUrl,
        "twitter_url": twitterUrl == null ? null : twitterUrl,
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
