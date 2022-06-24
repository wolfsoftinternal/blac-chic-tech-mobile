import 'dart:convert';

UserListModel userListModelFromJson(String str) => UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
    UserListModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
        this.user_count,
    });

    bool? success;
    int? statusCode;
    String? message;
    List<UserList>? data;
    int? user_count;

    factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<UserList>.from(json["data"].map((x) => UserList.fromJson(x))),
        user_count: json["user_count"] != null ? json["user_count"] : null
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "user_count": user_count,
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
        this.isAdmire,
        this.currentJobs,
        this.isSpeakerSelected,
        this.isHostSelected,
        this.is_invited,
    });

    dynamic id;
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
    int? isAdmire;
    dynamic linkedinUrl;
    dynamic instagramUrl;
    dynamic twitterUrl;
    dynamic aboutUs;
    dynamic address;
    dynamic latitude;
    dynamic longitude;
    dynamic website;
    CurrentJobs? currentJobs;
    bool? isSpeakerSelected;
    bool? isHostSelected;
    int? is_invited;

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
        isAdmire : json["is_admire"],
        currentJobs: json["current_jobs"] == null ? null : CurrentJobs.fromJson(json["current_jobs"]),
        is_invited: json["is_invited"] == null ? null : json["is_invited"],
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
        "current_jobs": currentJobs!.toJson(),
        "is_invited": is_invited,
    };
}

class CurrentJobs {
    CurrentJobs({
        this.id,
        this.userId,
        this.type,
        this.title,
        this.companyName,
        this.logo,
        this.website,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int? id;
    int? userId;
    String? type;
    String? title;
    String? companyName;
    dynamic logo;
    String? website;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    factory CurrentJobs.fromJson(Map<String, dynamic> json) => CurrentJobs(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        title: json["title"],
        companyName: json["company_name"],
        logo: json["logo"],
        website: json["website"] == null ? null : json["website"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "title": title,
        "company_name": companyName,
        "logo": logo,
        "website": website == null ? null : website,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
