import 'package:g5/Model/product_model.dart';
import 'package:g5/pages/ItemPage.dart';
import 'package:g5/provider/product_provider.dart';
import 'package:g5/provider/product_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class Product_Item extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductItem();
  }
}

class ProductItem extends State<Product_Item> {
  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    pp.getProducts();
    return GridView.count(
      childAspectRatio: 0.75,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        ...pp.list.map((e) {
          return Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   padding: EdgeInsets.all(5),
                    //   decoration: BoxDecoration(

                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    //   child: Text(
                    //     "",
                    //     style: TextStyle(
                    //         fontSize: 14,
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Icon(
                    //   Icons.favorite_border,
                    //   color: Colors.red,
                    // )
                  ],
                ),
                InkWell(
                  onTap: () {
                    pp.detail = e;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ItemPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.network(
                      e.image ?? "",
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 1),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    e.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${e.price ?? 0}\$",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFee4d2d),
                        ),
                      ),
                      // Icon(
                      //   Icons.shopping_cart_checkout,
                      //   color: Color(0xFFee4d2d),
                      // ),
                      IconButton(
                          icon: Icon(
                            Icons.shopping_cart_checkout,
                            color: Color(0xFFee4d2d),
                          ),
                          onPressed: () {
                            setState(() {
                              pp.addToCart(
                                e.count,
                                e.id,
                                e.title,
                                e.price,
                                e.description,
                                e.category,
                                e.image,
                                e.rating,
                              );
                            });
                          }),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                      ),
                      Text(
                        "${e.rating?.rate ?? 0}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList()
      ],
    );
  }
}
