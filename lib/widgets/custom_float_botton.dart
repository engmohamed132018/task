import 'package:flutter/material.dart';

import '../screens/notification/notification_1.dart';
import '../utilits/size.dart';

class CustomFloatActionBotton extends StatelessWidget {
  const CustomFloatActionBotton({
    super.key,
    required AppSize appSize,
  }) : _appSize = appSize;

  final AppSize _appSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => Notification1())),
      child: Container(
        width: _appSize.screenWidth * 0.1642512077,
        height: _appSize.screenWidth * 0.1642512077,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(focal: Alignment.topCenter, colors: [
            Color(0xff7BE495),
            Color(0xff329D9C),
          ]),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: _appSize.screenWidth * 0.05555555556,
        ),
      ),
    );
  }
}
