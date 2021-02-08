import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/signin.dart';
import 'package:online_delivey_system_app/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'package:splashscreen/splashscreen.dart';

import 'apiUrl/api.dart';
import 'common/common_data.dart';
import 'entities/singup_model.dart';
import 'entities/userData_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(primaryColor: Colors.deepOrange[900]),
        home: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: HomeController(),
          title: Text("Welcome!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),),
          image: Image(image: new AssetImage('assets/splashcover.gif')),
          useLoader: false,
          photoSize: 100,
          loaderColor: Colors.blue,
        ), 
        
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeController(),
        },
    );
  }
}


// ignore: must_be_immutable
class HomeController extends StatelessWidget {

  // String isSignIn;

  // getid() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //     isSignIn = prefs.getString('isLogIn');
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs){
        var x = prefs.data;
        if(prefs.hasData){
            if(x.getString('isLogIn') == 'Yes'){
               var userDetailsEmail=x.getString('userEmail').toString();
                 loadSingup(userDetailsEmail);

              // final String apiUrl_1 = deliversLoginUserDataApi;
              // var singupModel = List<UserDataModel>();
             
              //  final response_1 =  http.get(apiUrl_1+userDetailsEmail);
              //     if (response_1.statusCode == 200) {
      // var notesJson = json.decode(response_1.body);
      // singupModel.add(UserDataModel.fromJson(notesJson));
      // userDetails = singupModel[0];


              return MaterialApp(home : HomeView());
                //  }
            }
        }
        return MaterialApp(home: SignInView());
      });
  }
}

 Future<bool> loadSingup(userData) async {
    final String apiUrl_1 = deliversLoginUserDataApi;
var singupModel = List<UserDataModel>();

    bool login=false;
    
    final response_1 = await http.get(apiUrl_1+ userData);
    // userData.email);
    

    
      
       if (response_1.statusCode == 200) {
         login=true;
      var notesJson = json.decode(response_1.body);
      singupModel.add(UserDataModel.fromJson(notesJson));
      userDetails = singupModel[0];
      print(userDetails);
      
      return true;
    } else {
      return null;
    }
 }
