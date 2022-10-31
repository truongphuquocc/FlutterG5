import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:g5/Model/product_model.dart';
import 'package:provider/provider.dart';
import '../Widgets/ItemAppBar.dart';

import '../provider/product_provider.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);
  @override
  State<ItemPage> createState() => _ItemPage();
}

class _ItemPage extends State<ItemPage> {
  List<Color> Clrs = [
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.grey,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    ProductModel temp = pp.detail;

    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          ItemAppBar(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.network(temp.image ?? ""),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Row(
                        children: [
                          Text(
                            temp.title ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFee4d2d),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: (temp.rating?.rate ?? 0).toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color(0xFFee4d2d),
                            ),
                            onRatingUpdate: (index) {},
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                    color: Color(0xFF333333),
                                  ),
                                  onPressed: () => temp.minusOne(pp.listCart),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  temp.count.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF333333)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: IconButton(
                                  icon: Icon(
                                    CupertinoIcons.plus,
                                    size: 18,
                                    color: Color(0xFF333333),
                                  ),
                                  onPressed: () => temp.addOne(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        temp.description ?? "",
                        style:
                            TextStyle(fontSize: 17, color: Color(0xFF333333)),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 8),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "size",
                    //         style: TextStyle(
                    //             fontSize: 18,
                    //             color: Color(0xFF333333),
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Row(
                    //         children: [
                    //           for (int i = 5; i < 10; i++)
                    //             Container(
                    //               height: 30,
                    //               width: 30,
                    //               alignment: Alignment.center,
                    //               margin: EdgeInsets.symmetric(horizontal: 5),
                    //               decoration: BoxDecoration(
                    //                   color: Colors.white,
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   boxShadow: [
                    //                     BoxShadow(
                    //                         color: Colors.grey.withOpacity(0.5),
                    //                         spreadRadius: 2,
                    //                         blurRadius: 8)
                    //                   ]),
                    //               child: Text(
                    //                 i.toString(),
                    //                 style: TextStyle(
                    //                     fontSize: 18,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: Color(0xFF333333)),
                    //               ),
                    //             )
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 8),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "Colors",
                    //         style: TextStyle(
                    //             fontSize: 18,
                    //             color: Color(0xFF333333),
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Row(
                    //         children: [
                    //           for (int i = 0; i < 5; i++)
                    //             Container(
                    //               height: 30,
                    //               width: 30,
                    //               alignment: Alignment.center,
                    //               margin: EdgeInsets.symmetric(horizontal: 5),
                    //               decoration: BoxDecoration(
                    //                   color: Clrs[i],
                    //                   borderRadius: BorderRadius.circular(30),
                    //                   boxShadow: [
                    //                     BoxShadow(
                    //                         color: Colors.grey.withOpacity(0.5),
                    //                         spreadRadius: 2,
                    //                         blurRadius: 8)
                    //                   ]),
                    //             )
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$ " + (((temp.price!.toInt()) * temp.count).toString()),
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFee4d2d)),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  pp.addToCart(
                    temp.count,
                    temp.id,
                    temp.title,
                    temp.price,
                    temp.description,
                    temp.category,
                    temp.image,
                    temp.rating,
                  );
                });
              },
              icon: Icon(CupertinoIcons.cart_badge_plus),
              label: Text(
                "Add too cart",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFee4d2d)),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
            )
          ],
        ),
      ),
    );
  }
}
