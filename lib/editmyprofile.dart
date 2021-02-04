import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/myprofileview.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            appBar: AppBar(
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

//Form and Validation part ekata
class MyCustomFormState extends State<MyCustomForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              //controller: nameController,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                hintText: "Name",
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
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              //controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                hintText: "Email Address",
                hintStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
          height: 10,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              //controller: contactController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                hintText: "Contact Number",
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
              //controller: dLicenceController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                hintText: "Driving Licence ID Number",
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
        SizedBox(
          height: 3,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              //controller: vehicleController,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                hintText: "Vehicle Type",
                hintStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 1.0)),
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
              //controller: vehicleLicenceController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                hintText: "Vehicle Licence number",
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
        SizedBox(
          height: 3,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              //controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
          height: 20,
        ),
        RaisedButton(
            padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
            color: Colors.grey[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(' Save ', style: TextStyle(color: Colors.blue)),
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfileView()),
              );
            })),
      ],
    );
  }
}
