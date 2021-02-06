import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:online_delivey_system_app/myorders.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';
import 'package:online_delivey_system_app/ordercompleted.dart';
import 'package:url_launcher/url_launcher.dart';

import 'apiUrl/api.dart';
import 'common/common_data.dart';
import 'entities/order_model.dart';
import 'entities/product_model.dart';
import 'package:http/http.dart' as http;

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

          Future<bool> updateCollectOrder() async {
    final String apiUrl = pickOrderApi;
    final response = await http.post(apiUrl + commonListGetData.orderId, body: {
      "deliverPersonId":userDetails.id,
      "state": "Collect",
    });
    bool notesJson = false;

    if (response.statusCode == 200) {
      notesJson = true;
    }
    return notesJson;
  }

  OrderModel commonListGetData= new OrderModel() ;
  List<ProductModel> itemsDetails=new List<ProductModel>();

 @override
  void initState() {
    commonListGetData =commonListData; 
    itemsDetails=markArricedItemsDetails;
        super.initState();
    }

  String getOrderID() {
    return commonListGetData.orderId;
  }

  String getPaymentMethod() {
    return commonListGetData.payment;
  }

  int getTotalAmount(){
    // var quantity_1;
//     var total=0;
// //     for(var i=0; i<itemsDetails.length; i++){
      
// //       // int aaa=(1*int.parse(itemsDetails[i].uniPrice));
// //       print("l"+total.toString()+"  "+itemsDetails[i].uniPrice);
// // // quantity_1=int.parse(iteSmsDetails[i].availableQuantity);
// // // total==null?(1*int.parse(itemsDetails[i].uniPrice)):"asss";
// // // total=1*int.parse(itemsDetails[i].uniPrice);
// //     }
//     getArricedTotal=total;
    
    return getArricedTotal;
  }

  int getYourEarnings(){
    var data=itemsDetails.length==null? 1:itemsDetails.length;
    var total=int.parse(commonListGetData.total);
    var uprice= int.parse(commonListGetData.uniPrice);
    var earn1=(total-uprice)*data;
    getArricedEarn=earn1;
    return (earn1);
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
    var data=itemsDetails.length==null? "":itemsDetails.length;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(primaryColor: Color(0xFF4A184C)),
        home:  Scaffold(
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
                          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          child: Row(
                              
                              children: <Widget>[
                                Icon(
                                  Icons.local_shipping,
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
                                    // Text(getOrderID(),
                                    //     style: TextStyle(
                                    //         color: Colors.indigo[900],
                                    //         fontWeight: FontWeight.w900,
                                    //         fontSize: 13)),
                                    Text(getPaymentMethod(),
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
                          "Total Amount  - Rs." + getTotalAmount().toString() + "/=",
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
                          "Your Earnings - Rs." + getYourEarnings().toString() + "/=",
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
                                              // final bool user =
                                              //     await updateCollectOrder();

                                              // setState(() {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OrderCompletedView()),
                                              );
                                              // });
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
