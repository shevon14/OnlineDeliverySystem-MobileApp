import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/markarriced.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class MyOrderDetailView extends StatefulWidget {
  @override
  _MyOrderDetailViewState createState() => _MyOrderDetailViewState();
}

void customLaunch(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    print("could not launch $command");
  }
}

class MyPickOrderData {
  Map fetched_data = {
    "sellerName": "getSellerName",
    "sellerAddress": "getSellerAddress",
    "sellerContactNumber": "getSellerContactNumber",
    "customerName": "getcustomerName",
    "customerAddress": "getcustomerAddress",
    "customerContactNumber": "getcustomerContactNumber",
    "items": [
        {
          //ekama order eke products wadi weddi meke length eka wadi karala enna danna
          "itemName": "Vegetable",
          "quantity": "100 g",
          "image":
              "https://fyi.extension.wisc.edu/safefood/files/2019/04/CDC_produce.png"
        },
    ]
  };
  List _item;

//function to fetch the data
  MyPickOrderData() {
    _item = fetched_data["item"];
  }

  String getSellerName() {
    return fetched_data["sellerName"];
    // _data[index]["sellerName"];
  }

  String getSellerAddress() {
    return fetched_data["sellerAddress"];
  }

  String getSellerConatctNumber() {
    return fetched_data["sellerContactNumber"];
  }

  String getCustomerName() {
    return fetched_data["customerName"];
  }

  String getCustomerAddress() {
    return fetched_data["customerAddress"];
  }

  String getCustomerConatctNumber() {
    return fetched_data["customerContactNumber"];
  }

  String getQuantity(int index) {
    return _item[index]["itemName"];
  }

  String getItemName(int index) {
    return _item[index]["quantity"];
  }

  String getImg(int index) {
    return _item[index]["image"];
  }

  int getItemsLength() {
    return _item.length;
  }
}

class _MyOrderDetailViewState extends State<MyOrderDetailView> {
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
                              title: Text(MyPickOrderData().getCustomerName(),
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
                                  MyPickOrderData().getCustomerAddress(),
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
                              title: Text(MyPickOrderData().getSellerName(),
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
                                  MyPickOrderData().getSellerAddress(),
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
                            itemCount: MyPickOrderData().getItemsLength(),
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
                                          child: Image.network(
                                            MyPickOrderData().getImg(index),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
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
                                          Text(" :"+ MyPickOrderData().getItemName(index),
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //item quantity
                                          Text(" :" + MyPickOrderData().getQuantity(index),
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
                                            child: Text('Mark Arrived',
                                                style: TextStyle(
                                                    color: Colors.indigo[900],
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: (() {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MarkArrivedView()),
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
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeView()),
                                              );
                                            })),
                                      )
                                    ],
                                  ),
                                ]))))
              ],
            ))));
  }
}
