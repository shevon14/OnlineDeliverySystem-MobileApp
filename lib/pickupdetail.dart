import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class PickUpDetailView extends StatefulWidget {
  @override
  _PickUpDetailViewState createState() => _PickUpDetailViewState();
}

void customLaunch(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    print("could not launch $command");
  }
}

class _PickUpDetailViewState extends State<PickUpDetailView> {
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
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.supervisor_account,
                            size: 25, color: Colors.indigo[900]),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Seller",
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.w800,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Card(
                      child: Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text("Supplier name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                              trailing: Icon(
                                Icons.account_circle,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            ListTile(
                              title: Text(
                                  "N0.36, Second Lane ,Main Road, Colombo 04",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                              trailing: InkWell(
                                child: Icon(
                                  Icons.directions,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                                onTap: () {
                                  MapsLauncher.launchQuery('Colombo');
                                },
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            ListTile(
                                title: Text("Contact Supplier",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    InkWell(
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                      onTap: () {
                                        customLaunch('tel: 123');
                                      },
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    InkWell(
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                      onTap: () {
                                        customLaunch('sms: 123');
                                      },
                                    ),
                                  ],
                                )),
                          ],
                        )),
                  ])),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.supervisor_account,
                            size: 25, color: Colors.indigo[900]),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Customer",
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontWeight: FontWeight.w800,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Card(
                      child: Column(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text("Customer name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                              trailing: Icon(
                                Icons.account_circle,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            ListTile(
                              title: Text(
                                  "N0.36, Second Lane ,Main Road, Colombo 04",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600)),
                              trailing: InkWell(
                                child: Icon(
                                  Icons.directions,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                                onTap: () {
                                  MapsLauncher.launchQuery('Colombo');
                                },
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            ListTile(
                                title: Text("Contact Customer",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    InkWell(
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                      onTap: () {
                                        customLaunch('tel: 123');
                                      },
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    InkWell(
                                      child: Icon(
                                        Icons.mail,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                      onTap: () {
                                        customLaunch('sms: 123');
                                      },
                                    ),
                                  ],
                                )),
                          ],
                        )),
                  ])),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.local_grocery_store,
                            size: 25, color: Colors.indigo[900]),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Order Content",
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
                            itemCount: 2,
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
                                          Text(" : 6",
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
                                            child: Text('Pick Order',
                                                style: TextStyle(
                                                    color: Colors.indigo[900],
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: (() {})),
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
                                            onPressed: (() {})),
                                      )
                                    ],
                                  ),
                                ]))))
              ],
            ))));
  }
}
