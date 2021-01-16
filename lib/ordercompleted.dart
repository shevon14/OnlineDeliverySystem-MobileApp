import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';

class OrderCompletedView extends StatefulWidget {
  @override
  _OrderCompletedViewState createState() => _OrderCompletedViewState();
}

//array details for order complete - modelen ekan details aran danna click kalma id ekata
class MarkCompleteData {
  Map fetched_data = {
    "OrderID" : "#102453",
    "PayementMethod": "Cash On Delivery",
    "TotalAmount": 5400,
    "YourEarnings": 200,
  };

//function to fetch the data
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
}


class _OrderCompletedViewState extends State<OrderCompletedView> {
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
                          child: Row(children: <Widget>[
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
                                Text(MarkCompleteData().getOrderID(),
                                    style: TextStyle(
                                        color: Colors.indigo[900],
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18)),
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
                          "Total Amount  - Rs." + MarkCompleteData().getTotalAmount().toString() + ".00/=",
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
                          "Your Earnings - Rs." + MarkCompleteData().getYourEarnings().toString() + ".00/=",
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
                        onPressed: (() {
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
