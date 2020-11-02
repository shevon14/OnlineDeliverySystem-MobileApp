import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/Components/profile.dart';
import 'package:online_delivey_system_app/Components/Remaining_Nav.dart';
import 'package:online_delivey_system_app/Components/completed_orders_nav.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
            ),
            accountName: Text(
              "Sample Name",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            accountEmail: Text("samplegmail2020@gmail.com",
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
                CupertinoPageRoute(builder: (context) => profile()),
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
                CupertinoPageRoute(builder: (context) => cart()),
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
                CupertinoPageRoute(builder: (context) => comepleteOrders()),
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
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(builder: (context) => MyProfile()),
              // );
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
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(builder: (context) => MyProfile()),
              // );
            },
          ),
        ],
      ),
    );
  }
}
