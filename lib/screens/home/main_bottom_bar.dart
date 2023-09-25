import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/apiHelper/category.dart';
import 'package:task/model/cards_models.dart';
import 'package:task/model/category_model.dart';
import 'package:task/provider/cetegory_provider.dart';
import 'package:task/utilits/font_size.dart';
import 'package:task/utilits/size.dart';

import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/custom_float_botton.dart';

class MainBottomBar extends StatefulWidget {
  const MainBottomBar({super.key});

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  late AppSize _appSize;
  late AppFonts _appFonts;

  @override
  Widget build(BuildContext context) {
    _appSize = AppSize(context: context);
    _appFonts = AppFonts(context: context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatActionBotton(appSize: _appSize),
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: Container(
        padding: EdgeInsets.only(
            left: _appSize.size16,
            right: _appSize.size16,
            top: _appSize.getHeightSize(64)),
        child: Column(
          children: [
            _buildAppBAr(),
            SizedBox(
              height: _appSize.size16,
            ),
            _buildSearchBar(),
            _buildMainList(),
          ],
        ),
      ),
    );
  }

  Expanded _buildMainList() {
    return Expanded(
        child: FutureBuilder<List<Category>>(
            future: ApiCategory.getCategory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final category =
                    context.watch<CategoryProvider>().setList = snapshot.data!;
                return ListView.builder(
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return _buildListItem(category: category[index]);
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ((_appSize.size16))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Sreach...',
            hintStyle: TextStyle(
                fontSize: _appFonts.font14, color: const Color(0xFF212121)),
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 20),
              child: Icon(Icons.search_sharp),
            ),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.tune),
            ),
            contentPadding: EdgeInsets.all(10),
            filled: true,
            fillColor: Color(0xffEFEFEF),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Row _buildAppBAr() {
    return Row(
      children: [
        IconButton(
            iconSize: _appSize.screenWidth * .0362318841,
            onPressed: () {},
            icon: const Icon(Icons.vertical_distribute)),
        SizedBox(
          width: _appSize.screenWidth / 40,
        ),
        Text('Good Evening Alexis',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: _appFonts.font18)),
      ],
    );
  }

  Widget _buildListItem({required Category category}) {
    return SizedBox(
      width: double.infinity,
      height: _appSize.screenHeight * .2200614124872057,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.name!,
            style: TextStyle(
                color: Color(0xff205072), fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: _appSize.screenHeight * (4 / _appSize.screenHeight),
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: category.cards!.length,
            itemBuilder: (context, index) {
              final car = category.cards![index];
              return _buildCarItem(car: car);
            },
          )),
        ],
      ),
    );
  }

  Widget _buildCarItem({required Cards car}) {
    return Container(
      width: _appSize.size151,
      height: _appSize.size189,
      margin: EdgeInsets.only(left: _appSize.size16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xffffffff),
          ),
          BoxShadow(
            color: Color(0xff56C596).withOpacity(.15),
            blurRadius: 34,
            offset: Offset(0, 13),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: Color(0xff56C596),
        color: Colors.white,
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildImage(car), _buildDetailsPart(car)],
        ),
      ),
    );
  }

  ClipRRect _buildImage(Cards car) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        car.image!,
        width: _appSize.size151,
        height: _appSize.screenHeight * 0.1156601842374616,
        fit: BoxFit.cover,
      ),
    );
  }

  _buildDetailsPart(Cards car) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            car.name!.join("."),
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: _appFonts.font14,
                color: Color(0xff329D9C)),
          ),
          if (car.subOptions != null && car.subOptions!.length > 0)
            Text(
              car.subOptions!.join(" | "),
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: Color(0xff205072)),
            ),
          Text(
            car.city!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: Color(0xff205072)),
          ),
        ],
      ),
    );
  }
}
