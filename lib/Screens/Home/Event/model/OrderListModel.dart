import 'dart:convert';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
    OrderListModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool? success;
    int? statusCode;
    String? message;
    Order? data;

    factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data : json['data'] != null ? Order.fromJson(json['data']) : null,
    );


    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": data!.toJson(),
    };
}

class Order {
    Order({
        this.id,
        this.user_id,
        this.event_id,
        this.admission_type,
        this.per_ticket_price,
        this.total_tickets,
        this.total_price,
        this.transaction_id,
        this.barcode,
        this.wallet_amount,
        this.trans_amount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int? id;
    int? user_id;
    int? event_id;
    String? admission_type;
    String? per_ticket_price;
    int? total_tickets;
    String? total_price;
    String? transaction_id;
    String? barcode;
    String? wallet_amount;
    String? trans_amount;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        user_id: json["user_id"],
        event_id: json["event_id"],
        admission_type: json["admission_type"],
        per_ticket_price: json["per_ticket_price"],
        total_tickets: json["total_tickets"],
        total_price: json["total_price"],
        transaction_id: json["transaction_id"],
        barcode: json["barcode"],
        wallet_amount: json["wallet_amount"],
        trans_amount: json["trans_amount"],
        status: json["status"],
        createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : null,
        updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null,
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": user_id,
        "event_id": event_id,
        "admission_type": admission_type,
        "per_ticket_price": per_ticket_price,
        "total_tickets": total_tickets,
        "total_price": total_price,
        "total_price": transaction_id,
        "barcode": barcode,
        "wallet_amount": wallet_amount,
        "trans_amount": trans_amount,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
