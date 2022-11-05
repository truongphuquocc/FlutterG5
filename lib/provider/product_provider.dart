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
  String category = "none";
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
    this.getCateglory();
  }

  void getCateglory() async {
    this.list.map((e) {
      if (!listCategory.contains(e.category.toString())) {
        listCategory.add(e.category.toString());
      }
    }).toList();
  }

  void checkProduct() async {
    if (category != "none") {
      for (int i = 0; i < list.length; i++) {
        if (list[i].category != category) {
          list.removeAt(i);
          i--;
        }
      }
    }
  }

  void removeCart() async {
    listCart.remove(listCart);
  }

  static getProductsByID({required int id}) async {
    var url = "https://fakestoreapi.com/products/$id";
    var client = http.Client();
    var rs = await client.get(Uri.parse(url));

    // print("response ${jsonDecode(response.body)}");
    var data = jsonDecode(rs.body);
    return ProductModel.fromJson(data);
  }

  void search(String key) async {
    var url = "https://fakestoreapi.com/products";
    var client = http.Client();
    var rs = await client.get(Uri.parse(url));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;

    if (key != "" && key.isNotEmpty) {
      var listSearch = jsonObject.map((e) {}).toList();
      List<ProductModel> result = [];
      for (int i = 0; i < listSearch.length; i++) {
        var item = listSearch[i];
        final check = item.title?.toLowerCase().contains(key.toLowerCase());

        if (check ?? false) {
          result.add(item);
        }
      }
      list = result;
    }
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
