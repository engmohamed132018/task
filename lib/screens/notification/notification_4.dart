// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/model/cards_models.dart';
import 'package:task/provider/cat_card_provider.dart';

import '../../model/category_model.dart';
import '../../provider/card_provider.dart';
import '../../utilits/app_sub_widget.dart';
import '../../utilits/size.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_card.dart';
import 'notification_5.dart';

class Notification4 extends StatelessWidget {
  final List<Category> categoryList;
  final String cardName;
  final String categoryName;
  Notification4(
      {super.key,
      required this.categoryList,
      required this.cardName,
      required this.categoryName});

  late AppSize _appSize;
  late CardProvider provider;
  late CartCardProvider cartCardProvider;
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    _appSize = AppSize(context: context);
    provider = Provider.of<CardProvider>(context);
    cartCardProvider = Provider.of<CartCardProvider>(context);
    getSubData();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SubWidget.buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: _appSize.getWidthSize(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubWidget.buildTitle(),
            const SizedBox(
              height: 30,
            ),
            CustomCard(appSize: _appSize, onpressed: () {}, text: categoryName),
            SizedBox(
              height: _appSize.getHeightSize(20),
            ),
            CustomCard(appSize: _appSize, onpressed: () {}, text: cardName),
            SizedBox(
              height: _appSize.getHeightSize(20),
            ),
            CustomCard(
                appSize: _appSize,
                onpressed: () => _openbotomsheet(context),
                text: 'Sub Category'),
          ],
        ),
      ),
    );
  }

  _openbotomsheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(_appSize.getHeightSize(24)),
      )),
      elevation: 1,
      context: context,
      builder: (context) {
        return Consumer<CardProvider>(builder: (context, value, child) {
          return Column(
            children: [
              _buildBottomSheetTitle(context),
              _buildBottomSheetList(value),
              buildBottomSheetSubmit(),
            ],
          );
        });
      },
    );
  }

  buildBottomSheetSubmit() {
    return Builder(builder: (context) {
      return Center(
        child: CustomButton(
            onPressed: () {
              if (cartCardProvider.cartCardName.isNotEmpty) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => Notification5(
                        item: cartCardProvider.cartCardName,
                        cardName: provider.cartName,
                        categoryName: categoryName)));
              }
            },
            width: _appSize.getWidthSize(282),
            text: 'Submit',
            height: _appSize.getHeightSize(55)),
      );
    });
  }

  Expanded _buildBottomSheetList(CardProvider value) {
    getSubData();
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.all(_appSize.getHeightSize(30)),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final card = list[index];

          return Padding(
            padding: EdgeInsets.symmetric(vertical: _appSize.getHeightSize(20)),
            child: buildItem(card: card),
          );
        },
      ),
    );
  }

  Padding _buildBottomSheetTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _appSize.size20),
      child: Text(
        'Sub select Category',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Color(0xff329D9C),
            fontSize: _appSize.size16,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  buildItem({required String card}) {
    return GestureDetector(
      onTap: () {
        cartCardProvider.addCartCardName(card);
      },
      child: Consumer<CartCardProvider>(builder: (context, value, child) {
        return Container(
          height: _appSize.getHeightSize(42),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                card,
                style: TextStyle(
                    fontSize: _appSize.getHeightSize(13),
                    fontWeight: FontWeight.w500),
              ),
              cartCardProvider.cartCardName == card
                  ? const Icon(
                      Icons.done,
                      color: Colors.green,
                    )
                  : Container(),
            ],
          ),
        );
      }),
    );
  }

  void getSubData() {
    final data =
        categoryList.where((element) => element.name == categoryName).toList();
    List<Cards>? data2;
    for (var e in data) {
      data2 =
          e.cards!.where((element) => element.category == cardName).toList();
    }

    for (var element in data2!) {
      element.name!.forEach((element) {
        if (!list.contains(element)) {
          list.add(element);
        }
      });
    }
  }
}
