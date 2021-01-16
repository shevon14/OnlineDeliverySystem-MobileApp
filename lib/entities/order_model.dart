// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    OrderModel({
        this.uId,
        this.productId,
        this.productName,
        this.uniPrice,
        this.quantity,
        this.address,
        this.mobileNumber,
        this.customerName,
        this.email,
        this.total,
        this.payment,
        this.state,
        this.shopId,
        this.deliverPersonId,
        this.orderId,
    });

    String uId;
    String productId;
    String productName;
    String uniPrice;
    String quantity;
    String address;
    String mobileNumber;
    String customerName;
    String email;
    String total;
    String payment;
    String state;
    String shopId;
    String deliverPersonId;
    String orderId;

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        uId: json["u_id"],
        productId: json["productId"],
        productName: json["productName"],
        uniPrice: json["uniPrice"],
        quantity: json["quantity"],
        address: json["address"],
        mobileNumber: json["mobileNumber"],
        customerName: json["customerName"],
        email: json["email"],
        total: json["total"],
        payment: json["payment"],
        state: json["state"],
        shopId: json["shopID"],
        deliverPersonId: json["deliverPersonId"],
        orderId: json["orderId"],
        
    );

    Map<String, dynamic> toJson() => {
        "u_id": uId,
        "productId": productId,
        "productName": productName,
        "uniPrice": uniPrice,
        "quantity": quantity,
        "address": address,
        "mobileNumber": mobileNumber,
        "customerName": customerName,
        "email": email,
        "total": total,
        "payment": payment,
        "state": state,
        "shopID": shopId,
        "deliverPersonId": deliverPersonId,
        "orderId": orderId,
        
    };
}
