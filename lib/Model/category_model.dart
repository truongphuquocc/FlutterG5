class CategoryModel {
  String? category;

  CategoryModel({
    this.category,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    var p = CategoryModel(category: json['category']);

    return p;
  }
}
