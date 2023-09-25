import 'package:flutter/material.dart';
import 'package:task/utilits/size.dart';

// ignore: must_be_immutable
class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({super.key});
  late int index = 0;
  late AppSize _appSize;

  @override
  Widget build(BuildContext context) {
    _appSize = AppSize(context: context);
    return BottomAppBar(
      color: Colors.white,
      elevation: 0,
      shape: CircularNotchedRectangle(),
      notchMargin: 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(icon: Icons.home_rounded, index: 0, onpresed: () {}),
          _buildIcon(icon: Icons.search_rounded, index: 1, onpresed: () {}),
          Opacity(
              opacity: 0,
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.favorite_border_rounded))),
          _buildIcon(
              icon: Icons.favorite_border_rounded, index: 2, onpresed: () {}),
          _buildIcon(icon: Icons.person_3_rounded, index: 3, onpresed: () {}),
        ],
      ),
    );
  }

  _buildIcon(
      {required IconData icon,
      required int index,
      required VoidCallback onpresed}) {
    return GestureDetector(
      onTap: onpresed,
      child: Icon(
        size: _appSize.screenWidth * 0.0579710145,
        icon,
        color: this.index == index ? Colors.black : Color(0xFFCDE0C9),
      ),
    );
  }
}
