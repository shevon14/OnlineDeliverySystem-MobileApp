import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';

class AboutUS extends StatefulWidget {
  @override
  _AboutUSState createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.keyboard_backspace), 
              onPressed: (){
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeView()),
                          );
              } ),
        iconTheme: new IconThemeData(color: Colors.white),
        titleSpacing: -10,
        title: Text('About Us',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Center(
            child:  Image(
            image: new AssetImage('assets/splashcover.gif'),
            height: 200,),
          ),
          Center(
            child: Padding(padding: EdgeInsets.all(15),
            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic), textAlign: TextAlign.center,),
          )
          )
        ],
      ),
    ));
  }
}
