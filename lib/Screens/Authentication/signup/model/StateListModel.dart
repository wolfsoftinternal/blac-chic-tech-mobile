
import 'dart:convert';

StateListModel stateListModelFromJson(String str) => StateListModel.fromJson(json.decode(str));

String stateListModelToJson(StateListModel data) => json.encode(data.toJson());

class StateListModel {
  StateListModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<StateDatum>? data;

  factory StateListModel.fromJson(Map<String, dynamic> json) => StateListModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: List<StateDatum>.from(json["data"].map((x) => StateDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class StateDatum {
  StateDatum({
    this.id,
    this.name,
    this.countryId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? name;
  int? countryId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory StateDatum.fromJson(Map<String, dynamic> json) => StateDatum(
    id: json["id"],
    name: json["name"],
    countryId: json["country_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_id": countryId,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
