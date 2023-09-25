import 'package:flutter/material.dart';
import 'package:task/widgets/custom_button.dart';

import '../../utilits/app_sub_widget.dart';
import '../../utilits/size.dart';

// ignore: must_be_immutable
class Notification5 extends StatelessWidget {
  Notification5(
      {super.key,
      required this.categoryName,
      required this.cardName,
      required this.item});
  late AppSize _appSize;
  final String categoryName, cardName, item;

  @override
  Widget build(BuildContext context) {
    _appSize = AppSize(context: context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SubWidget.buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: _appSize.getWidthSize(31)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _appSize.getHeightSize(40),
            ),
            buildItem(item: categoryName),
            SizedBox(
              height: _appSize.getHeightSize(13),
            ),
            const Divider(),
            buildItem(item: cardName),
            SizedBox(
              height: _appSize.getHeightSize(13),
            ),
            const Divider(),
            buildItem(item: item),
            const Divider(),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {},
                  width: _appSize.getWidthSize(296),
                  text: 'Next',
                  height: _appSize.getHeightSize(55),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  Row buildItem({required String item}) {
    return Row(
      children: [
        const Icon(
          Icons.done,
          color: Colors.green,
        ),
        SizedBox(
          width: _appSize.getWidthSize(20),
        ),
        Text(
          item,
          style: TextStyle(
              fontSize: _appSize.getHeightSize(13),
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
