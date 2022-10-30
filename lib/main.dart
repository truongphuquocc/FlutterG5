import 'package:flutter/material.dart';
import 'package:g5/pages/productcart_page.dart';
import 'package:g5/pages/producthome_page.dart';
import 'package:g5/provider/product_provider.dart';
import 'package:provider/provider.dart';

import 'pages/ItemPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
      child: MaterialApp(
        //home: ProductListPage(),
        routes: {
          "/": (context) => HomePage(),
          "cartPage": (context) => CartPage(),
          "itemPage": (context) => ItemPage(),
        },
      ),
    ),
  );
}
