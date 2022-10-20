// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chex_test_case/core/const/size_const.dart';
import 'package:chex_test_case/core/utility/random_color_utility.dart';
import 'package:flutter/material.dart';

import 'package:chex_test_case/core/_core_exports.dart';

class ItemCard extends StatelessWidget {
  final String itemName;
  const ItemCard({
    Key? key,
    required this.itemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ApplicationConstants.cardPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: ApplicationConstants.cardHeight,
            width: 75.0.percent,
            child: Card(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(backgroundColor: RandomColor.randomColor),
                Text("$itemName -Veri Seti-"),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
