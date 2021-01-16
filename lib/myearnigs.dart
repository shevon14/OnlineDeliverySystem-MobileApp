import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';

class CashMangementView extends StatefulWidget {
  @override
  _CashMangementViewState createState() => _CashMangementViewState();
}

class _CashMangementViewState extends State<CashMangementView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        titleSpacing: -5,
        title: Text('My Earnings',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Icon(Icons.payment, size: 25, color: Colors.blue),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "Deposit Amout",
                style: TextStyle(
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
            ],
          ),
        ),
        Card(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Total to be deposited",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w800)),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.star,
                                size: 20, color: Colors.blue),
                            Padding(padding: EdgeInsets.all(5)),
                            Text("Cash on hand",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text("yesterday float",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600))),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text("Cash collected",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600))),
                        Text(""),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text("LKR 5800.00",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w800)),
                        SizedBox(
                          height: 38,
                        ),
                        Text("LKR 2000.00",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 8,
                        ),
                        Text("LKR 8200.00",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("LKR 10200.00",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ))),
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Icon(Icons.receipt, size: 25, color: Colors.blue),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "Your Receipts",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
            ],
          ),
        ),
        Card(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 80,
                      child: Text("Date",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                    ),
                    SizedBox(
                      width: 80,
                      child: Text("Deposited",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                    ),
                    SizedBox(
                      width: 80,
                      child: Text("Recepit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w800)),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 80,
                      child: Text("May 05",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      width: 80,
                      child: Text("LKR 7000.00",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      width: 80,
                      child: Text("ABC 0001",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 80,
                      child: Text("May 15",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      width: 80,
                      child: Text("LKR 10000.00",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      width: 80,
                      child: Text("ABC 0003",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ])),
        )
      ]))),
    ));
  }
}
