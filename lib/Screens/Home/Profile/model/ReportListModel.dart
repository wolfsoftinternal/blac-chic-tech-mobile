// To parse this JSON data, do
//
//     final reportListModel = reportListModelFromJson(jsonString);

import 'dart:convert';

ReportListModel reportListModelFromJson(String str) => ReportListModel.fromJson(json.decode(str));

String reportListModelToJson(ReportListModel data) => json.encode(data.toJson());

class ReportListModel {
    ReportListModel({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    bool? success;
    int? statusCode;
    String? message;
    List<ReportList>? data;

    factory ReportListModel.fromJson(Map<String, dynamic> json) => ReportListModel(
        success: json["success"],
        statusCode: json["status_code"],
        message: json["message"],
        data: List<ReportList>.from(json["data"].map((x) => ReportList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ReportList {
    ReportList({
        this.id,
        this.title,
    });

    int? id;
    String? title;

    factory ReportList.fromJson(Map<String, dynamic> json) => ReportList(
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
    };
}
