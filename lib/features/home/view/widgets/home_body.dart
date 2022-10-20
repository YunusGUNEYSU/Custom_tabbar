import 'package:chex_test_case/core/_core_exports.dart';
import 'package:chex_test_case/features/home/viewmodel/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              child: _tabBarScroll(homeViewModel),
            ),
            Expanded(
              child: ListView.builder(
                controller: homeViewModel.itemScrollController,
                shrinkWrap: true,
                itemCount: homeViewModel.menuList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _sticky(index, homeViewModel);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  StickyHeader _sticky(int index, HomeViewModel homeViewModel) {
    return StickyHeader(
      header: Container(
        decoration:  BoxDecoration(
          color: Colors.deepPurple[100],
            borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
        )),
        height: 50.0.px,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          'Header $index',
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
      content: _bodyList(homeViewModel, index),
    );
  }

  ListView _bodyList(HomeViewModel homeViewModel, int index) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: homeViewModel.menuList[index].menuList.length,
      itemBuilder: (BuildContext context, int indexIn) {
        return _bodyListCard(homeViewModel, index, indexIn);
      },
    );
  }

  ItemCard _bodyListCard(HomeViewModel homeViewModel, int index, int indexIn) {
    return ItemCard(
      itemName: homeViewModel.menuList[index].menuList[indexIn].productItem.toString(),
    );
  }

  ListView _tabBarScroll(HomeViewModel homeViewModel) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: homeViewModel.menuList.length,
      itemBuilder: (BuildContext context, int index) {
        return tabButton(homeViewModel, index);
      },
    );
  }

  CupertinoButton tabButton(HomeViewModel homeViewModel, int index) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          homeViewModel.selectedItem(index);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0.px),
          height: 35.0.px,
          width: 60.0.px,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: homeViewModel.selectedIndex == index ? Colors.deepPurple[400] : Colors.grey[300],
          ),
          child: Center(
            child: Text(
              "$index",
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ));
  }
}
