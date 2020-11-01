import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/signin.dart';
import 'package:online_delivey_system_app/ui_curve_design.dart';

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
              },   child: CustomPaint(
                painter: CurvePainter(),
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                           SingleChildScrollView(
                      child: MyCustomForm(),
                    )
                      ],
                    )
                   
                  ],
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

//Form and Validation part ekata
class MyCustomFormState extends State<MyCustomForm> {
 @override
  Widget build(BuildContext context) {
    return Container(
          padding:EdgeInsets.fromLTRB(18, 40, 18, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
                Text("Welcome !!",  textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),),

                Container(
                  child: Text("Sign Up as a Deliver", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),),
                ),
                
                SizedBox(
                  height: 10,
                ),

                Container(
                  child: Padding(
                    padding: EdgeInsets.only(),
                    child: TextField(
                      style: TextStyle(color: Theme
                          .of(context)
                          .accentColor),
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
                        prefixIcon: const Icon(
                          Icons.people,
                          color: Colors.blue,
                        ),
                      ),
                      obscureText: false,
                    ),
                  ),
                ),

                SizedBox(
                  height: 3
                ),

                Container(
                  child: Padding(
                    padding: EdgeInsets.only(),
                    child: TextField(
                      style: TextStyle(color: Theme
                          .of(context)
                          .accentColor),
                      decoration: InputDecoration(
                        hintText: "Email Address",
                        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
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
                      style: TextStyle(color: Theme
                          .of(context)
                          .accentColor),
                      decoration: InputDecoration(
                        hintText: "Contact Number",
                        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
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
                      style: TextStyle(color: Theme
                          .of(context)
                          .accentColor),
                      decoration: InputDecoration(
                        hintText: "Driving Licence ID Number",
                        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
                        prefixIcon: const Icon(
                          Icons.confirmation_number,
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
                      style: TextStyle(color: Theme
                          .of(context)
                          .accentColor),
                      decoration: InputDecoration(
                        hintText: "Vehicle Type",
                        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
                        prefixIcon: const Icon(
                          Icons.local_shipping,
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
                      style: TextStyle(color: Theme
                          .of(context)
                          .accentColor),
                      decoration: InputDecoration(
                        hintText: "Vehicle Licence number",
                        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
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
                      style: TextStyle(color: Theme
                          .of(context)
                          .accentColor),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .accentColor, width: 1.0)),
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

                Container(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInView()),
                          );
                    },
                    child:  RichText(text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "Agree to all our ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,), ),
                      TextSpan(text: "terms and contions", 
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                      recognizer: TapGestureRecognizer()
                      ..onTap = () { } ),
                    ]
                  ),
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
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18),
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
                  height: 12,
                ),

                Container(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInView()),
                          );
                    },
                    child:  RichText(text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "Already have an account? | ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 15), ),
                      TextSpan(text: "Sign In here" , 
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900, fontSize: 15),
                      recognizer: TapGestureRecognizer()
                      ..onTap = () { } ),
                    ]
                  ),
                  ),
                )),
                
            ],
          ),
        );
       }
    }