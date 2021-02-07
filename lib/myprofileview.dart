import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/editmyprofile.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';

import 'common/common_data.dart';

class MyProfileView extends StatefulWidget {
  @override
  _MyProfileViewState createState() => _MyProfileViewState();
}

//array details for order complete - modelen ekan details aran danna click kalma id ekata
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

class _MyProfileViewState extends State<MyProfileView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            drawer: NavDrawer(),
            appBar: AppBar(
              iconTheme: new IconThemeData(color: Colors.white),
              titleSpacing: -5,
              title: Text('My Profile',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: Colors.blue,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(3),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        title: Text(
                          "Full Name: " + MyProfileData().getName(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Email: " + MyProfileData().getEmail(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Contact: " + MyProfileData().getConatact(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Licence ID: " +
                              MyProfileData().getDrivingLicencesID(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    // Card(
                    //   child: ListTile(
                    //     title: Text(
                    //       "Vehicle Type: " + MyProfileData().getVehicleType(),
                    //       style: TextStyle(
                    //           fontSize: 15,
                    //           color: Colors.black,
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //   ),
                    // ),
                    Card(
                      child: ListTile(
                        title: Text(
                          "Vehicle No: " + MyProfileData().getVehicleNo(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(' Edit Details ',
                            style: TextStyle(color: Colors.blue)),
                        onPressed: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()),
                          );
                        })),
                  ],
                ),
              ),
            )));
  }
}
