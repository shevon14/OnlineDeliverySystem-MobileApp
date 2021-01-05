// import 'package:deliveryApp/arrived(UI_5.2).dart';
// import 'package:deliveryApp/orderContentData.dart';
// import 'package:flutter/material.dart';
// import 'package:slide_to_confirm/slide_to_confirm.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:maps_launcher/maps_launcher.dart';

// class DetailView5 extends StatefulWidget {
//   @override
//   _DetailView5State createState() => _DetailView5State();
// }

// void customLaunch(command) async {
//   if (await canLaunch(command)) {
//     await launch(command);
//   } else {
//     print("could not launch $command");
//   }
// }

// //Slider btn activation
// bool activation = true;

// class _DetailView5State extends State<DetailView5> {
  
//   //get data to listview
//   OrderContentData _data = new OrderContentData();

//   @override
//   Widget build(BuildContext context) {

//     //item category (food = 1 | grocerry = 2 | medicine =3)
//     int itemCat = 1;

//     return MaterialApp(
//         theme: new ThemeData(primaryColor: Color(0xFF4A184C)),
//         home: Scaffold(
//             body: SafeArea(
//                 child: Stack(children: <Widget>[
//           SingleChildScrollView(
//             child: Container(
//                 child: Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Column(children: <Widget>[
//                       //Top Card oder details view
//                   Card(
//                       shape: RoundedRectangleBorder(
//                           side: BorderSide(color: Colors.deepOrange, width: 2),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Padding(
//                           padding: EdgeInsets.only(top: 15, bottom: 15),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: <Widget>[
//                                 Icon(
//                                   itemCat == 1
//                                       ? Icons.fastfood
//                                       : itemCat == 2
//                                           ? Icons.local_grocery_store
//                                           : Icons.local_pharmacy,
//                                   color: Colors.deepOrange[700],
//                                   size: 40,
//                                 ),
//                                 Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Text("#15401006",
//                                         style: TextStyle(
//                                             color: Colors.indigo[900],
//                                             fontWeight: FontWeight.w900,
//                                             fontSize: 18)),
//                                     Text("Cash On Delivery",
//                                         style: TextStyle(
//                                             color: Colors.orange[600],
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 16)),
//                                   ],
//                                 ),
//                                 Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: <Widget>[
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: <Widget>[
//                                             Icon(
//                                               Icons.local_mall,
//                                               color: Colors.deepOrange[700],
//                                               size: 20,
//                                             ),
//                                             SizedBox(
//                                               height: 2,
//                                             ),
//                                             Icon(
//                                               Icons.local_bar,
//                                               color: Colors.deepOrange[700],
//                                               size: 20,
//                                             ),
//                                           ],
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: <Widget>[
//                                             //bag count
//                                             Text(" - 3",
//                                                 style: TextStyle(
//                                                     color:
//                                                         Colors.deepOrange[700],
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 15)),
//                                             SizedBox(
//                                               height: 2,
//                                             ),
//                                             //drink count
//                                             Text(" - 6",
//                                                 style: TextStyle(
//                                                     color:
//                                                         Colors.deepOrange[700],
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 15)),
//                                           ],
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 )
//                               ]))),
//                       Divider(
//                         thickness: 2,
//                         color: Colors.orange[600],
//                         height: 15,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 10),
//                         child: Row(
//                           children: <Widget>[
//                             Icon(Icons.supervisor_account,
//                                 size: 25, color: Colors.deepOrange[800]),
//                             Padding(padding: EdgeInsets.all(5)),
//                             Text(
//                               "Supplier",
//                               style: TextStyle(
//                                   color: Colors.indigo[900],
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Card(
//                           child: Column(children: <Widget>[
//                         Padding(
//                             padding: EdgeInsets.all(5),
//                             child: Column(
//                               children: <Widget>[
//                                 ListTile(
//                                   title: Text("Supplier name",
//                                       style: TextStyle(
//                                           color: Colors.orange[600],
//                                           fontWeight: FontWeight.w600)),
//                                   trailing: Icon(
//                                     Icons.account_circle,
//                                     color: Colors.orange[900],
//                                     size: 30,
//                                   ),
//                                 ),
//                                 Divider(
//                                   color: Colors.grey,
//                                   thickness: 1,
//                                 ),
//                                 ListTile(
//                               title: Text(
//                                   "N0.36, Second Lane ,Main Road, Colombo 04",
//                                   style: TextStyle(
//                                       color: Colors.orange[600],
//                                       fontWeight: FontWeight.w600)),
//                               trailing: InkWell(
//                                 child: Icon(
//                                   Icons.directions,
//                                   color: Colors.orange[900],
//                                   size: 30,
//                                 ),
//                                 onTap: () {
//                                   MapsLauncher.launchQuery('Colombo');
//                                 },
//                               ),
//                             ),
//                             Divider(
//                               color: Colors.grey,
//                               thickness: 1,
//                             ),
//                             ListTile(
//                                 title: Text("Contact Supplier",
//                                     style: TextStyle(
//                                         color: Colors.orange[600],
//                                         fontWeight: FontWeight.w600)),
//                                 trailing: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: <Widget>[
//                                     InkWell(
//                                       child: Icon(
//                                         Icons.call,
//                                         color: Colors.orange[900],
//                                         size: 30,
//                                       ),
//                                       onTap: () {
//                                         customLaunch('tel: 123');
//                                       },
//                                     ),
//                                     SizedBox(
//                                       width: 25,
//                                     ),
//                                     InkWell(
//                                       child: Icon(
//                                         Icons.mail,
//                                         color: Colors.orange[900],
//                                         size: 30,
//                                       ),
//                                       onTap: () {
//                                         customLaunch('sms: 123');
//                                       },
//                                     ),
//                                   ],
//                                 )),
//                               ],
//                             )),
//                       ])),
//                       Divider(
//                         thickness: 2,
//                         color: Colors.orange[600],
//                         height: 15,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 10),
//                         child: Row(
//                           children: <Widget>[
//                             Icon(Icons.supervisor_account,
//                                 size: 25, color: Colors.deepOrange[800]),
//                             Padding(padding: EdgeInsets.all(5)),
//                             Text(
//                               "Customer",
//                               style: TextStyle(
//                                   color: Colors.indigo[900],
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Card(
//                           child: Column(children: <Widget>[
//                         Padding(
//                             padding: EdgeInsets.all(5),
//                             child: Column(
//                               children: <Widget>[
//                                 ListTile(
//                                   title: Text("Supplier name",
//                                       style: TextStyle(
//                                           color: Colors.orange[600],
//                                           fontWeight: FontWeight.w600)),
//                                   trailing: Icon(
//                                     Icons.account_circle,
//                                     color: Colors.orange[800],
//                                     size: 30,
//                                   ),
//                                 ),
//                                 Divider(
//                                   color: Colors.grey,
//                                   thickness: 1,
//                                 ),
//                                 ListTile(
//                               title: Text(
//                                   "N0.36, Second Lane ,Main Road, Colombo 04",
//                                   style: TextStyle(
//                                       color: Colors.orange[600],
//                                       fontWeight: FontWeight.w600)),
//                               trailing: InkWell(
//                                 child: Icon(
//                                   Icons.directions,
//                                   color: Colors.orange[900],
//                                   size: 30,
//                                 ),
//                                 onTap: () {
//                                   MapsLauncher.launchQuery('Colombo');
//                                 },
//                               ),
//                             ),
//                             Divider(
//                               color: Colors.grey,
//                               thickness: 1,
//                             ),
//                             ListTile(
//                                 title: Text("Contact Customer",
//                                     style: TextStyle(
//                                         color: Colors.orange[600],
//                                         fontWeight: FontWeight.w600)),
//                                 trailing: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: <Widget>[
//                                     InkWell(
//                                       child: Icon(
//                                         Icons.call,
//                                         color: Colors.orange[900],
//                                         size: 30,
//                                       ),
//                                       onTap: () {
//                                         customLaunch('tel: 123');
//                                       },
//                                     ),
//                                     SizedBox(
//                                       width: 25,
//                                     ),
//                                     InkWell(
//                                       child: Icon(
//                                         Icons.mail,
//                                         color: Colors.orange[900],
//                                         size: 30,
//                                       ),
//                                       onTap: () {
//                                         customLaunch('sms: 123');
//                                       },
//                                     ),
//                                   ],
//                                 )),
//                               ],
//                             )),
//                       ])),
//                       Divider(
//                         thickness: 2,
//                         color: Colors.orange[600],
//                         height: 15,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 10),
//                         child: Row(
//                           children: <Widget>[
//                             Icon(Icons.local_grocery_store,
//                                 size: 25, color: Colors.deepOrange[800]),
//                             Padding(padding: EdgeInsets.all(5)),
//                             Text(
//                               "Order Content",
//                               style: TextStyle(
//                                   color: Colors.indigo[900],
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                           padding: EdgeInsets.all(5),
//                           child:
//                               Column(mainAxisSize: MainAxisSize.min, children: <
//                                   Widget>[
//                             //build list view
//                             ListView.builder(
//                                 shrinkWrap: true,
//                                 itemCount: _data.getLength(),
//                                 itemBuilder: (context, index) {
//                                   return
//                                       //listview card
//                                       Card(
//                                     child: Padding(
//                                       padding: EdgeInsets.all(5),
//                                       child: Row(
//                                         children: <Widget>[
//                                           //item image
//                                           Image.network(
//                                             _data.getImg(index),
//                                             height: 60,
//                                             width: 60,
//                                             fit: BoxFit.cover,
//                                           ),
//                                           Padding(padding: EdgeInsets.all(5)),

//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: <Widget>[
//                                               Text("Item Name ",
//                                                   style: TextStyle(
//                                                       color: Colors.orange[700],
//                                                       fontWeight:
//                                                           FontWeight.w800)),
//                                               SizedBox(
//                                                 height: 5,
//                                               ),
//                                               Text("Quantity",
//                                                   style: TextStyle(
//                                                       color: Colors.orange[700],
//                                                       fontWeight:
//                                                           FontWeight.w800)),
//                                             ],
//                                           ),

//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: <Widget>[
//                                               //item name
//                                               Text(" : " + _data.getName(index),
//                                                   style: TextStyle(
//                                                       color:
//                                                           Colors.orange[600])),
//                                               SizedBox(
//                                                 height: 5,
//                                               ),
//                                               //item quantity
//                                               Text(
//                                                   " : " +
//                                                       _data.getQuantity(index),
//                                                   style: TextStyle(
//                                                       color:
//                                                           Colors.orange[600])),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                             Divider(
//                               thickness: 2,
//                               color: Colors.orange[600],
//                               height: 15,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(top: 10),
//                               child: Row(
//                                 children: <Widget>[
//                                   Icon(Icons.feedback,
//                                       size: 25, color: Colors.deepOrange[800]),
//                                   Padding(padding: EdgeInsets.all(5)),
//                                   Text(
//                                     "Order Remarks",
//                                     style: TextStyle(
//                                         color: Colors.indigo[900],
//                                         fontWeight: FontWeight.w800,
//                                         fontSize: 18),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Card(
//                                 child: Padding(
//                                     padding: EdgeInsets.all(10),
//                                     child: Column(
//                                       children: <Widget>[
//                                         Row(
//                                           children: <Widget>[
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: <Widget>[
//                                                 Text("By Supplier ",
//                                                     style: TextStyle(
//                                                         color:
//                                                             Colors.orange[700],
//                                                         fontWeight:
//                                                             FontWeight.w800)),
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//                                                 Text("By customer ",
//                                                     style: TextStyle(
//                                                         color:
//                                                             Colors.orange[700],
//                                                         fontWeight:
//                                                             FontWeight.w800)),
//                                               ],
//                                             )
//                                           ],
//                                         )
//                                       ],
//                                     ))),
//                             SizedBox(
//                               height: 150,
//                             )
//                           ]))
//                     ]))),
//           ),

//           //Nom-scroll view
//           Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                   padding: EdgeInsets.only(left: 5, right: 5),
//                   child: Card(
//                       shape: RoundedRectangleBorder(
//                           side: BorderSide(color: Colors.deepOrange, width: 2),
//                           borderRadius: BorderRadius.circular(10)),
//                       shadowColor: Colors.deepOrange[900],
//                       color: Colors.grey[50],
//                       child: Padding(
//                           padding: EdgeInsets.all(10),
//                           child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: <Widget>[
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Center(
//                                       child: ConfirmationSlider(
//                                         onConfirmation: () {
//                                           activation == true ?
//                                           Navigator.push(
//                                               context,
//                                               SlideRightRoute(
//                                               page:
//                                                       ArrivedView5())):Container();
//                                         },
//                                         backgroundColor: Colors.grey[100],
//                                         foregroundColor: Colors.deepOrange[600],
//                                         text: "Slide to mark arrived",
//                                         height: 60,
//                                         width: 250,
//                                         textStyle: TextStyle(
//                                             color: Colors.indigo[900],
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: 14),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(padding: EdgeInsets.all(5)),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     SizedBox(
//                                       width: 120.0,
//                                       height: 40.0,
//                                       child: new OutlineButton(
//                                           borderSide: BorderSide(
//                                               width: 1.5,
//                                               color: Colors.deepOrange[700]),
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10)),
//                                           child: Text('Navigate to Customer',
//                                               textAlign: TextAlign.center,
//                                               style: TextStyle(
//                                                   color:
//                                                       Colors.deepOrange[700])),
//                                           onPressed: (() {})),
//                                     ),
//                                     Padding(
//                                         padding:
//                                             EdgeInsets.only(top: 10, left: 10)),
//                                     SizedBox(
//                                       width: 120.0,
//                                       height: 40.0,
//                                       child: new OutlineButton(
//                                           borderSide: BorderSide(
//                                               width: 1.5,
//                                               color: Colors.deepOrange[700]),
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10)),
//                                           child: Text('Dispute',
//                                               style: TextStyle(
//                                                   color:
//                                                       Colors.deepOrange[700])),
//                                           onPressed: () {}),
//                                     ),
//                                   ],
//                                 ),
//                               ])))))
//         ]))));
//   }
// }


// //Page Slide animation
// class SlideRightRoute extends PageRouteBuilder {
//   final Widget page;
//   SlideRightRoute({this.page})
//       : super(
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               page,
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) =>
//               SlideTransition(
//             position: Tween<Offset>(
//               begin: const Offset(-1, 0),
//               end: Offset.zero,
//             ).animate(animation),
//             child: child,
//           ),
//         );
// }