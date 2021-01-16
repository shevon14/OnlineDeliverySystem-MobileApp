import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:online_delivey_system_app/myorders.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';
import 'package:online_delivey_system_app/ordercompleted.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkArrivedView extends StatefulWidget {
  @override
  _MarkArrivedViewState createState() => _MarkArrivedViewState();
}

//array details 
class MarkArrivedData {
  Map fetched_data = {
    "OrderID" : "#102453",
    "PayementMethod": "Cash On Delivery",
    "TotalAmount": 5000,
    "YourEarnings": 200,
    "items": [
      {   //ekama order eke products wadi weddi meke length eka wadi karala enna danna
          "itemName": "Vegetable",
          "quantity": "100 g",
          "image":
              "https://fyi.extension.wisc.edu/safefood/files/2019/04/CDC_produce.png"
        },
    ]
  };
  List _item;

//function to fetch the data
  MarkArrivedData() {
    _item = fetched_data["items"];
  }

  String getOrderID() {
    return fetched_data["OrderID"];
  }

  String getPaymentMethod() {
    return fetched_data["PayementMethod"];
  }

  int getTotalAmount(){
    return fetched_data["TotalAmount"];
  }

  int getYourEarnings(){
    return fetched_data["YourEarnings"];
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
                                    Text(MarkArrivedData().getOrderID(),
                                        style: TextStyle(
                                            color: Colors.indigo[900],
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18)),
                                    Text(MarkArrivedData().getPaymentMethod(),
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
                        SizedBox(
                          height: 600,
                          child: Expanded(
                            child://build list view
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: MarkArrivedData().getItemsLength(),
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
                                            MarkArrivedData().getImg(index),
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
                                          Text(" :" + MarkArrivedData().getItemName(index),
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //item quantity
                                          Text(" :" + MarkArrivedData().getQuantity(index),
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }), ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Total Amount  - Rs." + MarkArrivedData().getTotalAmount().toString() + "/=",
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
                          "Your Earnings - Rs." + MarkArrivedData().getYourEarnings().toString() + "/=",
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
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                       MyOrdersView()),
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
