import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  VoidCallback onPressed;
  double height;
  double width;
  String text;

  CustomButton(
      {super.key,
      required this.onPressed,
      required this.width,
      this.height = 55,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        shadowColor: Colors.transparent,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff7BE495),
                    Color(0xff329D9C),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
