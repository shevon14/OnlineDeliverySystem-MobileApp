import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/myprofileview.dart';

import 'apiUrl/api.dart';
import 'common/common_data.dart';
import 'entities/singup_model.dart';
import 'package:http/http.dart' as http;

import 'entities/userData_model.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.keyboard_backspace), 
              onPressed: (){
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProfileView()),
                          );
              } ),
              title: Text('Edit Profile'),
              backgroundColor: Colors.blue,
            ),
            body: GestureDetector(
              onTap: () {
                // call this method here to hide soft keyboard
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: SingleChildScrollView(child: MyCustomForm()),
            )));
  }
}

//Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyProfileData {
  Map fetched_data = {
    "Name": userDetails.fullName,
    "Email": userDetails.email,
    "Conatact": userDetails.conatct,
    "DrivingLicencesID": userDetails.drivingLicenceId,
    "VehicleType": userDetails.vehicaleType,
    "VehicleNo": userDetails.vehicaleLicenceNumber,
  };

//function to fetch the data
  String getName() {
    return fetched_data["Name"];
  }

  String getEmail() {
    return fetched_data["Email"];
  }

  String getConatact() {
    return fetched_data["Conatact"];
  }

  String getDrivingLicencesID() {
    return fetched_data["DrivingLicencesID"];
  }

  String getVehicleType() {
    return fetched_data["VehicleType"];
  }

  String getVehicleNo() {
    return fetched_data["VehicleNo"];
  }
}

//Form and Validation part ekata
class MyCustomFormState extends State<MyCustomForm> {
  SingupModel _singup;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController dLicenceController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();
  final TextEditingController vehicleLicenceController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


       Future<SingupModel> updateProfile(SingupModel userData) async {
    final String apiUrl = updateProfileData;
    final response = await http.post(apiUrl + userDetails.id, body: {
      "full_name": userData.fullName,
      "email": userData.email,
      "drivingLicenceId": userData.drivingLicenceId,
      "vehicaleType": userData.vehicaleType,
      "vehicaleLicenceNumber": userData.vehicaleLicenceNumber,
      //"password": userData.password,
      "user_type": userData.userType,
      "conatct": userData.conatct,
      "address": userData.address
    });
    

    if (response.statusCode == 200) {
     final String responseString = response.body;
     final bool singup1 = await updateSingupData(userData);

      return singupModelFromJson(responseString);
    } else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                hintText: 'Name : ' + MyProfileData().getName(),
                hintStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 1.0)),
                prefixIcon: const Icon(
                  Icons.people,
                  color: Colors.blue,
                ),
              ),
              obscureText: false,
            ),
          ),
        ),
        SizedBox(height: 3),
        // Container(
        //   child: Padding(
        //     padding: EdgeInsets.only(),
        //     child: TextField(
        //       controller: emailController,
        //       keyboardType: TextInputType.emailAddress,
        //       style: TextStyle(color: Theme.of(context).accentColor),
        //       decoration: InputDecoration(
        //         hintText: "Email Address",
        //         hintStyle:
        //             TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        //         enabledBorder: UnderlineInputBorder(
        //             borderSide: BorderSide(
        //                 color: Theme.of(context).accentColor, width: 1.0)),
        //         focusedBorder: UnderlineInputBorder(
        //             borderSide: BorderSide(
        //                 color: Theme.of(context).accentColor, width: 1.0)),
        //         prefixIcon: const Icon(
        //           Icons.email,
        //           color: Colors.blue,
        //         ),
        //       ),
        //       obscureText: false,
        //     ),
        //   ),
        // ),
        // SizedBox(
        //   height: 10,
        // ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              controller: contactController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                hintText: 'Contact : ' + MyProfileData().getConatact(),
                hintStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 1.0)),
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
              ),
              obscureText: false,
            ),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              controller: dLicenceController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                hintText: 'Licence No : '+ MyProfileData().getDrivingLicencesID(),
                hintStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 1.0)),
                prefixIcon: const Icon(
                  Icons.confirmation_number,
                  color: Colors.blue,
                ),
              ),
              obscureText: false,
            ),
          ),
        ),
        // SizedBox(
        //   height: 3,
        // ),
        // Container(
        //   child: Padding(
        //     padding: EdgeInsets.only(),
        //     child: TextField(
        //       controller: vehicleController,
        //       keyboardType: TextInputType.text,
        //       style: TextStyle(color: Theme.of(context).accentColor),
        //       decoration: InputDecoration(
        //         hintText: MyProfileData().getVehicleType(),
        //         hintStyle:
        //             TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        //         enabledBorder: UnderlineInputBorder(
        //             borderSide: BorderSide(
        //                 color: Theme.of(context).accentColor, width: 1.0)),
        //         focusedBorder: UnderlineInputBorder(
        //             borderSide: BorderSide(
        //                 color: Theme.of(context).accentColor, width: 1.0)),
        //         prefixIcon: const Icon(
        //           Icons.local_shipping,
        //           color: Colors.blue,
        //         ),
        //       ),
        //       obscureText: false,
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 3,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              controller: vehicleLicenceController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                hintText: 'Vehicle No : '+ MyProfileData().getVehicleNo(),
                hintStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 1.0)),
                prefixIcon: const Icon(
                  Icons.reorder,
                  color: Colors.blue,
                ),
              ),
              obscureText: false,
            ),
          ),
        ),
        // SizedBox(
        //   height: 3,
        // ),
        // Container(
        //   child: Padding(
        //     padding: EdgeInsets.only(),
        //     child: TextField(
        //       controller: passwordController,
        //       keyboardType: TextInputType.visiblePassword,
        //       style: TextStyle(color: Theme.of(context).accentColor),
        //       decoration: InputDecoration(
        //         hintText: "Password",
        //         hintStyle:
        //             TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        //         enabledBorder: UnderlineInputBorder(
        //             borderSide: BorderSide(
        //                 color: Theme.of(context).accentColor, width: 1.0)),
        //         focusedBorder: UnderlineInputBorder(
        //             borderSide: BorderSide(
        //                 color: Theme.of(context).accentColor, width: 1.0)),
        //         prefixIcon: const Icon(
        //           Icons.vpn_key,
        //           color: Colors.blue,
        //         ),
        //       ),
        //       obscureText: true,
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
            padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
            color: Colors.grey[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(' Save ', style: TextStyle(color: Colors.blue)),
            onPressed: (() async {
                  var deliverPeson = SingupModel(
                    fullName: nameController.text==""?userDetails.fullName:nameController.text,
                    email: emailController.text==""?userDetails.email:emailController.text,
                    conatct:  contactController.text ==""?userDetails.conatct:contactController.text,
                    drivingLicenceId: dLicenceController.text==""?userDetails.drivingLicenceId:dLicenceController.text,
                    vehicaleType: vehicleController.text==""?userDetails.vehicaleType:vehicleController.text,
                    vehicaleLicenceNumber: vehicleLicenceController.text==""?userDetails.vehicaleLicenceNumber:vehicleLicenceController.text,
                   // password: passwordController.text,
                    userType: "Deliver",
                    address: "ssssssssss",
                  );

                  final SingupModel singup = await updateProfile(deliverPeson);
                  
                  setState(() {
                    _singup = singup;
                  }); 
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyProfileView()), (route) => false,
              );
            })),
      ],
    );
  }
}

 Future<bool> updateSingupData(SingupModel userData) async {
    final String apiUrl_1 = deliversLoginUserDataApi;
var singupModel = List<UserDataModel>();

    bool login=false;

    final response_1 = await http.get(apiUrl_1+userDetails.email);

       if (response_1.statusCode == 200) {
      var notesJson = json.decode(response_1.body);
      singupModel.add(UserDataModel.fromJson(notesJson));
      userDetails = singupModel[0];
      print(userDetails);
      return true;
    } else {
      return null;
    }
  }

