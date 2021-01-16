import 'package:flutter/material.dart';

class CompleteOrderHistoryView extends StatefulWidget {
  @override
  _CompleteOrderHistoryViewState createState() => _CompleteOrderHistoryViewState();
}

//Order listview data array
class CompleteOrderHistoryData {
  Map fetched_data = {  
    // eka array obeject ekak ain karala model eken ena variables tika assign karanna
    "data": [
      {
        "Id": "#15401",
        "payment": "Cash on Delivery",
        "address": "No.5, Main road, Negombo",
        "date": "2020.05.26",
        "totalCollected": "LKR 8000.00",
        "income": "LKR 500.00"
      },
      {
        "Id": "#15402",
        "payment": "Card Payment",
        "address": "No.5, Main road, Negombo",
        "date": "2020.05.25",
        "totalCollected": "LKR 9000.00",
        "income": "LKR 300.00"
      },
    ]
  };
  List _data;

//function to fetch the data
  CompleteOrderHistoryData() {
    _data = fetched_data["data"];
  }

  String getId(int index) {
    return _data[index]["Id"];
  }

  String getPayment(int index) {
    return _data[index]["payment"];
  }

  String getAddress(int index) {
    return _data[index]["address"];
  }

  String getDate(int index) {
    return _data[index]["date"];
  }

  String getTotalCollected(int index) {
    return _data[index]["totalCollected"];
  }

  String getIncome(int index) {
    return _data[index]["income"];
  }

  int getLength() {
    return _data.length;
  }
}

class _CompleteOrderHistoryViewState extends State<CompleteOrderHistoryView> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              iconTheme: new IconThemeData(color: Colors.white),
              titleSpacing: 10,
              title: Text('Complete Orders',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: Colors.blue,
            ),
            body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(2, 10, 2, 3),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: CompleteOrderHistoryData().getLength(),
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.check_circle,
                                  size: 50.0,
                                  color: Colors.blue,
                                ),
                                SizedBox( width: 5,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(CompleteOrderHistoryData().getId(index),
                                            style: TextStyle(
                                                color: Colors.indigo[900],
                                                fontWeight: FontWeight.w900,
                                                fontSize: 18)),
                                       
                                      ],
                                    ),
                                    Text(CompleteOrderHistoryData().getPayment(index),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14)),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 200,
                                          child: Text(CompleteOrderHistoryData().getAddress(index),
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 13,
                                                  fontWeight: FontWeight.w500)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 200,
                                          child: Text(CompleteOrderHistoryData().getDate(index),
                                              style: TextStyle( fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Total Collected",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Your Income",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(CompleteOrderHistoryData().getTotalCollected(index),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(CompleteOrderHistoryData().getIncome(index),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800)),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )));
                }),
          ),
        ]),
      ),
    )));
  }
}