import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    SignupModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool? success;
    int? statusCode;
    String? message;
    Data? data;

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": data!.toJson(),
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
        this.aboutUs,
        this.address,
        this.latitude,
        this.longitude,
        this.website,
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
        required this.token,
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
    dynamic aboutUs;
    dynamic address;
    dynamic latitude;
    dynamic longitude;
    dynamic website;
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
    String token = "";

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fullName: json["full_name"],
        userName: json["user_name"],
        email: json["email"],
        password: json["password"],
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
        aboutUs: json["about_us"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        website: json["website"],
        otp: json["otp"],
        role: json["role"],
        emailVerifiedAt: json["email_verified_at"],
        isActive: json["is_active"],
        isConfirm: json["is_confirm"],
        isVisible: json["is_visible"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        token: json["token"] != null ? json["token"] : "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "full_name": fullName,
        "user_name": userName,
        "email": email,
        "password": password,
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
        "about_us": aboutUs,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "website": website,
        "otp": otp,
        "role": role,
        "email_verified_at": emailVerifiedAt,
        "is_active": isActive,
        "is_confirm": isConfirm,
        "is_visible": isVisible,
        "remember_token": rememberToken,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "token": token,
    };
}
