import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  List<String> _cardList = [];
  String cartName = "";
  set setList(List<String> list) => _cardList = list;
  List<String> get cardList => _cardList;
  addCardName(String name) {
    cartName = name;
    notifyListeners();
  }
}
