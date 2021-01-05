import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/signup.dart';
import 'package:online_delivey_system_app/ui_curve_design.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
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
                child: CustomPaint(
                  painter: CurvePainter(),
                  child: Stack(
                    children: <Widget>[MyCustomForm()],
                  ),
                ))));
  }
}

//Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

//For the Form and Validation part
class MyCustomFormState extends State<MyCustomForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 50, 18, 0),
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
              "Sign In to Continue",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
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
            height: 15,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(),
              child: TextField(
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
                obscureText: false,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ButtonTheme(
              minWidth: 200,
              height: 50,
              child: new RaisedButton(
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                color: Colors.blue,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                },
              )),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Text(
              "Forgot Password?",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomePageDemo()),
              // );
            },
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Don't have an account? | ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 15),
                ),
                TextSpan(
                    text: "Sign Up here",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w900,
                        fontSize: 15),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpView()),
                  );
                    }),
              ]),
            ),
          )),
        ],
      ),
    );
  }
}
