import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_delivey_system_app/myorders.dart';
import 'package:online_delivey_system_app/nav_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:online_delivey_system_app/pickupdetail.dart';
import 'apiUrl/api.dart';
import 'common/common_data.dart';
import 'entities/order_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<OrderModel> _notes = List<OrderModel>();
  List<OrderModel> _notes2 = List<OrderModel>();
  Timer timer;

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
            notes[i].deliverPersonId == "null") {
          filterNotes.add(notes[i]);
        }
        preOrderId = notes[i].orderId;
      }
    }
    return filterNotes;
  }

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) =>
    getOrders().then((value) {
      setState(() {
        _notes=[];
        _notes.addAll(value);
        
      });
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: WillPopScope(
            onWillPop: () {
              return showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Exit"),
                      content: Text("Are you sure you want to exit?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("YES"),
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                        ),
                        FlatButton(
                          child: Text("NO"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
            }, child:
        Scaffold(
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
          mainAxisSize: MainAxisSize.max,
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
                            height: 50,
                            width: 150,
                            child: new RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('Order Pickups',
                                    style: TextStyle(
                                        color: Colors.indigo[900],
                                        fontWeight: FontWeight.bold)),
                                onPressed: (() {})),
                          ),
                          SizedBox(
                              height: 40,
                              width: 150,
                              child: new RaisedButton(
                                color: Colors.grey[100],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('My Orders',
                                    style: TextStyle(color: Colors.grey)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyOrdersView()),
                                  );
                                },
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 600,
                  child: Expanded(
                    child: new ListView.builder(
                        shrinkWrap: true,
                        itemCount: _notes.length, //array length
                        itemBuilder: (context, index) {
                          return Card(
                              child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.local_shipping,
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
                                      Text(
                                          _notes[index]
                                              .productId, //_notes[index].productId,    //get id number
                                          style: TextStyle(
                                              color: Colors.indigo[900],
                                              fontWeight: FontWeight.w900,
                                              fontSize: 13)),
                                      Text(
                                          _notes[index]
                                              .address, //_notes[index].address,  //get address details
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
                                                      PickUpDetailView()),
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
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    )));
  }
}
