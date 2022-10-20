// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    return SizedBox(
      height: 70.0.px,
      width: 90.0.percent,
      child: Card(child: Center(child: Text("$itemName -Veri Seti-"))),
    );
  }
}
