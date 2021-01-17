// To parse this JSON data, do
//
//     final sellerModel = sellerModelFromJson(jsonString);

import 'dart:convert';

SellerModel sellerModelFromJson(String str) => SellerModel.fromJson(json.decode(str));

String sellerModelToJson(SellerModel data) => json.encode(data.toJson());

class SellerModel {
    SellerModel({
        this.id,
        this.businessModel,
        this.name,
        this.shopName,
        this.businessId,
        this.address,
        this.personalPhone,
        this.officePhone,
        this.email,
        this.password,
    });

    String id;
    String businessModel;
    String name;
    String shopName;
    String businessId;
    String address;
    String personalPhone;
    String officePhone;
    String email;
    String password;

    factory SellerModel.fromJson(Map<String, dynamic> json) => SellerModel(
        id: json["_id"],
        businessModel: json["businessModel"],
        name: json["name"],
        shopName: json["shopName"],
        businessId: json["businessID"],
        address: json["address"],
        personalPhone: json["personalPhone"],
        officePhone: json["officePhone"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "businessModel": businessModel,
        "name": name,
        "shopName": shopName,
        "businessID": businessId,
        "address": address,
        "personalPhone": personalPhone,
        "officePhone": officePhone,
        "email": email,
        "password": password,
    };
}
