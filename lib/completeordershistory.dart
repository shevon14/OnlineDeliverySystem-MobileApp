import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';

import 'apiUrl/api.dart';
import 'common/common_data.dart';
import 'entities/income_model.dart';
import 'entities/order_model.dart';
import 'package:http/http.dart' as http;

class CompleteOrderHistoryView extends StatefulWidget {
  @override
  _CompleteOrderHistoryViewState createState() => _CompleteOrderHistoryViewState();
}

//Order listview data array
// class CompleteOrderHistoryData {
//   Map fetched_data = {  
//     // eka array obeject ekak ain karala model eken ena variables tika assign karanna
//     "data": [
//       {
//         "Id": "#15401",
//         "payment": "Cash on Delivery",
//         "address": "No.5, Main road, Negombo",
//         "date": "2020.05.26",
//         "totalCollected": "LKR 8000.00",
//         "income": "LKR 500.00"
//       },
//       {
//         "Id": "#15402",
//         "payment": "Card Payment",
//         "address": "No.5, Main road, Negombo",
//         "date": "2020.05.25",
//         "totalCollected": "LKR 9000.00",
//         "income": "LKR 300.00"
//       },
//     ]
//   };
//   List _data;

// //function to fetch the data
//   CompleteOrderHistoryData() {
//     _data = fetched_data["data"];
//   }

//   String getId(int index) {
//     return _data[index]["Id"];
//   }

//   String getPayment(int index) {
//     return _data[index]["payment"];
//   }

//   String getAddress(int index) {
//     return _data[index]["address"];
//   }

//   String getDate(int index) {
//     return _data[index]["date"];
//   }

//   String getTotalCollected(int index) {
//     return _data[index]["totalCollected"];
//   }

//   String getIncome(int index) {
//     return _data[index]["income"];
//   }

//   int getLength() {
//     return _data.length;
//   }
// }

class _CompleteOrderHistoryViewState extends State<CompleteOrderHistoryView> {

  
  List<IncomeModelFromJson> _notes = List<IncomeModelFromJson>();

  // Future<List<IncomeModelFromJson>> getOrders1() async {
  //   final String apiUrl = completeIncome;
  //   final response = await http.get(apiUrl+userDetails.id);

  //   var notes = List<IncomeModelFromJson>();

  //   if (response.statusCode == 200) {
  //     var notesJson = json.decode(response.body);
  //      for (var noteJson in notesJson) {
  //       notes.add(IncomeModelFromJson.fromJson(noteJson));
  //     }
  //   }
  //   return notes;
  //   }

        Future<List<IncomeModelFromJson>> getOrders() async {
    final String apiUrl = completeIncome;
    final response = await http.get(apiUrl +userDetails.id);

    var notes = List<IncomeModelFromJson>();
    var filterNotes = List<IncomeModelFromJson>();
    String preOrderId;

    if (response.statusCode == 200) {
      var notesJson1 = json.decode(response.body);
      for (var noteJson1 in notesJson1) {
        notes.add(IncomeModelFromJson.fromJson(noteJson1));
      }
      // for (var i = 0; i < notes.length; i++) {
      //   if (preOrderId != notes[i].orderId &&
      //       notes[i].state == "Picked Order") {
      //     filterNotes.add(notes[i]);
      //   }
      //   preOrderId = notes[i].orderId;
      // }
    }
    return notes;
  }

      @override
  void initState() {
    getOrders().then((value) {
      setState(() {
        _notes.addAll(value);
        print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        print(_notes[0].uId);
        //print(_notes[0].orderId);
      });
    });
    super.initState();
  }


    String getId(int index) {
    return// "LKR 500.00";//
     _notes[index].orderId;
  }

  String getPayment(int index) {
    return //"LKR 500.00";
    _notes[index].payment;
  }

  String getAddress(int index) {
    var data = _notes[index].address==null? "":_notes[index].address;
    return data;//"LKR 500.00";//
    
  }

  String getDate(int index) {
    return //"LKR 500.00";//
    _notes[index].date.toString();//date.toString();
  }

  String getTotalCollected(int index) {
    return //"LKR 500.00";//
    _notes[index].totalCollected;
  }

  String getIncome(int index) {
    return //"LKR 500.00";//
    _notes[index].income;
  }

  int getLength() {
    return //2;
    _notes.length;
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
              titleSpacing: 2,
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
                itemCount: getLength(),
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
                                    // Row(
                                    //   children: <Widget>[
                                    //     Text(getId(index),
                                    //         style: TextStyle(
                                    //             color: Colors.indigo[900],
                                    //             fontWeight: FontWeight.w900,
                                    //             fontSize: 10)),
                                       
                                    //   ],
                                    // ),
                                    Text(getPayment(index),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14)),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 200,
                                          child: Text(getAddress(index),
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
                                          child: Text(getDate(index),
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
                                        Text('Rs.'+getTotalCollected(index)+'/=',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Rs.'+getIncome(index)+'/=',
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