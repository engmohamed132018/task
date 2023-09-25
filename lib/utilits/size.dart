import 'package:flutter/material.dart';

class AppSize {
  final BuildContext context;

  AppSize({required this.context});

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  double get size20 => screenWidth * 0.048309;
  double get size16 => screenWidth * 0.0386473;
  double get size151 => screenWidth * 0.3647343;

  double get size189 => screenHeight * 0.1934493347;
  double get size113 => screenHeight * 0.1156601842;
  double getWidthSize(int width) {
    return screenWidth * (width / screenWidth);
  }

  double getHeightSize(int height) {
    return screenHeight * (height / screenHeight);
  }
}
