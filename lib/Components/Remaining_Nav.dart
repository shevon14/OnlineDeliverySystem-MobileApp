import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/Components/Remaining.dart';

class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("U Sketch"),
        backgroundColor: Colors.blue,
      ),
      body: cart_product(),
    );
  }
}
