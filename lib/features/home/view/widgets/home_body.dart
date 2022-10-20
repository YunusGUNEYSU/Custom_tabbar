import 'package:chex_test_case/core/_core_exports.dart';
import 'package:chex_test_case/features/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import 'body_widgets/item_card_widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        return Column(
          children: [
            SizedBox(
              height: 70.0.px,
              width: 100.0.percent,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: homeViewModel.menuList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        homeViewModel.selectedItem(index);
                      },
                      child: Chip(
                        label: Text(index.toString()),
                        backgroundColor: homeViewModel.selectedIndex == index ? Colors.deepPurple[400] : Colors.grey[300],
                      ));
                },
              ),
            ),
            SizedBox(
              height: 700,
              width: 500,
              child: ScrollablePositionedList.builder(
                initialScrollIndex: 0,
                itemScrollController:homeViewModel.itemScrollController,
                itemPositionsListener: homeViewModel.itemPositionsListener,
                shrinkWrap: true,
                itemCount: homeViewModel.menuList.length,
                itemBuilder: (BuildContext context, int index) {
                  return StickyHeader(
                    header: Container(
                      height: 50.0.px,
                      color: Colors.blueGrey[700],
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Header #$index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    content: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: homeViewModel.menuList[index].menuList.length,
                      itemBuilder: (BuildContext context, int indexIn) {
                        return ItemCard(
                          itemName: homeViewModel.menuList[index].menuList[indexIn].productItem.toString(),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
