import 'dart:convert';

UserListModel userListModelFromJson(String str) => UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
    UserListModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool? success;
    int? statusCode;
    String? message;
    List<UserList>? data;

    factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<UserList>.from(json["data"].map((x) => UserList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class UserList {
    UserList({
        this.id,
        this.firstName,
        this.lastName,
        this.image,
        this.userName,
        this.email,
        this.dateOfBirth,
        this.isVisible,
        this.countryId,
        this.stateId,
        this.cityId,
        this.linkedinUrl,
        this.instagramUrl,
        this.twitterUrl,
        this.aboutUs,
        this.address,
        this.latitude,
        this.longitude,
        this.website,
    });

    int? id;
    String? firstName;
    String? lastName;
    String? image;
    String? userName;
    String? email;
    DateTime? dateOfBirth;
    int? isVisible;
    int? countryId;
    int? stateId;
    int? cityId;
    dynamic linkedinUrl;
    dynamic instagramUrl;
    dynamic twitterUrl;
    dynamic aboutUs;
    dynamic address;
    dynamic latitude;
    dynamic longitude;
    dynamic website;

    factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["image"],
        userName: json["user_name"],
        email: json["email"],
        dateOfBirth: json["date_of_birth"] != null ? DateTime.parse(json["date_of_birth"]) : null,
        isVisible: json["is_visible"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        linkedinUrl: json["linkedin_url"],
        instagramUrl: json["instagram_url"],
        twitterUrl: json["twitter_url"],
        aboutUs: json["about_us"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        website: json["website"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "image": image,
        "user_name": userName,
        "email": email,
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "is_visible": isVisible,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "linkedin_url": linkedinUrl,
        "instagram_url": instagramUrl,
        "twitter_url": twitterUrl,
        "about_us": aboutUs,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "website": website,
    };
}
