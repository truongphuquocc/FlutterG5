import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:g5/Model/product_model.dart';
import 'package:http/http.dart' as http;

import '../Model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> list = [];

  void getCategories() async {
    var url = "https://fakestoreapi.com/products/categories";
    var client = http.Client();
    var rs = await client.get(Uri.parse(url));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;

    list = jsonObject.map((e) {
      return CategoryModel.fromJson(e);
    }).toList();

    notifyListeners();
  }
}
