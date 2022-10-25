import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g5/Model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<ProductModel> list = [];

  void getProducts() async {
    var url = "https://fakestoreapi.com/products";
    var client = http.Client();
    var rs = await client.get(Uri.parse(url));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;

    list = jsonObject.map((e) {
      return ProductModel.fromJson(e);
    }).toList();

    notifyListeners();
  }
}
