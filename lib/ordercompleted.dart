import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';
import 'package:http/http.dart' as http;

import 'apiUrl/api.dart';
import 'common/common_data.dart';
import 'entities/income_model.dart';
import 'entities/order_model.dart';

class OrderCompletedView extends StatefulWidget {
  @override
  _OrderCompletedViewState createState() => _OrderCompletedViewState();
}

//array details for order complete - modelen ekan details aran danna click kalma id ekata
class MarkCompleteData {
  Map fetched_data = {
    "OrderID": "#102453",
    "PayementMethod": "Cash On Delivery",
    "TotalAmount": 5400,
    "YourEarnings": 150,
  };

//function to fetch the data
  String getOrderID() {
    return fetched_data["OrderID"];
  }

  String getPaymentMethod() {
    return fetched_data["PayementMethod"];
  }

  int getTotalAmount() {
    return fetched_data["TotalAmount"];
  }

  int getYourEarnings() {
    return fetched_data["YourEarnings"];
  }
}

class _OrderCompletedViewState extends State<OrderCompletedView> {

    IncomeModelFromJson _singup;
  List<OrderModel> _notes = List<OrderModel>();
  OrderModel commonListGetData= new OrderModel() ;

  Future<List<OrderModel>> getOrders() async {
    final String apiUrl = orderPickApi;
    final response = await http.get(apiUrl);

    var notes = List<OrderModel>();
    var filterNotes = List<OrderModel>();
    String preOrderId;

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(OrderModel.fromJson(noteJson));
      }
      for (var i = 0; i < notes.length; i++) {
        if (preOrderId != notes[i].orderId &&
            notes[i].state == "Order Completed") {
          filterNotes.add(notes[i]);
        }
        preOrderId = notes[i].orderId;
      }
    }
    return filterNotes;
  }

        Future<bool> updateArrivedOrder() async {
    final String apiUrl = pickOrderApi;
    final response = await http.post(apiUrl + commonListGetData.orderId, body: {
      "deliverPersonId":userDetails.id,
      "state": "Order Completed",
    });
    
    final String apiUrl_1 = checkoutStates;
     final response1 = await http.post(apiUrl_1 + commonListGetData.orderId, body: {
      "deliverPersonId":userDetails.id,
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
                  Card(
                      child: Padding(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          child: Row(children: <Widget>[
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
                                // Text(MarkCompleteData().getOrderID(),
                                //     style: TextStyle(
                                //         color: Colors.indigo[900],
                                //         fontWeight: FontWeight.w900,
                                //         fontSize: 18)),
                                Text(MarkCompleteData().getPaymentMethod(),
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
                          "Total Amount  - Rs." +
                              getArricedTotal.toString() +
                              ".00/=",
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
                          "Your Earnings - Rs." +
                              getArricedEarn.toString() +
                              ".00/=",
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
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: new RaisedButton(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text('Finish Job',
                            style: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold)),
                        onPressed: (() async {
                          var incomeData = IncomeModelFromJson(
                              uId: userDetails.id,
                              orderId: commonListData.orderId,
                              payment: commonListData.payment,
                              address: commonListData.address,
                              totalCollected: getArricedTotal.toString(),
                              income: getArricedEarn.toString()
                              );

                          final IncomeModelFromJson singup =
                              await createEarn(incomeData);
                              await updateArrivedOrder();
                          setState(() {
                            _singup = singup;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeView()),
                          );
                        })),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ])),
              ],
            ))));
  }
}

Future<IncomeModelFromJson> createEarn(IncomeModelFromJson userData) async {
  final String apiUrl = updateIncome;

  final response = await http.post(apiUrl, body:{
    "u_id": userData.uId,
    "orderId": userData.orderId,
    "payment": userData.payment,
    "address": userData.address,
    "totalCollected": userData.totalCollected,
    "income": userData.income
  });

  if (response.statusCode == 200) {
    final String responseString = response.body;

    return incomeModelFromJsonFromJson(responseString);
  } else {
    return null;
  }
}
