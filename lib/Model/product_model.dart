import 'package:flutter/cupertino.dart';

class ProductModel with ChangeNotifier {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  int count = 1;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
    this.rating,
    this.count = 1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var p = ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: Rating.fromJson(json['rating']));
    return p;
  }
  void addOne() async {
    this.count = this.count + 1;
  }

  void minusOne(List<ProductModel> listCart) async {
    if (this.count == 1)
      listCart.remove(this);
    else
      this.count = this.count - 1;
  }
}

class Rating {
  num? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    var data = Rating(rate: json['rate'], count: json['count']);
    return data;
  }
}
