// // To parse this JSON data, do
// //
// //     final incomeModelFromJson = incomeModelFromJsonFromJson(jsonString);

// import 'dart:convert';

// IncomeModelFromJson incomeModelFromJsonFromJson(String str) => IncomeModelFromJson.fromJson(json.decode(str));

// String incomeModelFromJsonToJson(IncomeModelFromJson data) => json.encode(data.toJson());

// class IncomeModelFromJson {
//     IncomeModelFromJson({
//        // this.id,
//         this.uId,
//         this.orderId,
//         this.payment,
//         this.address,
//         this.totalCollected,
//         this.income,
//        // this.date,
//     });

//     //String id;
//     String uId;
//     String orderId;
//     String payment;
//     String address;
//     String totalCollected;
//     String income;
//    // DateTime date;

//     factory IncomeModelFromJson.fromJson(Map<String, dynamic> json) => IncomeModelFromJson(
//       //  id: json["_id"],
//         uId: json["u_id"],
//         orderId: json["orderId"],
//         payment: json["payment"],
//         address: json["address"],
//         totalCollected: json["totalCollected"],
//         income: json["income"],
//        // date: DateTime.parse(json["date"]),
//     );

//     Map<String, dynamic> toJson() => {
//        // "_id": id,
//         "u_id": uId,
//         "orderId": orderId,
//         "payment": payment,
//         "address": address,
//         "totalCollected": totalCollected,
//         "income": income,
//       //  "date": date.toIso8601String(),
//     };
// }

// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

IncomeModelFromJson incomeModelFromJsonFromJson(String str) => IncomeModelFromJson.fromJson(json.decode(str));

String incomeModelToJson(IncomeModelFromJson data) => json.encode(data.toJson());

class IncomeModelFromJson {
    IncomeModelFromJson({
      this.id,
        this.uId,
        this.orderId,
        this.payment,
        this.address,
        this.totalCollected,
        this.income,
       this.date,

        //this.uId,
        // this.productId,
        // this.productName,
        // this.uniPrice,
        // this.quantity,
        // this.address,
        // this.mobileNumber,
        // this.customerName,
        // this.email,
        // this.total,
        // this.payment,
        // this.state,
        // this.shopId,
        // this.deliverPersonId,
        // this.orderId,
    });

String id;
    String uId;
    String orderId;
    String payment;
    String address;
    String totalCollected;
    String income;
   DateTime date;

    //String uId;
    // String productId;
    // String productName;
    // String uniPrice;
    // String quantity;
    // String address;
    // String mobileNumber;
    // String customerName;
    // String email;
    // String total;
    // String payment;
    // String state;
    // String shopId;
    // String deliverPersonId;
    // String orderId;

    factory IncomeModelFromJson.fromJson(Map<String, dynamic> json) => IncomeModelFromJson(
        id: json["_id"],
         uId: json["u_id"],
        orderId: json["orderId"],
        payment: json["payment"],
        address: json["address"],
        totalCollected: json["totalCollected"],
        income: json["income"],
        date: DateTime.parse(json["date"]),

       // uId: json["u_id"],
        // productId: json["productId"],
        // productName: json["productName"],
        // uniPrice: json["uniPrice"],
        // quantity: json["quantity"],
        // address: json["address"],
        // mobileNumber: json["mobileNumber"],
        // customerName: json["customerName"],
        // email: json["email"],
        // total: json["total"],
        // payment: json["payment"],
        // state: json["state"],
        // shopId: json["shopID"],
        // deliverPersonId: json["deliverPersonId"],
        // orderId: json["orderId"],
        
    );

    Map<String, dynamic> toJson() => {
 "_id": id,
         "u_id": uId,
       "orderId": orderId,
        "payment": payment,
        "address": address,
        "totalCollected": totalCollected,
        "income": income,
      "date": date.toIso8601String(),

       // "u_id": uId,
        // "productId": productId,
        // "productName": productName,
        // "uniPrice": uniPrice,
        // "quantity": quantity,
        // "address": address,
        // "mobileNumber": mobileNumber,
        // "customerName": customerName,
        // "email": email,
        // "total": total,
        // "payment": payment,
        // "state": state,
        // "shopID": shopId,
        // "deliverPersonId": deliverPersonId,
        // "orderId": orderId,
        
    };
}

