import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/myorderdetails.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';
import 'package:online_delivey_system_app/pickupdetail.dart';

class MyOrdersView extends StatefulWidget {
  @override
  _MyOrdersViewState createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        titleSpacing: -10,
        title: Text('Ideal Store',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                            width: 150,
                            child: new RaisedButton(
                                color: Colors.grey[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('Order Pickups',
                                    style: TextStyle(color: Colors.grey)),
                                onPressed: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeView()),
                                  );
                                })),
                          ),
                          SizedBox(
                              height: 50,
                              width: 150,
                              child: new RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('My Orders',
                                    style: TextStyle(
                                        color: Colors.indigo[900],
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {},
                              )),
                        ],
                      ),
                    ])),
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[300],
              height: 20,
            ),
            Card(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.fastfood,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("#1023A1",
                            style: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.w900,
                                fontSize: 20)),
                        Text("No.5, Second Lane, Main Road, Negombo",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Colors.white10,
                          child: InkWell(
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.blue,
                              size: 30,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyOrderDetailView()),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Card(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.fastfood,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("#1023A1",
                            style: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.w900,
                                fontSize: 20)),
                        Text("No.5, Second Lane, Main Road, Negombo",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Colors.white10,
                          child: InkWell(
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.blue,
                              size: 30,
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
