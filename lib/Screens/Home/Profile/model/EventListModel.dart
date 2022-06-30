import 'dart:convert';

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/UserListModel.dart';
import 'package:blackchecktech/Screens/Home/Event/model/OrderListModel.dart';

EventListModel eventListModelFromJson(String str) =>
    EventListModel.fromJson(json.decode(str));

String eventListModelToJson(EventListModel data) => json.encode(data.toJson());

class EventListModel {
  EventListModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<EventList>? data;

  factory EventListModel.fromJson(Map<String, dynamic> json) => EventListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<EventList>.from(
            json["data"].map((x) => EventList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class EventList {
  EventList({
    this.id,
    this.userId,
    this.title,
    this.startDate,
    this.startTime,
    this.startDateTime,
    this.endDate,
    this.endTime,
    this.endDateTime,
    this.venue,
    this.address,
    this.latitude,
    this.longitude,
    this.poster,
    this.countryId,
    this.stateId,
    this.cityId,
    this.details,
    this.status,
    this.type,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.admissionData,
    this.countryDetails,
    this.stateDetails,
    this.cityDetails,
    this.is_purchased,
    this.hosts,
    this.speakers,
    this.benefits,
    this.invitedUsers,
    this.transactions,
    this.event_type,
    this.event_status,
    this.link,
  });

  int? id;
  int? userId;
  String? title;
  String? startDate;
  String? startTime;
  DateTime? startDateTime;
  dynamic endDate;
  dynamic endTime;
  dynamic endDateTime;
  String? venue;
  String? address;
  String? latitude;
  String? longitude;
  dynamic poster;
  int? countryId;
  int? stateId;
  int? cityId;
  String? details;
  int? status;
  String? type;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic is_purchased;
  List<Benefit>? admissionData;
  Details? countryDetails;
  Details? stateDetails;
  Details? cityDetails;
  List<UserList>? hosts;
  List<SpeakerElement>? speakers;
  List<Benefit>? benefits;
  List<UserList>? invitedUsers;
  List<Order>? transactions;
  String? event_type;
  dynamic event_status;
  String? link;

  factory EventList.fromJson(Map<String, dynamic> json) => EventList(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        startDate: json["start_date"],
        startTime: json["start_time"],
        startDateTime: DateTime.parse(json["start_date_time"]),
        endDate: json["end_date"],
        endTime: json["end_time"],
        endDateTime: json["end_date_time"],
        venue: json["venue"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        poster: json["poster"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        details: json["details"],
        status: json["status"],
        type: json["type"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        is_purchased: json["is_purchased"],
        admissionData: json["admission_data"] != null
            ? List<Benefit>.from(
                json["admission_data"].map((x) => Benefit.fromJson(x)))
            : null,
        countryDetails: json["country_details"] == null
            ? null
            : Details.fromJson(json["country_details"]),
        stateDetails: json["state_details"] == null
            ? null
            : Details.fromJson(json["state_details"]),
        cityDetails: json["city_details"] == null
            ? null
            : Details.fromJson(json["city_details"]),
        hosts: json["hosts"] == null ? null :
            List<UserList>.from(json["hosts"].map((x) => UserList.fromJson(x))),
        speakers: json["speakers"] == null ? null : List<SpeakerElement>.from(json["speakers"].map((x) => SpeakerElement.fromJson(x))),
        benefits: json["benefits"] != null
            ? List<Benefit>.from(
                json["benefits"].map((x) => Benefit.fromJson(x)))
            : null,
        invitedUsers: List<UserList>.from(
            json["invited_users"].map((x) => UserList.fromJson(x))),


    transactions: json["transactions"] != null
        ? List<Order>.from(
        json["transactions"].map((x) => Order.fromJson(x)))
        : null,


        event_type: json["event_type"] != null ? json["event_type"] : null,
        event_status: json["event_status"] == null ? null : json["event_status"],
        link: json["link"] == null ? null : json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "start_date": startDate,
        "start_time": startTime,
        "start_date_time": startDateTime!.toIso8601String(),
        "end_date": endDate,
        "end_time": endTime,
        "end_date_time": endDateTime,
        "venue": venue,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "poster": poster,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "details": details,
        "status": status,
        "type": type,
        "price": price,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "admission_data":
            List<dynamic>.from(admissionData!.map((x) => x.toJson())),
        "country_details": countryDetails!.toJson(),
        "state_details": stateDetails!.toJson(),
        "city_details": cityDetails!.toJson(),
        "is_purchased": is_purchased!.toJson(),
        "hosts": List<dynamic>.from(hosts!.map((x) => x.toJson())),
        "speakers": List<dynamic>.from(speakers!.map((x) => x.toJson())),
        "benefits": List<dynamic>.from(benefits!.map((x) => x.toJson())),
        "invited_users":
            List<dynamic>.from(invitedUsers!.map((x) => x.toJson())),
       "transactions": List<dynamic>.from(transactions!.map((x) => x.toJson())),
        "event_type": event_type,
        "event_status": event_status,
        "link": link,
      };
}

class Benefit {
  Benefit({
    this.id,
    this.userId,
    this.eventId,
    this.category,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.benefits,
  });

  int? id;
  int? userId;
  int? eventId;
  String? category;
  String? price;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  List<dynamic>? benefits;

  factory Benefit.fromJson(Map<String, dynamic> json) => Benefit(
        id: json["id"],
        userId: json["user_id"],
        eventId: json["event_id"],
        category: json["category"],
        price: json["price"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        benefits: json["benefits"] != null
            ? List<dynamic>.from(json["benefits"].map((x) => x))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "event_id": eventId,
        "category": category,
        "price": price,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "benefits": List<dynamic>.from(benefits!.map((x) => x)),
      };
}

class Host {
  Host({
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
  String? linkedinUrl;
  String? instagramUrl;
  String? twitterUrl;
  dynamic socialType;
  dynamic socialId;
  dynamic aboutUs;
  dynamic address;
  dynamic latitude;
  dynamic longitude;
  String? website;
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

  factory Host.fromJson(Map<String, dynamic> json) => Host(
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
        instagramUrl:
            json["instagram_url"],
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
      };
}

class SpeakerElement {
    SpeakerElement({
        this.id,
        this.fullName,
        this.image,
    });

    dynamic id;
    String? fullName;
    String? image;

    factory SpeakerElement.fromJson(Map<String, dynamic> json) => SpeakerElement(
        id: json["image"] == null ? null : json["id"],
        fullName: json["full_name"],
        image: json["image"] == null ? null : json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "image": image == null ? null : image,
    };
}

