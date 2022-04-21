import 'dart:convert';

CountryListModel countryListModelFromJson(String str) => CountryListModel.fromJson(json.decode(str));

String countryListModelToJson(CountryListModel data) => json.encode(data.toJson());

class CountryListModel {
  CountryListModel({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool? success;
  int? statusCode;
  String? message;
  List<CountryDatum>? data;

  factory CountryListModel.fromJson(Map<String, dynamic> json) => CountryListModel(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    data: List<CountryDatum>.from(json["data"].map((x) => CountryDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CountryDatum {
  CountryDatum({
    this.id,
    this.name,
    this.countryLogo,
    this.countryCode,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? name;
  String? countryLogo;
  String? countryCode;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory CountryDatum.fromJson(Map<String, dynamic> json) => CountryDatum(
    id: json["id"],
    name: json["name"],
    countryLogo: json["country_logo"],
    countryCode: json["country_code"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_logo": countryLogo,
    "country_code": countryCode,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
