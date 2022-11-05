import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g5/pages/productcart_page.dart';
import 'package:provider/provider.dart';
import '../Widgets/productappbar_page.dart';
import '../Widgets/productcategorywidgets.dart';
import '../Widgets/productitemwidget.dart';
import '../provider/product_provider.dart';
import 'ItemPage.dart';

class Home_Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

class HomePage extends State<Home_Page> {
  String keyword = "";

  @override
  void initState() {
    super.initState();
    keyword = "";
    var sr = Provider.of<ProductProvider>(context, listen: false);
    sr.search(keyword);
  }

  @override
  Widget build(BuildContext context) {
    var pp = Provider.of<ProductProvider>(context);
    if (pp.list.isEmpty) pp.getProducts();
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            // height: 500,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                //Search
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextField(
                          onSubmitted: (content) async {
                            if (content != "") {
                              setState(() {
                                keyword = content;
                                pp.search(
                                  keyword,
                                );
                              });
                            } else {
                              setState(() {
                                keyword = "";
                                pp.search("");
                              });
                            }
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here ..."),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.search_rounded,
                        size: 27,
                        color: Color(0xFF333333),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFee4d2d),
                    ),
                  ),
                ),

                //Category
                //Categories(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...pp.listCategory.map((e) {
                        return Container(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.white, // background (button) color
                                foregroundColor: Color(
                                    0xFFee4d2d), // foreground (text) color
                              ),
                              onPressed: () {
                                setState(() {
                                  pp.category = e.toString();
                                  pp.checkProduct();
                                });
                              },
                              child: Text(e)),
                        ));
                      }).toList()
                    ],
                  ),
                ),

                //Items
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Product",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFee4d2d),
                    ),
                  ),
                ),

                //Product_Item(),
                GridView.count(
                  childAspectRatio: 0.75,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: [
                    ...pp.list.map((e) {
                      return Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                pp.detail = e;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemPage()),
                                );
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          onTap: (index) {},
          height: 70,
          color: Color(0xFFee4d2d),
          items: [
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              CupertinoIcons.cart_fill,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.list,
              size: 30,
              color: Colors.white,
            ),
          ]),
    );
  }
}
