// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"] == null ? null : json["success"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status_code": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
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
    this.description,
    this.address,
    this.latitude,
    this.longitude,
    this.otp,
    this.role,
    this.emailVerifiedAt,
    this.isActive,
    this.isConfirm,
    this.isVisible,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.token,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? userName;
  String? email;
  String? password;
  dynamic dateOfBirth;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  dynamic image;
  dynamic linkedinUrl;
  dynamic instagramUrl;
  dynamic twitterUrl;
  dynamic socialType;
  dynamic socialId;
  dynamic description;
  dynamic address;
  dynamic latitude;
  dynamic longitude;
  dynamic otp;
  int? role;
  dynamic emailVerifiedAt;
  int? isActive;
  int? isConfirm;
  int? isVisible;
  dynamic rememberToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        userName: json["user_name"] == null ? null : json["user_name"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        dateOfBirth: json["date_of_birth"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        image: json["image"],
        linkedinUrl: json["linkedin_url"],
        instagramUrl: json["instagram_url"],
        twitterUrl: json["twitter_url"],
        socialType: json["social_type"],
        socialId: json["social_id"],
        description: json["description"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        otp: json["otp"],
        role: json["role"] == null ? null : json["role"],
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
        token: json["token"] == null ? null : json["token"],
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
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "image": image,
        "linkedin_url": linkedinUrl,
        "instagram_url": instagramUrl,
        "twitter_url": twitterUrl,
        "social_type": socialType,
        "social_id": socialId,
        "description": description,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "otp": otp,
        "role": role == null ? null : role,
        "email_verified_at": emailVerifiedAt,
        "is_active": isActive == null ? null : isActive,
        "is_confirm": isConfirm == null ? null : isConfirm,
        "is_visible": isVisible == null ? null : isVisible,
        "remember_token": rememberToken,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "token": token == null ? null : token,
      };
}
