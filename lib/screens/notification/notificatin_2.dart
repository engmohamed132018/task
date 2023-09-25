// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/model/category_model.dart';
import 'package:task/provider/card_provider.dart';
import 'package:task/screens/notification/notification_3.dart';
import 'package:task/utilits/app_sub_widget.dart';
import 'package:task/widgets/custom_button.dart';
import 'package:task/widgets/custom_list_view.dart';

import '../../utilits/size.dart';
import '../../widgets/custom_card.dart';

class Notification2 extends StatelessWidget {
  final List<Category> categoryList;
  final String category;
  List<String> list = [];
  Notification2(
      {super.key, required this.categoryList, required this.category});
  late AppSize _appSize;
  late CardProvider provider;
  @override
  Widget build(BuildContext context) {
    _appSize = AppSize(context: context);
    provider = Provider.of<CardProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SubWidget.buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: _appSize.getHeightSize(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubWidget.buildTitle(),
            const SizedBox(
              height: 30,
            ),
            CustomCard(appSize: _appSize, onpressed: () {}, text: category),
            Expanded(
              child: buildWidegets(),
            ),
            Center(
              child: CustomButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => Notification3(
                            cardList: provider.cardList, card: category)));
                  },
                  width: _appSize.getWidthSize(296),
                  text: 'Next',
                  height: _appSize.getHeightSize(55)),
            ),
          ],
        ),
      ),
    );
  }

  buildWidegets() {
    getdata();

    return CustomListView(provider: provider, appSize: _appSize, list: list);
  }

  void getdata() {
    categoryList
        .where((element) => element.name == category)
        .forEach((element) {
      element.cards!.forEach((e) {
        if (list.contains(e.category)) {
        } else {
          list.add(e.category!);
        }
      });
    });
    provider.setList = list;
  }
}
