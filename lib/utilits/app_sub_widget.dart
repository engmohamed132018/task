import 'package:flutter/material.dart';

class SubWidget {
  static buildTitle() {
    return const Text(
      'ad category',
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff329D9C)),
    );
  }

  static AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const BackButton(
        color: Colors.black,
      ),
      centerTitle: true,
      title: const Text(
        'sell now',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
