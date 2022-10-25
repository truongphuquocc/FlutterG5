import 'package:flutter/material.dart';
import 'package:g5/provider/product_provider.dart';
import 'package:provider/provider.dart';

import 'Model/product_model.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    provider.getProducts();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        //scrollDirection: Axis.vertical,
        children: [
          ...provider.list.map((e) {
            return Column(
              children: [
                Container(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .5,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)))),
                )
              ],
            );
          }).toList()
          // ...provider.list.map((e) {
          //   return Text(e.title ?? "");
          // }).toList()
        ],
      ),
    );
  }
}
