// To parse this JSON data, do
//
//     final installedAppModel = installedAppModelFromJson(jsonString);

import 'dart:convert';

InstalledAppModel installedAppModelFromJson(String str) => InstalledAppModel.fromJson(json.decode(str));

String installedAppModelToJson(InstalledAppModel data) => json.encode(data.toJson());

class InstalledAppModel {
    InstalledAppModel({
        this.instagram,
        this.twitter,
        this.linkedin,
    });

    bool? instagram;
    bool? twitter;
    bool? linkedin;

    factory InstalledAppModel.fromJson(Map<String, dynamic> json) => InstalledAppModel(
        instagram: json["instagram"],
        twitter: json["twitter"],
        linkedin: json["linkedin"],
    );

    Map<String, dynamic> toJson() => {
        "instagram": instagram,
        "twitter": twitter,
        "linkedin": linkedin,
    };
}
