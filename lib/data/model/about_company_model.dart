// To parse this JSON data, do
//
//     final aboutCompanyModel = aboutCompanyModelFromJson(jsonString);

import 'dart:convert';

AboutCompanyModel aboutCompanyModelFromJson(String str) => AboutCompanyModel.fromJson(json.decode(str));

String aboutCompanyModelToJson(AboutCompanyModel data) => json.encode(data.toJson());

class AboutCompanyModel {
    AboutCompanyModel({
        this.sites,
    });

    List<Site>? sites;

    factory AboutCompanyModel.fromJson(Map<String, dynamic> json) => AboutCompanyModel(
        sites: List<Site>.from(json["sites"].map((x) => Site.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sites": List<dynamic>.from(sites!.map((x) => x.toJson())),
    };
}

class Site {
    Site({
        this.id,
        this.phone,
        this.addressRu,
        this.addressUz,
        this.workUz,
        this.workRu,
        this.telegram,
        this.instagram,
    });

    int? id;
    String? phone;
    String? addressRu;
    String? addressUz;
    String? workUz;
    String? workRu;
    String? telegram;
    String? instagram;

    factory Site.fromJson(Map<String, dynamic> json) => Site(
        id: json["id"],
        phone: json["phone"],
        addressRu: json["address_ru"],
        addressUz: json["address_uz"],
        workUz: json["work_uz"],
        workRu: json["work_ru"],
        telegram: json["telegram"],
        instagram: json["instagram"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "address_ru": addressRu,
        "address_uz": addressUz,
        "work_uz": workUz,
        "work_ru": workRu,
        "telegram": telegram,
        "instagram": instagram,
    };
}
