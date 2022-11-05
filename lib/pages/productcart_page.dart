import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g5/Widgets/CartBottomNavBar.dart';
import 'package:g5/Widgets/cartappbarwidget.dart';
import 'package:g5/Widgets/cartitemsampleswidget.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class Cart_Page extends StatefulWidget {
  Cart_Page({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return CartPage();
  }
}

class CartPage extends State<Cart_Page> {
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          CartAppBar(),
          if ((pp.listCart.length) != 0)
            Column(
              children: [
                //CartItemSamples(),

                ...pp.listCart.map((e) {
                  return Column(
                    children: [
                      Container(
                        height: 135,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              margin: EdgeInsets.only(right: 10),
                              child: Image.network(e.image.toString()),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 5,
                                    left: 10,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // margin: EdgeInsets.only(right: 70),
                                        width: 220,
                                        height: 50,
                                        child: Text(
                                          e.title ?? "",
                                          //"title",
                                          overflow: TextOverflow.clip,
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF34007E)),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            e.removeAnItemCart(pp.listCart);
                                          });
                                        },
                                        icon: Icon(Icons.delete,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 50),
                                        width: 90,
                                        child: Text(
                                          "${(e.price! * (e.count).toDouble()).floor()}\$",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF34007E)),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            //padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 1,
                                                    blurRadius: 10,
                                                  )
                                                ]),
                                            child: IconButton(
                                                iconSize: 1,
                                                onPressed: () {
                                                  setState(() {
                                                    e.addOne();
                                                  });
                                                },
                                                icon: Icon(
                                                  CupertinoIcons.plus,
                                                  size: 18,
                                                )),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              e.count.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF34007E)),
                                            ),
                                          ),
                                          Container(
                                            //padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 1,
                                                    blurRadius: 10,
                                                  )
                                                ]),
                                            child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    e.minusOne(pp.listCart);
                                                  });
                                                },
                                                icon: Icon(
                                                  CupertinoIcons.minus,
                                                  size: 18,
                                                )),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ],
            )
          else
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFee4d2d),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Mua them hang di thang lon",
                      style: TextStyle(
                          color: Color(0xFFee4d2d),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    color: Color(0xFFee4d2d),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${pp.totalPrice().floor().toString()}\$",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              ],
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFee4d2d),
                borderRadius: BorderRadius.circular(15),
              ),
              child: (Text(
                "Check out",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
