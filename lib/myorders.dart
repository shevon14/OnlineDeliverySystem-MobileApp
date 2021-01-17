import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/home.dart';
import 'package:online_delivey_system_app/myorderdetails.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';
import 'package:online_delivey_system_app/pickupdetail.dart';
import 'package:http/http.dart' as http;

import 'apiUrl/api.dart';
import 'common/common_data.dart';
import 'entities/order_model.dart';

class MyOrdersView extends StatefulWidget {
  @override
  _MyOrdersViewState createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  List<OrderModel> _notes = List<OrderModel>();

  Future<List<OrderModel>> getOrders() async {
    final String apiUrl = myOrderIdApi;
    final response =
        await http.get(apiUrl + "null12"); //null12-> deliverPerson_Id

    var notes = List<OrderModel>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(OrderModel.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    getOrders().then((value) {
      setState(() {
        _notes.addAll(value);
        print(_notes[0].deliverPersonId);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        titleSpacing: -10,
        title: Text('Ideal Store',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                            width: 150,
                            child: new RaisedButton(
                                color: Colors.grey[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('Order Pickups',
                                    style: TextStyle(color: Colors.grey)),
                                onPressed: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeView()),
                                  );
                                })),
                          ),
                          SizedBox(
                              height: 50,
                              width: 150,
                              child: new RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('My Orders',
                                    style: TextStyle(
                                        color: Colors.indigo[900],
                                        fontWeight: FontWeight.bold)),
                                onPressed: () {},
                              )),
                        ],
                      ),
                    ])),
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[300],
              height: 20,
            ),
            Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              SizedBox(
                  height: 600,
                  child: Expanded(
                    child: new ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3, //array length
                        itemBuilder: (context, index) {
                          return Card(
                              child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.fastfood,
                                  color: Colors.blue,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 180,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("#12345", //get id number
                                          style: TextStyle(
                                              color: Colors.indigo[900],
                                              fontWeight: FontWeight.w900,
                                              fontSize: 20)),
                                      Text("No5, Negombo", //get address details
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    ClipOval(
                                      child: Material(
                                        color: Colors.white10,
                                        child: InkWell(
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              commonListData = _notes[index];
                                            });
                                            //pickupdatils click
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyOrderDetailView()),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ));
                        }),
                  ))
            ])
          ],
        ),
      ),
    ));
  }
}
