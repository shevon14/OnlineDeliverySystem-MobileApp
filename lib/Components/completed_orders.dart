import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class complete_order extends StatefulWidget {
  @override
  _complete_orderState createState() => _complete_orderState();
}

class _complete_orderState extends State<complete_order> {
  var products_on_the_cart = [
    {
      'name': "Pizza",
      'picture': "assets/images/pizza.jpg",
      'price': 85,
      "color": "No.616,Galle Road,Kaluthara",
      "review": "assets/images/review.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products_on_the_cart.length,
      itemBuilder: (context, index) {
        return single_complete_order(
            prod_name: products_on_the_cart[index]['name'],
            prod_picture: products_on_the_cart[index]['picture'],
            prod_price: products_on_the_cart[index]['price'],
            prod_color: products_on_the_cart[index]['color'],
            prod_quantity: products_on_the_cart[index]['quantity'],
            prod_review: products_on_the_cart[index]['review']);
      },
    );
  }
}

class single_complete_order extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_color;
  final prod_quantity;
  final prod_review;
  single_complete_order({
    this.prod_name,
    this.prod_picture,
    this.prod_price,
    this.prod_color,
    this.prod_quantity,
    this.prod_review,
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
          subtitle: Column(
            children: [
              Text(prod_color),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(prod_review),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
//
//
// class cart_product extends StatefulWidget {
//   @override
//   _cart_productState createState() => _cart_productState();
// }
//
// class _cart_productState extends State<cart_product> {
//   var products_on_the_cart = [
//     {
//       'name': "Pizza",
//       'picture': "assets/images/pizza.jpg",
//       'price': 85,
//       "color": "No.616,Galle Road,Kaluthara",
//       "review": "assets/images/review.png"
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: products_on_the_cart.length,
//       itemBuilder: (context, index) {
//         return single_product_cart(
//           prod_name: products_on_the_cart[index]['name'],
//           prod_picture: products_on_the_cart[index]['picture'],
//           prod_price: products_on_the_cart[index]['price'],
//           prod_color: products_on_the_cart[index]['color'],
//           prod_quantity: products_on_the_cart[index]['quantity'],
//           prod_review:products_on_the_cart[index]['review']
//         );
//       },
//     );
//   }
// }
//
// class single_product_cart extends StatelessWidget {
//   final prod_name;
//   final prod_picture;
//   final prod_price;
//   final prod_color;
//   final prod_quantity;
//   final prod_review;
//
//   single_product_cart({
//     this.prod_name,
//     this.prod_picture,
//     this.prod_price,
//     this.prod_color,
//     this.prod_quantity,
//     this.prod_review
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: InkWell(
//         onTap: () {},
//         child: ListTile(
//           leading: Padding(
//             padding: const EdgeInsets.all(2.0),
//             child: Image.asset(prod_picture),
//           ),
//           title: Text(prod_name),
//           subtitle: Column(
//             children: [
//               Text(prod_color),
//               Image.asset(prod_review)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
