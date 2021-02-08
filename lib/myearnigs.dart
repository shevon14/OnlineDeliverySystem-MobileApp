import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';

import 'apiUrl/api.dart';
import 'common/common_data.dart';
import 'entities/income_model.dart';
import 'package:http/http.dart' as http;

class CashMangementView extends StatefulWidget {
  @override
  _CashMangementViewState createState() => _CashMangementViewState();
}

class _CashMangementViewState extends State<CashMangementView> {
  List<IncomeModelFromJson> _notes = List<IncomeModelFromJson>();

  Future<List<IncomeModelFromJson>> getOrders() async {
    final String apiUrl = completeIncome;
    final response = await http.get(apiUrl + userDetails.id);

    var notes = List<IncomeModelFromJson>();
    var filterNotes = List<IncomeModelFromJson>();
    String preOrderId;

    if (response.statusCode == 200) {
      var notesJson1 = json.decode(response.body);
      for (var noteJson1 in notesJson1) {
        notes.add(IncomeModelFromJson.fromJson(noteJson1));
      }
    }
    return notes;
  }

  @override
  void initState() {
    getOrders().then((value) {
      setState(() {
        _notes.addAll(value);
        print(_notes[0].uId);
        int getTotal = totalData().getTotal(_notes);
        print(getTotal.toString());
        //print(_notes[0].orderId);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.keyboard_backspace), 
              onPressed: (){
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeView()),
                          );
              } ),
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
                "Deposits Amout",
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
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Total - ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w800)),
                        Text(
                            "Rs." +
                                totalData().getTotal(_notes).toString() +
                                '/=',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: _notes.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(_notes[index].date.toString().substring(0, 16),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800)),
                              Text("Rs."+ _notes[index].income,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800)),
                            ],
                          );
                        })
                  ],
                ))),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Icon(Icons.receipt, size: 25, color: Colors.blue),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                "Your Receipts - Online Payments",
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
                      child: Text("Recepit ID",
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

class totalData {
  int total = 0;
  int getTotal(List<IncomeModelFromJson> _notes1) {
    for (var i in _notes1) {
      total = total + int.parse(i.totalCollected);
      print(total.toString());
    }
    //   for (var i=0; i< _notes1.length;i++){
    // total=total+int.parse(_notes1[i].totalCollected);
    // }
    return total;
  }
}
