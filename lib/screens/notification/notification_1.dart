// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/cetegory_provider.dart';
import 'package:task/screens/notification/notificatin_2.dart';
import 'package:task/widgets/custom_button.dart';

import '../../utilits/app_sub_widget.dart';
import '../../utilits/size.dart';
import '../../widgets/custom_card.dart';

class Notification1 extends StatelessWidget {
  Notification1({super.key});
  late AppSize _appSize;
  late CategoryProvider provider;
  @override
  Widget build(BuildContext context) {
    _appSize = AppSize(context: context);
    provider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SubWidget.buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 31),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubWidget.buildTitle(),
            const SizedBox(
              height: 30,
            ),
            Builder(builder: (context) {
              return CustomCard(
                appSize: _appSize,
                onpressed: () => _openbotomsheet(context),
                text: 'category',
              );
            }),
          ],
        ),
      ),
    );
  }

  _openbotomsheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      )),
      elevation: 1,
      context: context,
      builder: (context) {
        return Consumer<CategoryProvider>(builder: (context, value, child) {
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
              if (provider.categoryName.isNotEmpty) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => Notification2(
                          categoryList: provider.categoryList,
                          category: provider.categoryName,
                        )));
              }
            },
            width: _appSize.screenWidth * (282 / _appSize.screenWidth),
            text: 'Submit',
            height: _appSize.screenHeight * (55 / _appSize.screenHeight)),
      );
    });
  }

  Expanded _buildBottomSheetList(CategoryProvider value) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.all(30),
        separatorBuilder: (context, index) => Divider(),
        itemCount: value.categoryList.length,
        itemBuilder: (context, index) {
          final category = value.categoryList[index].name!;

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: buildItem(category: category),
          );
        },
      ),
    );
  }

  Padding _buildBottomSheetTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: _appSize.size20),
      child: Text(
        'select Category',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: const Color(0xff329D9C),
            fontSize: _appSize.size16,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  buildItem({required String category}) {
    return GestureDetector(
      onTap: () {
        provider.addCategoryName(category);
      },
      child: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style: TextStyle(
                  fontSize:
                      _appSize.screenHeight * (13 / _appSize.screenHeight),
                  fontWeight: FontWeight.w500),
            ),
            provider.categoryName == category
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
