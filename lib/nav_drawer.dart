import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/aboutus.dart';
import 'package:online_delivey_system_app/completeordershistory.dart';
import 'package:online_delivey_system_app/myearnigs.dart';
import 'package:online_delivey_system_app/myorders.dart';
import 'package:online_delivey_system_app/myprofileview.dart';
import 'package:online_delivey_system_app/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/common_data.dart';
import 'entities/userData_model.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class MyDrawerDetails {
  Map fetched_data = {
    "Name": userDetails.fullName==null?"": userDetails.fullName,
    "Email": userDetails.email==null?"":userDetails.email,
  };

//function to fetch the data
  String getName() {
    return fetched_data["Name"];
  }

  String getEmail() {
    return fetched_data["Email"];
  }
}

class _NavDrawerState extends State<NavDrawer> {
  //  UserDataModel userDetails1 =new UserDataModel();
  //  userDetails1=userDetails;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50,),
            ),
            accountName: Text(
              MyDrawerDetails().getName(),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            accountEmail: Text(MyDrawerDetails().getEmail(),
                style: TextStyle(color: Colors.black)),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.blue[300],
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black54,
            ),
            title: Text('My Profile',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfileView()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.local_shipping,
              color: Colors.blue[300],
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black54,
            ),
            title: Text('Remaining Orders',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyOrdersView()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.history,
              color: Colors.blue[300],
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black54,
            ),
            title: Text('Completed Orders',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CompleteOrderHistoryView()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_balance_wallet,
              color: Colors.blue[300],
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black54,
            ),
            title: Text('My Earnings',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CashMangementView()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.blue[300],
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black54,
            ),
            title: Text('About',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => AboutUS()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.transit_enterexit,
              color: Colors.blue[300],
            ),
            trailing: Icon(
              Icons.arrow_right,
              color: Colors.black54,
            ),
            title: Text('Log Out',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            onTap: ()  async{
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('isLogIn');
               prefs.setString('isLogIn','');
              Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => SignInView()), (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
