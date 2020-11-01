import 'package:flutter/material.dart';

class cart_product extends StatefulWidget {
  @override
  _cart_productState createState() => _cart_productState();
}

class _cart_productState extends State<cart_product> {
  var products_on_the_cart = [
    {
      'number': "#121212121",
      'address': "HOly shit address",
      'price': 85,
      "icon": "Icons.kitchen",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products_on_the_cart.length,
      itemBuilder: (context, index) {
        return single_product_cart(
          prod_number: products_on_the_cart[index]['number'],
          prod_address: products_on_the_cart[index]['address'],
          prod_price: products_on_the_cart[index]['price'],
          prod_icon: products_on_the_cart[index]['icon'],
        );
      },
    );
  }
}

class single_product_cart extends StatelessWidget {
  final prod_number;
  final prod_address;
  final prod_price;
  final prod_icon;

  single_product_cart({
    this.prod_number,
    this.prod_address,
    this.prod_price,
    this.prod_icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_number,
        child: Material(
          child: InkWell(
            onTap: () => {},
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    prod_number,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                  ),
                  title: Text(
                    "\Rs.$prod_price",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.red,
                        fontSize: 12.0),
                  ),
                  // subtitle: Text(
                  //   "\Rs.$prod_oldPrice",
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                ),
              ),
              child: Image.asset(
                prod_icon,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
