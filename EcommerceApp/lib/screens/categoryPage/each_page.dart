// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation

import 'package:ecommerece_velocity_app/components/default_button.dart';
import 'package:ecommerece_velocity_app/helper/appcolors.dart';
import 'package:ecommerece_velocity_app/models/subcategory.dart';
import 'package:ecommerece_velocity_app/screens/categoryPage/category_list_page.dart';
import 'package:ecommerece_velocity_app/screens/categoryPage/detailspage.dart';
import 'package:flutter/material.dart';

class EachProduct extends StatefulWidget {
  int amount = 0;
  double price = 0.00;
  final Products? prods;
  final int index;
  EachProduct(this.prods, this.index);
  // ignore: prefer_typing_uninitialized_variables
  // late var long2;
  // final ProductList prods;
  // EachProduct(this.prods);

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<EachProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Item'),
          backgroundColor: Colors.green,
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      //topLeft: Radius.circular(50),
                      //topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://loremflickr.com/320/240/music?lock=$widget.index'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned.fill(
                          child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent
                          ])))),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(), //can be used to show icon
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${widget.prods!.productsList[widget.index].name}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      '${widget.prods!.productsList[widget.index].formatedPrice}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          //This widget for displaying dart quantity
                          right: 20,
                          top: 100,
                          child: Container(
                              // padding: EdgeInsets.only(
                              //     top: 5, left: 15, right: 15, bottom: 8),
                              // decoration: BoxDecoration(
                              //     color: AppColors.MAIN_COLOR,
                              //     borderRadius: BorderRadius.circular(20),
                              //     boxShadow: [
                              //       BoxShadow(
                              //           color: Colors.black.withOpacity(0.5),
                              //           blurRadius: 20,
                              //           offset: Offset.zero)
                              //     ]),
                              // child: Row(children: [
                              //   Text('3', // its hardcoded for now
                              //       style: TextStyle(
                              //           color: Colors.white, fontSize: 15)
                              //           )
                              // ]
                              // )
                              )),
                      // AppBar(
                      //     //title: Text('Details'),
                      //     //backgroundColor: Color.fromRGBO(46, 204, 113, 1),
                      //     ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Text(widget
                              .prods!.productsList[widget.index].description
                              .substring(
                                  3,
                                  widget.prods!.productsList[widget.index]
                                          .description.length -
                                      4)),
                          // ),
                          // Container(
                          //   height: 200,
                          //   child: ListView.builder(
                          //     scrollDirection: Axis.horizontal,
                          //     itemCount: widget.subCategory.parts.length,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return GestureDetector(
                          //         onTap: () {
                          //           //todo change the selection state of each part
                          //           // setState(() {
                          //           //   widget.subCategory.parts
                          //           //       .forEach((CategoryPart part) {
                          //           //     part.isSelected =
                          //           //         widget.subCategory.parts[index] == part;
                          //           //   });
                          //           // });
                          //         },
                          //         child: Column(
                          //           children: [
                          //             Container(
                          //               margin: EdgeInsets.all(15),
                          //               width: 120,
                          //               height: 140,
                          //               decoration: BoxDecoration(
                          //                   border: widget.subCategory.parts[index]
                          //                           .isSelected
                          //                       ? Border.all(
                          //                           color: widget.subCategory.color,
                          //                           width: 7)
                          //                       : null,
                          //                   borderRadius: BorderRadius.circular(25),
                          //                   image: DecorationImage(
                          //                       image: AssetImage(
                          //                           'assets/images/testImages/' +
                          //                               widget.subCategory
                          //                                   .parts[index].imgName +
                          //                               '.png'),
                          //                       fit: BoxFit.cover),
                          //                   boxShadow: [
                          //                     BoxShadow(
                          //                         color:
                          //                             Colors.black.withOpacity(0.1),
                          //                         offset: Offset.zero,
                          //                         blurRadius: 10)
                          //                   ]),
                          //             ),
                          //             Container(
                          //                 child: Text(
                          //                     widget.subCategory.parts[index].name,
                          //                     textAlign: TextAlign.left,
                          //                     style: TextStyle(
                          //                         color: widget.subCategory.color)))
                          //           ],
                          //         ),
                          //       );
                          //     },
                          //   ),
                        ),
                        Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text.rich(TextSpan(children: [
                              // TextSpan(text: 'Add to cart:'),
                              // TextSpan(
                              //     text: 'Add to cart:',
                              //     style: TextStyle(fontWeight: FontWeight.bold)),
                            ])),
                          ),
                          Container(
                              height: 60.0,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        offset: Offset.zero,
                                        color: Colors.black.withOpacity(0.1))
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: widget.amount > 0
                                        ? () {
                                            //decrement
                                            setState(() {
                                              widget.amount--;
                                              var long2 = double.parse(widget
                                                  .prods!
                                                  .productsList[widget.index]
                                                  .price);
                                              widget.price =
                                                  widget.amount * long2;
                                            });
                                          }
                                        : null,
                                    child: Icon(
                                        Icons.remove_circle_outline_sharp,
                                        size: 40,
                                        color: AppColors.MAIN_COLOR),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Center(
                                        child: Text.rich(TextSpan(children: [
                                          TextSpan(
                                              text: widget.amount.toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          // TextSpan(
                                          //     text: 'lbs',
                                          //     style: TextStyle(fontSize: 20)
                                          //     ),
                                        ])),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //Increment
                                      setState(() {
                                        widget.amount++;
                                        var long2 = double.parse(widget.prods!
                                            .productsList[widget.index].price);
                                        widget.price = widget.amount * long2;
                                      });
                                    },
                                    child: Icon(Icons.add_circle_outline_sharp,
                                        size: 40, color: AppColors.MAIN_COLOR),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 20, left: 20, bottom: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text.rich(TextSpan(children: [
                                    TextSpan(text: 'Total Price: '),
                                    TextSpan(
                                        text: ' \$ ${widget.price}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ])),
                                ]),
                          ),
                        ]),
                        // Spacer(flex: 1),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 20, left: 20, bottom: 10),
                          child: DefaultButton(
                            text: "Add to cart",
                            press: () {
                              // Navigator.of(context).pushAndRemoveUntil(
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //         bottomBar()
                              //         ),
                              //     (Route<dynamic> route) =>
                              //         true); //change bottomBar to SignInPage
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
