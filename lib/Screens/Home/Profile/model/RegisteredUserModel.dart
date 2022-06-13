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
    Data? data;

    factory RegisterUserModel.fromJson(Map<String, dynamic> json) => RegisterUserModel(
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
        this.transactionHistory,
        this.registeredUsers,
    });

    List<TransactionHistory>? transactionHistory;
    List<RegisteredUser>? registeredUsers;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        transactionHistory: List<TransactionHistory>.from(json["transaction_history"].map((x) => TransactionHistory.fromJson(x))),
        registeredUsers: List<RegisteredUser>.from(json["registered_users"].map((x) => RegisteredUser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "transaction_history": List<dynamic>.from(transactionHistory!.map((x) => x.toJson())),
        "registered_users": List<dynamic>.from(registeredUsers!.map((x) => x.toJson())),
    };
}

class RegisteredUser {
    RegisteredUser({
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

    factory RegisteredUser.fromJson(Map<String, dynamic> json) => RegisteredUser(
        id: json["id"],
        userName: json["user_name"],
        fullName: json["full_name"],
        image: json["image"],
        category: json["category"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
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

class TransactionHistory {
    TransactionHistory({
        this.admissionType,
        this.perTicketPrice,
        this.totalUsers,
        this.totalPrice,
    });

    String? admissionType;
    String? perTicketPrice;
    int? totalUsers;
    int? totalPrice;

    factory TransactionHistory.fromJson(Map<String, dynamic> json) => TransactionHistory(
        admissionType: json["admission_type"],
        perTicketPrice: json["per_ticket_price"],
        totalUsers: json["total_users"],
        totalPrice: json["total_price"],
    );

    Map<String, dynamic> toJson() => {
        "admission_type": admissionType,
        "per_ticket_price": perTicketPrice,
        "total_users": totalUsers,
        "total_price": totalPrice,
    };
}
