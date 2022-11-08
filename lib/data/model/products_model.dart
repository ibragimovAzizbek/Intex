// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    this.result,
    this.totalPages,
    this.page,
    this.totalCount,
  });

  List<Result>? result;
  int? totalPages;
  int? page;
  List<TotalCount>? totalCount;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        page: json["page"],
        totalCount: List<TotalCount>.from(
            json["total_count"].map((x) => TotalCount.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "page": page,
        "total_count": List<dynamic>.from(totalCount!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.nameUz,
    this.nameRu,
    this.nameEn,
    this.price,
    this.discountPrice,
    this.aboutUz,
    this.aboutRu,
    this.aboutEn,
    this.image,
    this.countryId,
    this.attributeId,
    this.categoryId,
    this.countryUz,
    this.countryRu,
    this.countryEn,
    this.attributes,
  });

  int? id;
  String? nameUz;
  String? nameRu;
  String? nameEn;
  int? price;
  int? discountPrice;
  String? aboutUz;
  String? aboutRu;
  String? aboutEn;
  List<String>? image;
  int? countryId;
  List<int>? attributeId;
  int? categoryId;
  String? countryUz;
  String? countryRu;
  String? countryEn;
  List<Attribute>? attributes;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        nameUz: json["name_uz"],
        nameRu: json["name_ru"],
        nameEn: json["name_en"],
        price: json["price"],
        discountPrice: json["discount_price"],
        aboutUz: json["about_uz"],
        aboutRu: json["about_ru"],
        aboutEn: json["about_en"],
        image: List<String>.from(json["image"].map((x) => x)),
        countryId: json["country_id"],
        attributeId: List<int>.from(json["attribute_id"].map((x) => x)),
        categoryId: json["category_id"],
        countryUz: json["country_uz"],
        countryRu: json["country_ru"],
        countryEn: json["country_en"],
        attributes: json["attributes"] == null
            ? null
            : List<Attribute>.from(
                json["attributes"].map((x) => Attribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_uz": nameUz,
        "name_ru": nameRu,
        "name_en": nameEn,
        "price": price,
        "discount_price": discountPrice,
        "about_uz": aboutUz,
        "about_ru": aboutRu,
        "about_en": aboutEn,
        "image": List<dynamic>.from(image!.map((x) => x)),
        "country_id": countryId,
        "attribute_id": List<dynamic>.from(attributeId!.map((x) => x)),
        "category_id": categoryId,
        "country_uz": countryUz,
        "country_ru": countryRu,
        "country_en": countryEn,
        "attributes": attributes == null
            ? null
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
      };
}

class Attribute {
  Attribute({
    this.id,
    this.attributeUz,
    this.attributeRu,
    this.attributeEn,
    this.view,
    this.attributeId,
    this.subAttributes,
  });

  int? id;
  String? attributeUz;
  String? attributeRu;
  String? attributeEn;
  String? view;
  dynamic? attributeId;
  List<dynamic>? subAttributes;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        attributeUz: json["attribute_uz"],
        attributeRu: json["attribute_ru"],
        attributeEn: json["attribute_en"],
        view: json["view"],
        attributeId: json["attribute_id"],
        subAttributes: json["sub_attributes"] == null
            ? null
            : List<dynamic>.from(json["sub_attributes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attribute_uz": attributeUz,
        "attribute_ru": attributeRu,
        "attribute_en": attributeEn,
        "view": view,
        "attribute_id": attributeId,
        "sub_attributes": subAttributes == null
            ? null
            : List<dynamic>.from(subAttributes!.map((x) => x)),
      };
}

class TotalCount {
  TotalCount({
    this.count,
  });

  String? count;

  factory TotalCount.fromJson(Map<String, dynamic> json) => TotalCount(
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
      };
}
