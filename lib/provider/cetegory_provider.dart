import 'package:flutter/material.dart';
import 'package:task/model/category_model.dart';

class CategoryProvider with ChangeNotifier {
  String categoryName = "";
  String categorySubName = "";
  List<Category> _categoryList = [];

  set setList(List<Category> list) => _categoryList = list;
  List<Category> get categoryList => _categoryList;
  addCategoryName(String name) {
    categoryName = name;
    notifyListeners();
  }

  addCategorySubName(String name) {
    categorySubName = name;
    notifyListeners();
  }
}
