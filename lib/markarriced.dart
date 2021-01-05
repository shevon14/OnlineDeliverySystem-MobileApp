import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';
import 'package:online_delivey_system_app/ordercompleted.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkArrivedView extends StatefulWidget {
  @override
  _MarkArrivedViewState createState() => _MarkArrivedViewState();
}

class _MarkArrivedViewState extends State<MarkArrivedView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(primaryColor: Color(0xFF4A184C)),
        home: Scaffold(
            drawer: NavDrawer(),
            appBar: AppBar(
              iconTheme: new IconThemeData(color: Colors.white),
              titleSpacing: -10,
              title: Text('Ideal Store',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: Colors.blue,
            ),
            body: SafeArea(
                child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                    child: Column(children: <Widget>[
                  Card(
                      child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                              
                              children: <Widget>[
                                Icon(
                                  Icons.fastfood,
                                  color: Colors.blue,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("#15401006",
                                        style: TextStyle(
                                            color: Colors.indigo[900],
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18)),
                                    Text("Cash On Delivery",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16)),
                                  ],
                                ),
                              ]))),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Order Content -",
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.w800,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        //build list view
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return
                                  //listview card
                                  Card(
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: <Widget>[
                                      //item image
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: DecoratedBox(
                                          // child: Image.network(
                                          //   "https://cdn.cnn.com/cnnnext/dam/assets/181010131059-australia-best-beaches-cossies-beach-cocos3.jpg",
                                          //   width: 100,
                                          //   height: 100,
                                          //   fit: BoxFit.cover,
                                          // ),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.all(5)),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Item Name ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Quantity",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800)),
                                        ],
                                      ),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          //item name
                                          Text(" : T-Shirt",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //item quantity
                                          Text(" : 2",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Total Amount  - Rs.3500.00/=",
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.w800,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Your Earnings - Rs.300.00/=",
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.w800,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  )
                ])),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                        color: Colors.blue,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: new RaisedButton(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text('Collect',
                                                style: TextStyle(
                                                    color: Colors.indigo[900],
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: (() {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OrderCompletedView()),
                                              );
                                            })),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10)),
                                      SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: new RaisedButton(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text('Cancel',
                                                style: TextStyle(
                                                    color: Colors.indigo[900],
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: (() {
                                              
                                            })),
                                      )
                                    ],
                                  ),
                                ]))))
              ],
            ))));
  }
}
