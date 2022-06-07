import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) => RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) => json.encode(data.toJson());

class RegisterUserModel {
    RegisterUserModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool? success;
    int? statusCode;
    String? message;
    List<RegisterUser>? data;

    factory RegisterUserModel.fromJson(Map<String, dynamic> json) => RegisterUserModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<RegisterUser>.from(json["data"].map((x) => RegisterUser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class RegisterUser {
    RegisterUser({
        this.id,
        this.userName,
        this.fullName,
        this.image,
        this.category,
        this.price,
        this.createdAt,
    });

    int? id;
    String? userName;
    String? fullName;
    String? image;
    String? category;
    String? price;
    DateTime? createdAt;

    factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
        id: json["id"],
        userName: json["user_name"],
        fullName: json["full_name"],
        image: json["image"],
        category: json["category"],
        price: json["price"],
        createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "full_name": fullName,
        "image": image,
        "category": category,
        "price": price,
        "created_at": createdAt!.toIso8601String(),
    };
}
