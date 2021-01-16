import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';

class MyProfileView extends StatefulWidget {
  @override
  _MyProfileViewState createState() => _MyProfileViewState();
}

//array details for order complete - modelen ekan details aran danna click kalma id ekata
class MyProfileData {
  Map fetched_data = {
    "Name": "sample",
    "Email": "sample@gamil.cm",
    "Conatact": "076664544",
    "DrivingLicencesID": "g123456",
    "VehicleType": "Car",
    "VehicleNo": "WP-4523",
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
                          "Licence ID: " + MyProfileData().getDrivingLicencesID(),
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
                          "Vehicle Type: " + MyProfileData().getVehicleType(),
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
                          "Vehicle No: " + MyProfileData().getVehicleNo(),
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
