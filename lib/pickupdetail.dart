import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/myorderdetails.dart';
import 'package:online_delivey_system_app/myorders.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'apiUrl/api.dart';
import 'common/common_data.dart';
import 'entities/order_model.dart';
import 'package:http/http.dart' as http;

import 'entities/product_model.dart';
import 'entities/seller_model.dart';

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

//array details for order pick up  - meke get.... kiyana tikata modelen ekan details aran danna
class PickOrderData {
Map fetched_data = {
    "sellerName": "commonaddress",
    "sellerAddress": "getSellerAddress",
    "sellerContactNumber": "getSellerContactNumber",
    "customerName": 'commonListData1.customerName',
    "customerAddress": "getcustomerAddress",
    "customerContactNumber": "getcustomerContactNumber",
    "items": [
      {
          //ekama order eke products wadi weddi meke length eka wadi karala enna danna
          "itemName": " Vegetable",
          "quantity": " 100 g",
          "image":
              "https://fyi.extension.wisc.edu/safefood/files/2019/04/CDC_produce.png"
        },
    ]
  };
  List _item;

//function to fetch the data
  PickOrderData()  {
    _item = fetched_data["items"];
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

class _PickUpDetailViewState extends State<PickUpDetailView> {

  List<ProductModel> itemsDetails=new List<ProductModel>();

OrderModel commonListGetData= new OrderModel() ;
SellerModel sellersDetails1 = SellerModel();

    Future<List<SellerModel>> getSellerData() async {   //get seller data by shopId 
    final String apiUrl = sellerDataApi;
    final response = await http.get(apiUrl+commonListGetData.shopId);

    var sellersDetails = List<SellerModel>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
        sellersDetails.add(SellerModel.fromJson(notesJson));
    }
    return sellersDetails;
  }

//fill order data like quanty,name
  Future<List<ProductModel>> getOrders() async { //get all deliver orders to get produt according to order id
    final String apiUrl = devilerDataByOrderId;
    final response = await http.get(apiUrl+commonListGetData.orderId);

    var notes = List<OrderModel>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(OrderModel.fromJson(noteJson));
      }
      for (var i = 0; i < notes.length; i++) {
          var itemsDetails_1 = ProductModel(
            availableQuantity:notes[i].quantity,
                  );
                  itemsDetails.add(itemsDetails_1);
      }
      }
    return itemsDetails; 
  }

    Future <String> getProductData(String productId) async {//img by product
    final String apiUrl = singleProductDataApi;
    final response = await http.get(apiUrl+productId);

    var productDetails = List<ProductModel>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
        productDetails.add(ProductModel.fromJson(notesJson));
    }
    return productDetails[0].imgName;
  }

      Future <bool> updatePickOrder() async {
    final String apiUrl = pickOrderApi;
    final response = await http.post(apiUrl+commonListGetData.orderId, body: {
      "deliverPersonId": "123333333333333333333333333333333333333333333333333333",
      "state":"Picked Order",
    });
    bool notesJson=false;

    if (response.statusCode == 200) {
        notesJson=true;
    }
    return notesJson;
  }

Future <bool> updateCompleteState() async {
    final String apiUrl = deliverComplete;
    final response = await http.post(apiUrl+commonListGetData.orderId, body: {
      "state":"Order Completed",
    });
    bool notesJson=false;

    if (response.statusCode == 200) {
        notesJson=true;
    }
    return notesJson;
  }
  

 @override
  void initState() {
    commonListGetData=commonListData;// other details customer name ..(customer data..)
    // updatePickOrder().then((value1){
    //    setState(() {
    //     print(value1); //sellerdetails
    //   });
    // });
    // getSellerData().then((value) {
    //   setState(() {
    //     sellersDetails1=(value[0]);
    //     print(sellersDetails1.address); //sellerdetails
    //   });
    // });
    

    // getOrders().then((value1){
    //    setState(() {
    //     print(value1[0].availableQuantity); //itemdata details
    //   });
    // });
    super.initState();
  }


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
                              title: Text(
                                PickOrderData().getSellerName(),
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
                                  PickOrderData().getSellerAddress(),
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
                              title: Text(PickOrderData().getCustomerName(),
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
                                  PickOrderData().getCustomerAddress(),
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
                            itemCount: PickOrderData().getItemsLength(),
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
                                          child: Image.network(PickOrderData().getImg(index),
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
                                          Text( "Name",
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
                                          Text(" :" + PickOrderData().getItemName(index),
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //item quantity
                                          Text(" :" +PickOrderData().getQuantity(index),
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
                                            onPressed: (() {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyOrdersView()),
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


