import 'package:flutter/material.dart';

import '../provider/card_provider.dart';
import '../utilits/size.dart';
import 'custom_card.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.provider,
    required AppSize appSize,
    required this.list,
  }) : _appSize = appSize;

  final CardProvider provider;
  final AppSize _appSize;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: provider.cardList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: CustomCard(
              appSize: _appSize,
              onpressed: () {},
              text: list[index],
            ),
          );
        });
  }
}
