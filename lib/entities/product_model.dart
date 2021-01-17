// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        this.id,
        this.productName,
        this.uniPrice,
        this.availableQuantity,
        this.category,
        this.imgName,
        this.shopName,
        this.shopId,
    });

    String id;
    String productName;
    String uniPrice;
    String availableQuantity;
    String category;
    String imgName;
    String shopName;
    String shopId;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        productName: json["productName"],
        uniPrice: json["uniPrice"],
        availableQuantity: json["availableQuantity"],
        category: json["category"],
        imgName: json["imgName"],
        shopName: json["shopName"],
        shopId: json["shopID"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "productName": productName,
        "uniPrice": uniPrice,
        "availableQuantity": availableQuantity,
        "category": category,
        "imgName": imgName,
        "shopName": shopName,
        "shopID": shopId,
    };
}
