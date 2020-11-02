import 'package:flutter/material.dart';
import 'package:online_delivey_system_app/Components/completed_orders.dart';

// class cart extends StatefulWidget {
//   @override
//   _cartState createState() => _cartState();
// }
//
// class _cartState extends State<cart> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Online Delivery"),
//         backgroundColor: Colors.blue,
//       ),
//       body: cart_product(),
//     );
//   }
// }

class comepleteOrders extends StatefulWidget {
  @override
  _comepleteOrdersState createState() => _comepleteOrdersState();
}

class _comepleteOrdersState extends State<comepleteOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Completed Orders"),
        backgroundColor: Colors.blue,
      ),
      body: complete_order(),
    );
  }
}
