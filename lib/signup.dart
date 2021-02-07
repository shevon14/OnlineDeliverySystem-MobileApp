import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/signin.dart';
import 'package:online_delivey_system_app/ui_curve_design.dart';
import 'apiUrl/api.dart';
import 'common/common_data.dart';
import 'entities/singup_model.dart';
import 'package:http/http.dart' as http;

import 'entities/userData_model.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomPadding: false, 
            body: GestureDetector(
                onTap: () {
                  // call this method here to hide soft keyboard
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: //CustomPaint(
                //  painter: CurvePainter(),
                //  child: //Stack(
                   // children: <Widget>[
                      
                     // Column(
                      //  mainAxisSize: MainAxisSize.max,
                      //  children: <Widget>[
                          SingleChildScrollView(
                            child: MyCustomForm(),
                          )
                     //   ],
                   //   )
                 //   ],
                //  ),
              //  )
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


  Future<bool> createSingup(SingupModel userData) async {
    final String apiUrl = deliversRegApi;
    
    final response = await http.post(apiUrl, body: {
      "full_name": userData.fullName,
      "email": userData.email,
      "drivingLicenceId": userData.drivingLicenceId,
      "vehicaleType": userData.vehicaleType,
      "vehicaleLicenceNumber": userData.vehicaleLicenceNumber,
      "password": userData.password,
      "user_type": userData.userType,
      "conatct": userData.conatct,
      "address": userData.address
    });

    if (response.statusCode == 200) {
      final String responseString = response.body;

      return true;
    } else {
      return null;
    }
  }

  


//Form and Validation part ekata
class MyCustomFormState extends State<MyCustomForm> {
  bool _singup=false;
  
    bool _login=false;

    Future<bool> createSingin(SingupModel userData) async {
    final String apiUrl = deliversLoginApi;
    final String apiUrl_1 = deliversLoginUserDataApi;
var singupModel = List<UserDataModel>();

    
    final response = await http.post(apiUrl, body: {
      "email": userData.email,//"qq@12.com",//
      "password": userData.password,
    });
    final response_1 = await http.get(apiUrl_1+userData.email);
    // userData.email);
    

    if (response.statusCode == 200) {
      final String responseString = response.body;
       if (response_1.statusCode == 200) {
      var notesJson = json.decode(response_1.body);
      singupModel.add(UserDataModel.fromJson(notesJson));
      userDetails = singupModel[0];
      print(userDetails);
      
      return true;
    }
    
     else {
      return false;
    }
  }
   if (response.statusCode == 401) {
     print(response.body.toString());
     tostTextLogin=response.body.toString();

 return false;
     }
 }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController dLicenceController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();
  final TextEditingController vehicleLicenceController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 40, 18, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "Welcome !!",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Container(
            child: Text(
              "Sign Up as a Deliver",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                controller: nameController, keyboardType: TextInputType.text,
                style: TextStyle(color: Theme.of(context).accentColor),
                decoration: InputDecoration(
                  hintText: "Name", 
                  hintStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
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
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                controller: emailController, keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Theme.of(context).accentColor),
                decoration: InputDecoration(
                  hintText: "Email Address",
                  hintStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.email,
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
                controller: contactController, keyboardType: TextInputType.number,
                style: TextStyle(color: Theme.of(context).accentColor),
                decoration: InputDecoration(
                  hintText: "Contact Number",
                  hintStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
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
                controller: dLicenceController, keyboardType: TextInputType.number,
                style: TextStyle(color: Theme.of(context).accentColor),
                decoration: InputDecoration(
                  hintText: "Driving Licence ID Number",
                  hintStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
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
          //       controller: vehicleController, keyboardType: TextInputType.text,
          //       style: TextStyle(color: Theme.of(context).accentColor),
          //       decoration: InputDecoration(
          //         hintText: "Vehicle Type",
          //         hintStyle: TextStyle(
          //             color: Colors.black, fontWeight: FontWeight.bold),
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
                controller: vehicleLicenceController, keyboardType: TextInputType.number,
                style: TextStyle(color: Theme.of(context).accentColor),
                decoration: InputDecoration(
                  hintText: "Vehicle Licence number",
                  hintStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
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
          SizedBox(
            height: 3,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
                controller: passwordController, keyboardType: TextInputType.visiblePassword, 
                style: TextStyle(color: Theme.of(context).accentColor),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.vpn_key,
                    color: Colors.blue,
                  ),
                ),
                obscureText: true,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInView()),
              );
            },
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Agree to all our ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                    text: "terms and contions",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ]),
            ),
          )),
          SizedBox(
            height: 5,
          ),
          ButtonTheme(
              minWidth: 200,
              height: 50,
              child: new RaisedButton(
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                color: Colors.blue,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () async {
                  var deliverPeson = SingupModel(
                    fullName: nameController.text,
                    email: emailController.text,
                    conatct: nameController.text,
                    drivingLicenceId: dLicenceController.text,
                    vehicaleType: vehicleController.text,
                    vehicaleLicenceNumber: vehicleLicenceController.text,
                    password: passwordController.text,
                    userType: "Deliver",
                    address: "ssssssssss",
                  );

                  final bool singup = await createSingup(deliverPeson);
                  final bool login = await createSingin(deliverPeson);
                  setState(() {
                    _singup = singup;
                    _login = login;
                  });

                  if(_singup){

                    if( _login){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInView()),
                  );
                  }
                  else{
                     final snackBar = SnackBar(content: Text( "User does not register pls try again...", textAlign: TextAlign.center,),
                backgroundColor: Colors.red,);
                Scaffold.of(context).showSnackBar(snackBar);
                  }
                  }
                  
                },
              )),
          SizedBox(
            height: 12,
          ),
          Container(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInView()),
              );
            },
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Already have an account? | ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 15),
                ),
                TextSpan(
                    text: "Sign In here",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w900,
                        fontSize: 15),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ]),
            ),
          )),
        ],
      ),
    );
  }
}
