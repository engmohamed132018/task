// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/card_provider.dart';
import 'package:task/utilits/app_sub_widget.dart';
import 'package:task/widgets/custom_button.dart';

import '../../provider/cetegory_provider.dart';
import '../../utilits/size.dart';
import '../../widgets/custom_card.dart';
import 'notification_4.dart';

class Notification3 extends StatelessWidget {
  final List<String> cardList;
  final String card;
  List<String> list = [];
  Notification3({super.key, required this.cardList, required this.card});
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
        padding: EdgeInsets.symmetric(horizontal: _appSize.getWidthSize(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubWidget.buildTitle(),
            const SizedBox(
              height: 30,
            ),
            CustomCard(appSize: _appSize, onpressed: () {}, text: card),
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
          if (provider.cartName.isNotEmpty) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => Notification4(
                    categoryList:
                        Provider.of<CategoryProvider>(context).categoryList,
                    cardName: provider.cartName,
                    categoryName: card)));
          }
        },
        width: _appSize.getWidthSize(282),
        text: 'Submit',
        height: _appSize.getHeightSize(55),
      ));
    });
  }

  Expanded _buildBottomSheetList(CardProvider value) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.all(_appSize.getHeightSize(30)),
        separatorBuilder: (context, index) => Divider(),
        itemCount: value.cardList.length,
        itemBuilder: (context, index) {
          final card = value.cardList[index];

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
            color: const Color(0xff329D9C),
            fontSize: _appSize.size16,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  buildItem({required String card}) {
    return GestureDetector(
      onTap: () {
        provider.addCardName(card);
      },
      child: Container(
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
            provider.cartName == card
                ? const Icon(
                    Icons.done,
                    color: Colors.green,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
