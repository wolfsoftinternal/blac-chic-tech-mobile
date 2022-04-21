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
        this.firstName,
        this.lastName,
        this.email,
        this.userName,
        this.fullName,
        this.password,
        this.role,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.token,
    });

    String? firstName;
    String? lastName;
    String? email;
    String? userName;
    String? fullName;
    String? password;
    int? role;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;
    String? token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        userName: json["user_name"],
        fullName: json["full_name"],
        password: json["password"],
        role: json["role"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "user_name": userName,
        "full_name": fullName,
        "password": password,
        "role": role,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
        "token": token,
    };
}
