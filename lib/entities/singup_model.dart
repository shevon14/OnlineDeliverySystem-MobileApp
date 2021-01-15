// To parse this JSON data, do
//
//     final singupModel = singupModelFromJson(jsonString);

import 'dart:convert';

SingupModel singupModelFromJson(String str) => SingupModel.fromJson(json.decode(str));

String singupModelToJson(SingupModel data) => json.encode(data.toJson());

class SingupModel {
    SingupModel({
        this.fullName,
        this.email,
        this.drivingLicenceId,
        this.vehicaleType,
        this.vehicaleLicenceNumber,
        this.password,
        this.userType,
        this.conatct,
        this.address,
    });

    String fullName;
    String email;
    String drivingLicenceId;
    String vehicaleType;
    String vehicaleLicenceNumber;
    String password;
    String userType;
    String conatct;
    String address;

    factory SingupModel.fromJson(Map<String, dynamic> json) => SingupModel(
        fullName: json["full_name"],
        email: json["email"],
        drivingLicenceId: json["drivingLicenceId"],
        vehicaleType: json["vehicaleType"],
        vehicaleLicenceNumber: json["vehicaleLicenceNumber"],
        password: json["password"],
        userType: json["user_type"],
        conatct: json["conatct"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "drivingLicenceId": drivingLicenceId,
        "vehicaleType": vehicaleType,
        "vehicaleLicenceNumber": vehicaleLicenceNumber,
        "password": password,
        "user_type": userType,
        "conatct": conatct,
        "address": address,
    };
}
