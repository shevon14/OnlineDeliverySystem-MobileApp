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
// class PickOrderData {
// Map fetched_data = {
//     "sellerName": "commonaddress",
//     "sellerAddress": "getSellerAddress",
//     "sellerContactNumber": "getSellerContactNumber",
//     "customerName": 'commonListData1.customerName',
//     "customerAddress": "getcustomerAddress",
//     "customerContactNumber": "getcustomerContactNumber",
//     "items": [
//       {
//           //ekama order eke products wadi weddi meke length eka wadi karala enna danna
//           "itemName": " Vegetable",
//           "quantity": " 100 g",
//           "image":
//               "https://fyi.extension.wisc.edu/safefood/files/2019/04/CDC_produce.png"
//         },
//     ]
//   };
//   List _item;

// //function to fetch the data
//   PickOrderData()  {
//     _item = fetched_data["items"];
//   }
//   String getSellerName() {
//     return fetched_data["sellerName"];
//     // _data[index]["sellerName"];
//   }

//   String getSellerAddress() {
//     return fetched_data["sellerAddress"];
//   }

//   String getSellerConatctNumber() {
//     return fetched_data["sellerContactNumber"];
//   }

//   String getCustomerName() {
//     return fetched_data["customerName"];
//   }

//   String getCustomerAddress() {
//     return fetched_data["customerAddress"];
//   }

//   String getCustomerConatctNumber() {
//     return fetched_data["customerContactNumber"];
//   }

//   String getQuantity(int index) {
//     return _item[index]["itemName"];
//   }

//   String getItemName(int index) {
//     return _item[index]["quantity"];
//   }

//   String getImg(int index) {
//     return _item[index]["image"];
//   }

//   int getItemsLength() {
//     return _item.length;
//   }
// }

class _PickUpDetailViewState extends State<PickUpDetailView> {
  List<ProductModel> itemsDetails = new List<ProductModel>();

  OrderModel commonListGetData = new OrderModel();
  SellerModel sellersDetails1 = SellerModel();
  var aaa;

  Future<List<SellerModel>> getSellerData() async {
    //get seller data by shopId
    final String apiUrl = sellerDataApi;
    final response = await http.get(apiUrl + commonListGetData.shopId);

    var sellersDetails = List<SellerModel>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      sellersDetails.add(SellerModel.fromJson(notesJson));
    }
    return sellersDetails;
  }

//fill order data like quanty,name
  Future<List<ProductModel>> getOrders() async {
    //get all deliver orders to get produt according to order id
    final String apiUrl = devilerDataByOrderId;
    final response = await http.get(apiUrl + commonListGetData.orderId);

    var notes = List<OrderModel>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(OrderModel.fromJson(noteJson));
      }
      for (var i = 0; i < notes.length; i++) {
        List<ProductModel> productDetails = await getImgData(notes[i].productId);
        var path = productDetails[0].imgName;
        var newPath = path.substring(0, 7) +
            networkIpAddress +
            path.substring(21, path.length);

        var itemsDetails_1 = ProductModel(
            id: notes[i].productId,
            productName: notes[i].productName,
            availableQuantity: notes[i].quantity,
            // imgName:path);
            imgName: newPath);
        itemsDetails.add(itemsDetails_1);
      }
    }

    return itemsDetails;
  }

  Future<List<ProductModel>> getImgData(String productId) async {
  final String apiUrl_1 = singleProductDataApi;
        final response_1 = await http.get(apiUrl_1 +productId);

        var productDetails = List<ProductModel>();

        if (response_1.statusCode == 200) {
          var notesJson_1 = json.decode(response_1.body);
          productDetails.add(ProductModel.fromJson(notesJson_1[0]));
        }
        return productDetails;
        }

  Future<String> getProductData(String productId) async {
    //img by product
    final String apiUrl = singleProductDataApi;
    final response = await http.get(apiUrl + productId);

    var productDetails = List<ProductModel>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      productDetails.add(ProductModel.fromJson(notesJson[0]));
    }
    var path = productDetails[0].imgName;
    var newPath = path.substring(0, 7) +
        networkIpAddress +
        path.substring(16, path.length);
    return newPath;
  }

  Future<bool> updatePickOrder() async {
    final String apiUrl = pickOrderApi;
    final response = await http.post(apiUrl + commonListGetData.orderId, body: {
      "deliverPersonId":userDetails.id,
      "state": "Picked Order",
    });
    bool notesJson = false;

    if (response.statusCode == 200) {
      notesJson = true;
    }
    return notesJson;
  }

  Future<bool> updateCompleteState() async {
    final String apiUrl = deliverComplete;
    final response = await http.post(apiUrl + commonListGetData.orderId, body: {
      "state": "Order Completed",
    });
    bool notesJson = false;

    if (response.statusCode == 200) {
      notesJson = true;
    }
    return notesJson;
  }

  @override
  void initState() {
    commonListGetData =
        commonListData; // other details customer name ..(customer data..)
    // updatePickOrder().then((value1){
    //    setState(() {
    //     print(value1); //sellerdetails
    //   });
    // });
   getSellerData().then((value) {
      setState(() {
        sellersDetails1 = (value[0]);
        print(sellersDetails1.address); //sellerdetails
      });
    });

    getOrders().then((value1) {
      setState(() {
        itemsDetails = value1;
        print(value1[0].availableQuantity); //itemdata details
      });
    });

    // getProductData(itemsDetails[0].id).then((value1){
    //    setState(() {
    //      aaa=(value1);
    //     // print(value1[0].availableQuantity); //itemdata details
    //   });
    // });
    super.initState();
  }

   String getSellerName() {
     var data=sellersDetails1.shopName==null? "":sellersDetails1.shopName;
    // return fetched_data["sellerName"];
    return data;
    // _data[index]["sellerName"];
  }

  String getSellerAddress() {
     var data=sellersDetails1.address==null? "":sellersDetails1.address;
    return data;
    // return fetched_data["sellerAddress"];
  }

  String getSellerConatctNumber() {
     var data=sellersDetails1.personalPhone==null? "":sellersDetails1.personalPhone;
    return data;
    // return fetched_data["sellerContactNumber"];
  }

  String getCustomerName() {
     var data=commonListGetData.customerName==null? "":commonListGetData.customerName;
    return data;
  } 

  String getCustomerAddress() {
     var data=commonListGetData.address==null? "":commonListGetData.address;
    return data;
  }

  String getCustomerConatctNumber() {
     var data=commonListGetData.mobileNumber==null? "":commonListGetData.mobileNumber;
    return data;
  }

  String getQuantity(int index) {
     var data=itemsDetails[index].availableQuantity==null? "":itemsDetails[index].availableQuantity;
    return data;
  }

  String getItemName(int index) {
     var data=itemsDetails[index].productName==null? "":itemsDetails[index].productName;
    return data;
  }

  String getImg(int index) {
     var data=itemsDetails[index].imgName==null? "":itemsDetails[index].imgName;
    return data;
  }

  int getItemsLength() {
     var data=itemsDetails.length==null? 0:itemsDetails.length;
    return data;
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
                              title: Text(getSellerName(),
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
                              title: Text(getSellerAddress(),
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
                                  MapsLauncher.launchQuery(getSellerAddress());
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
                                        customLaunch('tel:'+getSellerConatctNumber());
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
                                        customLaunch('sms:'+getSellerConatctNumber());
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
                              title: Text(getCustomerName(),
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
                              title: Text(getCustomerAddress(),
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
                                  MapsLauncher.launchQuery(getCustomerAddress());
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
                                        customLaunch('tel:'+getCustomerConatctNumber());
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
                                        customLaunch('sms:'+getCustomerConatctNumber());
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
                            itemCount: getItemsLength(),
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
                                            getImg(index),
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
                                          Text("Name",
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
                                          Text(" :" + getItemName(index),
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //item quantity
                                          Text(" :" + getQuantity(index),
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
                                            onPressed: (() async {
                                              final bool user =
                                                  await updatePickOrder();

                                              setState(() {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyOrdersView()),
                                                );
                                              });
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
