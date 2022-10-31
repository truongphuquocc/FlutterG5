import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g5/Model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<ProductModel> list = [];
  List<ProductModel> listTemp = [];
  List<ProductModel> listCart = [];
  List<String> listCategory = [];
  List<ProductModel> listCategorySelected = [];
  ProductModel detail = new ProductModel();

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

  static getProductsByID({required int id}) async {
    var url = "https://fakestoreapi.com/products/$id";
    var client = http.Client();
    var rs = await client.get(Uri.parse(url));

    // print("response ${jsonDecode(response.body)}");
    var data = jsonDecode(rs.body);
    return ProductModel.fromJson(data);
  }

  void addToCart(int count, int? id, String? title, num? price,
      String? description, String? category, String? image, Rating? rating) {
    bool check = false;
    for (int i = 0; i < listCart.length; i++)
      if (listCart[i].id == id) {
        listCart[i].addOne();
        check = true;
        return;
      }

    ProductModel p = new ProductModel(
        count: count,
        id: id,
        title: title,
        description: description,
        category: category,
        image: image,
        price: price,
        rating: rating);
    listCart.add(p);
  }

  double totalPrice() {
    double ans = 0.0;
    for (int i = 0; i < listCart.length; i++) {
      ans += (listCart[i].price! * listCart[i].count);
    }
    return ans;
  }
}
