import 'package:flutter/material.dart';

class cart_product extends StatefulWidget {
  @override
  _cart_productState createState() => _cart_productState();
}

class _cart_productState extends State<cart_product> {
  var products_on_the_cart = [
    {
      'name': "Pizza",
      'picture': "assets/images/pizza.jpg",
      'price': 85,
      "color": "No.616,Galle Road,Kaluthara",
      "quantity": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products_on_the_cart.length,
      itemBuilder: (context, index) {
        return single_product_cart(
          prod_name: products_on_the_cart[index]['name'],
          prod_picture: products_on_the_cart[index]['picture'],
          prod_price: products_on_the_cart[index]['price'],
          prod_color: products_on_the_cart[index]['color'],
          prod_quantity: products_on_the_cart[index]['quantity'],
        );
      },
    );
  }
}

class single_product_cart extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_color;
  final prod_quantity;

  single_product_cart({
    this.prod_name,
    this.prod_picture,
    this.prod_price,
    this.prod_color,
    this.prod_quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(prod_picture),
          ),
          title: Text(prod_name),
          subtitle: Text(prod_color),
        ),
      ),
    );
  }
}
