import 'dart:convert';

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';

AdmireListModel admireListModelFromJson(String str) => AdmireListModel.fromJson(json.decode(str));

String admireListModelToJson(AdmireListModel data) => json.encode(data.toJson());

class AdmireListModel {
    AdmireListModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool? success;
    int? statusCode;
    String? message;
    List<AdmireList>? data;

    factory AdmireListModel.fromJson(Map<String, dynamic> json) => AdmireListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<AdmireList>.from(json["data"].map((x) => AdmireList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class AdmireList {
    AdmireList({
        this.id,
        this.userId,
        this.admireId,
        this.number,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.admireDetails,
    });

    int? id;
    int? userId;
    int? admireId;
    int? number;
    int? status;
    String? createdAt;
    String? updatedAt;
    dynamic deletedAt;
    UserDetails? admireDetails;

    factory AdmireList.fromJson(Map<String, dynamic> json) => AdmireList(
        id: json["id"],
        userId: json["user_id"],
        admireId: json["admire_id"],
        number: json["number"],
        status: json["status"],
        createdAt: json["created_at"] == null ? "" : json["created_at"],
        updatedAt: json["updated_at"] == null ? "" : json["updated_at"],
        deletedAt: json["deleted_at"],
        admireDetails: UserDetails.fromJson(json["admire_details"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "admire_id": admireId,
        "number": number,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "admire_details": admireDetails!.toJson(),
    };
}

// class AdmireDetails {
//     AdmireDetails({
//         this.currentJobs,
//         this.pastJobs,
//         this.id,
//         this.firstName,
//         this.lastName,
//         this.fullName,
//         this.userName,
//         this.email,
//         this.password,
//         this.dateOfBirth,
//         this.countryId,
//         this.stateId,
//         this.cityId,
//         this.image,
//         this.linkedinUrl,
//         this.instagramUrl,
//         this.twitterUrl,
//         this.socialType,
//         this.socialId,
//         this.aboutUs,
//         this.address,
//         this.latitude,
//         this.longitude,
//         this.website,
//         this.otp,
//         this.role,
//         this.emailVerifiedAt,
//         this.isActive,
//         this.isConfirm,
//         this.isVisible,
//         this.rememberToken,
//         this.createdAt,
//         this.updatedAt,
//         this.deletedAt,
//         this.educations,
//         this.images,
//         this.questions,
//         this.countryDetails,
//         this.stateDetails,
//         this.cityDetails,
//     });

//     CurrentJobs? currentJobs;
//     List<CurrentJobs>? pastJobs;
//     int? id;
//     String? firstName;
//     String? lastName;
//     String? fullName;
//     String? userName;
//     String? email;
//     String? password;
//     dynamic dateOfBirth;
//     int? countryId;
//     int? stateId;
//     int? cityId;
//     String? image;
//     dynamic linkedinUrl;
//     dynamic instagramUrl;
//     dynamic twitterUrl;
//     dynamic socialType;
//     dynamic socialId;
//     String? aboutUs;
//     dynamic address;
//     dynamic latitude;
//     dynamic longitude;
//     dynamic website;
//     dynamic otp;
//     int? role;
//     dynamic emailVerifiedAt;
//     int? isActive;
//     int? isConfirm;
//     int? isVisible;
//     dynamic rememberToken;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     dynamic deletedAt;
//     List<Education>? educations;
//     List<dynamic>? images;
//     List<Question>? questions;
//     Details? countryDetails;
//     Details? stateDetails;
//     Details? cityDetails;

//     factory AdmireDetails.fromJson(Map<String, dynamic> json) => AdmireDetails(
//         currentJobs: json["current_jobs"] == null ? null : CurrentJobs.fromJson(json["current_jobs"]),
//         pastJobs: json["past_jobs"] == null ? null : List<CurrentJobs>.from(json["past_jobs"].map((x) => CurrentJobs.fromJson(x))),
//         id: json["id"] == null ? null : json["id"],
//         firstName: json["first_name"] == null ? null : json["first_name"],
//         lastName: json["last_name"] == null ? null : json["last_name"],
//         fullName: json["full_name"] == null ? null : json["full_name"],
//         userName: json["user_name"] == null ? null : json["user_name"],
//         email: json["email"] == null ? null : json["email"],
//         password: json["password"] == null ? null : json["password"],
//         dateOfBirth: json["date_of_birth"],
//         countryId: json["country_id"] == null ? null : json["country_id"],
//         stateId: json["state_id"] == null ? null : json["state_id"],
//         cityId: json["city_id"] == null ? null : json["city_id"],
//         image: json["image"] == null ? null : json["image"],
//         linkedinUrl: json["linkedin_url"],
//         instagramUrl: json["instagram_url"],
//         twitterUrl: json["twitter_url"],
//         socialType: json["social_type"],
//         socialId: json["social_id"],
//         aboutUs: json["about_us"] == null ? null : json["about_us"],
//         address: json["address"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         website: json["website"],
//         otp: json["otp"],
//         role: json["role"] == null ? null : json["role"],
//         emailVerifiedAt: json["email_verified_at"],
//         isActive: json["is_active"] == null ? null : json["is_active"],
//         isConfirm: json["is_confirm"] == null ? null : json["is_confirm"],
//         isVisible: json["is_visible"] == null ? null : json["is_visible"],
//         rememberToken: json["remember_token"],
//         createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : null,
//         updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null,
//         deletedAt: json["deleted_at"],
//         educations: json["educations"] == null ? null : List<Education>.from(json["educations"].map((x) => Education.fromJson(x))),
//         images:  json["images"] == null ? null : List<dynamic>.from(json["images"].map((x) => x)),
//         questions: json["questions"] == null ? null : List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
//         countryDetails: json["country_details"] == null ? null : Details.fromJson(json["country_details"]),
//         stateDetails: json["state_details"] == null ? null : Details.fromJson(json["state_details"]),
//         cityDetails: json["city_details"] == null ? null : Details.fromJson(json["city_details"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "current_jobs": currentJobs == null ? null : currentJobs!.toJson(),
//         "past_jobs": List<dynamic>.from(pastJobs!.map((x) => x.toJson())),
//         "id": id == null ? null : id,
//         "first_name": firstName == null ? null : firstName,
//         "last_name": lastName == null ? null : lastName,
//         "full_name": fullName == null ? null : fullName,
//         "user_name": userName == null ? null : userName,
//         "email": email == null ? null : email,
//         "password": password == null ? null : password,
//         "date_of_birth": dateOfBirth,
//         "country_id": countryId == null ? null : countryId,
//         "state_id": stateId == null ? null : stateId,
//         "city_id": cityId == null ? null : cityId,
//         "image": image == null ? null : image,
//         "linkedin_url": linkedinUrl,
//         "instagram_url": instagramUrl,
//         "twitter_url": twitterUrl,
//         "social_type": socialType,
//         "social_id": socialId,
//         "about_us": aboutUs == null ? null : aboutUs,
//         "address": address,
//         "latitude": latitude,
//         "longitude": longitude,
//         "website": website,
//         "otp": otp,
//         "role": role == null ? null : role,
//         "email_verified_at": emailVerifiedAt,
//         "is_active": isActive == null ? null : isActive,
//         "is_confirm": isConfirm == null ? null : isConfirm,
//         "is_visible": isVisible == null ? null : isVisible,
//         "remember_token": rememberToken,
//         "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
//         "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
//         "deleted_at": deletedAt,
//         "educations": List<dynamic>.from(educations!.map((x) => x.toJson())),
//         "images": images == null ? null : List<dynamic>.from(images!.map((x) => x)),
//         "questions": List<dynamic>.from(questions!.map((x) => x.toJson())),
//         "country_details": countryDetails == null ? null : countryDetails!.toJson(),
//         "state_details": stateDetails == null ? null : stateDetails!.toJson(),
//         "city_details": cityDetails == null ? null : cityDetails!.toJson(),
//     };
// }

// class Details {
//     Details({
//         this.id,
//         this.countryId,
//         this.stateId,
//         this.name,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.deletedAt,
//     });

//     int? id;
//     int? countryId;
//     int? stateId;
//     String? name;
//     int? status;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     dynamic deletedAt;

//     factory Details.fromJson(Map<String, dynamic> json) => Details(
//         id: json["id"],
//         countryId: json["country_id"] == null ? null : json["country_id"],
//         stateId: json["state_id"] == null ? null : json["state_id"],
//         name: json["name"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "country_id": countryId == null ? null : countryId,
//         "state_id": stateId == null ? null : stateId,
//         "name": name,
//         "status": status,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//         "deleted_at": deletedAt,
//     };
// }

// class CurrentJobs {
//     CurrentJobs({
//         this.id,
//         this.userId,
//         this.type,
//         this.title,
//         this.companyName,
//         this.logo,
//         this.website,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.deletedAt,
//     });

//     int? id;
//     int? userId;
//     String? type;
//     String? title;
//     String? companyName;
//     dynamic logo;
//     dynamic website;
//     int? status;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     dynamic deletedAt;

//     factory CurrentJobs.fromJson(Map<String, dynamic> json) => CurrentJobs(
//         id: json["id"],
//         userId: json["user_id"],
//         type: json["type"],
//         title: json["title"],
//         companyName: json["company_name"],
//         logo: json["logo"],
//         website: json["website"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "type": type,
//         "title": title,
//         "company_name": companyName,
//         "logo": logo,
//         "website": website,
//         "status": status,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//         "deleted_at": deletedAt,
//     };
// }

// class Education {
//     Education({
//         this.id,
//         this.userId,
//         this.schoolUniversity,
//         this.startYear,
//         this.endYear,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.deletedAt,
//     });

//     int? id;
//     int? userId;
//     String? schoolUniversity;
//     String? startYear;
//     String? endYear;
//     int? status;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     dynamic deletedAt;

//     factory Education.fromJson(Map<String, dynamic> json) => Education(
//         id: json["id"],
//         userId: json["user_id"],
//         schoolUniversity: json["school_university"],
//         startYear: json["start_year"],
//         endYear: json["end_year"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "school_university": schoolUniversity,
//         "start_year": startYear,
//         "end_year": endYear,
//         "status": status,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//         "deleted_at": deletedAt,
//     };
// }

// class Question {
//     Question({
//         this.id,
//         this.userId,
//         this.question,
//         this.answer,
//         this.type,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//         this.deletedAt,
//     });

//     int? id;
//     int? userId;
//     String? question;
//     String? answer;
//     String? type;
//     int? status;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     dynamic deletedAt;

//     factory Question.fromJson(Map<String, dynamic> json) => Question(
//         id: json["id"],
//         userId: json["user_id"],
//         question: json["question"],
//         answer: json["answer"],
//         type: json["type"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "user_id": userId,
//         "question": question,
//         "answer": answer,
//         "type": type,
//         "status": status,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//         "deleted_at": deletedAt,
//     };
// }
