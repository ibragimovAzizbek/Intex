// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<ProductsModel> productsFromJson(String str) => List<ProductsModel>.from(
    json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
    this.id,
    this.oldPrice,
    this.newPrice,
    this.size,
    this.depth,
    this.count,
    this.frameUz,
    this.frameRu,
    this.equipmentUz,
    this.equipmentRu,
    this.image,
    this.statusUz,
    this.statusRu,
    this.categoryId,
  });

  int? id;
  int? oldPrice;
  int? newPrice;
  String? size;
  int? depth;
  int? count;
  String? frameUz;
  String? frameRu;
  String? equipmentUz;
  String? equipmentRu;
  String? image;
  String? statusUz;
  String? statusRu;
  int? categoryId;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        oldPrice: json["old_price"],
        newPrice: json["new_price"],
        size: json["size"],
        depth: json["depth"],
        count: json["count"],
        frameUz: json["frame_uz"],
        frameRu: json["frame_ru"],
        equipmentUz: json["equipment_uz"],
        equipmentRu: json["equipment_ru"],
        image: json["image"],
        statusUz: json["status_uz"],
        statusRu: json["status_ru"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "old_price": oldPrice,
        "new_price": newPrice,
        "size": size,
        "depth": depth,
        "count": count,
        "frame_uz": frameUz,
        "frame_ru": frameRu,
        "equipment_uz": equipmentUz,
        "equipment_ru": equipmentRu,
        "image": image,
        "status_uz": statusUz,
        "status_ru": statusRu,
        "category_id": categoryId,
      };
}
