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
    UserDetails? data;

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: UserDetails.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": data!.toJson(),
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
        this.emailVerifiedAt,
        this.isActive,
        this.isConfirm,
        this.isVisible,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.currentJobs,
        this.pastJobs,
        this.token,
        this.educations,
        this.images,
        this.questions,
        this.countryDetails,
        this.stateDetails,
        this.cityDetails,
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
    dynamic emailVerifiedAt;
    int? isActive;
    int? isConfirm;
    int? isVisible;
    dynamic rememberToken;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    CurrentJobs? currentJobs;
    List<CurrentJobs>? pastJobs;
    String? token;
    List<Education>? educations;
    List<dynamic> ?images;
    List<Question>? questions;
    Details? countryDetails;
    Details? stateDetails;
    Details? cityDetails;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
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
        createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : null,
        updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null,
        deletedAt: json["deleted_at"],
        currentJobs: json["current_jobs"] != null ? CurrentJobs.fromJson(json["current_jobs"]) : null,
        pastJobs: json["past_jobs"] == null ? null : List<CurrentJobs>.from(json["past_jobs"].map((x) => CurrentJobs.fromJson(x))),
        token: json["token"] != null ? json["token"] : null,
        educations: json["educations"] != null ? List<Education>.from(json["educations"].map((x) => Education.fromJson(x))) : null,
        images: json["images"] != null ? List<dynamic>.from(json["images"].map((x) => x)) : null,
        questions: json["questions"] != null ? List<Question>.from(json["questions"].map((x) => Question.fromJson(x))) : null,
        countryDetails: json["country_details"] == null ? null : Details.fromJson(json["country_details"]),
        stateDetails: json["state_details"] == null ? null : Details.fromJson(json["state_details"]),
        cityDetails: json["city_details"] == null ? null : Details.fromJson(json["city_details"]),
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
        "current_jobs": currentJobs != null ? currentJobs!.toJson() : null,
        "past_jobs": pastJobs != null ? List<dynamic>.from(pastJobs!.map((x) => x.toJson())) : null,
        "token": token,
        "educations": educations != null ? List<dynamic>.from(educations!.map((x) => x.toJson())) : null,
        "images": images != null ? List<dynamic>.from(images!.map((x) => x)) : null,
        "questions": questions!= null ? List<dynamic>.from(questions!.map((x) => x.toJson())) : null,
        "country_details": countryDetails != null ? countryDetails!.toJson() : null,
        "state_details": stateDetails != null ? stateDetails!.toJson() : null,
        "city_details": cityDetails != null ? cityDetails!.toJson() : null,
    };
}

class Details {
    Details({
        this.id,
        this.countryId,
        this.stateId,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int? id;
    int? countryId;
    int? stateId;
    String? name;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        stateId: json["state_id"] == null ? null : json["state_id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "country_id": countryId == null ? null : countryId,
        "state_id": stateId == null ? null : stateId,
        "name": name,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
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
        website: json["website"],
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
        "website": website,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class Education {
    Education({
        this.id,
        this.userId,
        this.schoolUniversity,
        this.startYear,
        this.endYear,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int? id;
    int? userId;
    String? schoolUniversity;
    String? startYear;
    String? endYear;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"],
        userId: json["user_id"],
        schoolUniversity: json["school_university"],
        startYear: json["start_year"],
        endYear: json["end_year"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "school_university": schoolUniversity,
        "start_year": startYear,
        "end_year": endYear,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class Question {
    Question({
        this.id,
        this.userId,
        this.question,
        this.answer,
        this.type,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int? id;
    int? userId;
    String? question;
    String? answer;
    String? type;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        userId: json["user_id"],
        question: json["question"],
        answer: json["answer"],
        type: json["type"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "question": question,
        "answer": answer,
        "type": type,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
