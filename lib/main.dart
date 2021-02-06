import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/signin.dart';
import 'package:online_delivey_system_app/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(primaryColor: Colors.deepOrange[900]),
        home: HomeController(),
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
              return MaterialApp(home : HomeView());
            }
        }
        return MaterialApp(home: SignInView());
      });
  }
}

