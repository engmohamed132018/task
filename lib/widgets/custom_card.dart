import 'package:flutter/material.dart';

import '../utilits/size.dart';

class CustomCard extends StatelessWidget {
  final VoidCallback onpressed;

  final String text;

  const CustomCard(
      {super.key,
      required AppSize appSize,
      required this.onpressed,
      required this.text})
      : _appSize = appSize;

  final AppSize _appSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: _appSize.screenHeight * (55 / _appSize.screenHeight),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Color(0xffffffff),
            ),
            BoxShadow(
              color: Color(0xff329D9C).withOpacity(.13),
              blurRadius: 34,
              offset: Offset(0, 13),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _appSize.getWidthSize(20)),
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            const Spacer(),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.green, shape: BoxShape.circle),
                child: const Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
