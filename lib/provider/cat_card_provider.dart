import 'package:flutter/material.dart';

class CartCardProvider with ChangeNotifier {
  List<String> _cartCardList = [];
  String cartCardName = "";
  set setList(List<String> list) => _cartCardList = list;
  List<String> get cardList => _cartCardList;
  addCartCardName(String name) {
    cartCardName = name;
    notifyListeners();
  }
}
