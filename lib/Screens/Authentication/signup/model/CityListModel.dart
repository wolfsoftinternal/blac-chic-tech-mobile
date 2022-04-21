import 'dart:convert';

CityListModel cityListModelFromJson(String str) => CityListModel.fromJson(json.decode(str));

String cityListModelToJson(CityListModel data) => json.encode(data.toJson());

class CityListModel {
  CityListModel({
     this.success,
     this.statusCode,
     this.message,
     this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<CityDatum>? data;

  factory CityListModel.fromJson(Map<String, dynamic> json) => CityListModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: List<CityDatum>.from(json["data"].map((x) => CityDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CityDatum {
  CityDatum({
     this.id,
     this.stateId,
     this.countryId,
     this.name,
     this.status,
     this.createdAt,
     this.updatedAt,
    this.deletedAt,
  });

  int? id;
  int? stateId;
  int? countryId;
  String? name;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory CityDatum.fromJson(Map<String, dynamic> json) => CityDatum(
    id: json["id"]??0,
    stateId: json["state_id"]??0,
    countryId: json["country_id"]??0,
    name: json["name"]??"",
    status: json["status"]??"",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "state_id": stateId,
    "country_id": countryId,
    "name": name,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
