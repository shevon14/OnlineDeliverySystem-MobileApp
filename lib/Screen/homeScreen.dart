import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:online_delivey_system_app/Components/product.dart';

class HomePageDemo extends StatefulWidget {
  @override
  _HomePageDemoState createState() => _HomePageDemoState();
}

class _HomePageDemoState extends State<HomePageDemo> {
  @override
  Widget build(BuildContext context) {
    Widget ImageCarousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("assets/images/0001.jpg"),
          AssetImage("assets/images/0002.jpg"),
          AssetImage("assets/images/0003.jpg"),
          AssetImage("assets/images/0004.jpg"),
          AssetImage("assets/images/0005.jpg"),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(microseconds: 1000),
        dotColor: Colors.blue,
        dotSize: 4,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Delivery"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          cart_product()
          // ImageCarousel,
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     "Products",
          //     style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w800),
          //   ),
          // ),
        ],
      ),
    );
  }
}
