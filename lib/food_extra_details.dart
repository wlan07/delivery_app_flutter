import 'dart:developer';

import 'package:flutter/material.dart';

class FoodExtraDetails extends StatelessWidget {
  const FoodExtraDetails(
      {Key? key, required this.pageOffsetNotifier, required this.index})
      : super(key: key);

  final ValueNotifier<double> pageOffsetNotifier;
  final int index;

  double get opacity => 1.0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageOffsetNotifier,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lynx Market",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                ),
                Text("30 min"),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Calories"),
            Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("100 grams"),
                Text("437 kcal"),
              ],
            ),
          ],
        ),
      ),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: opacity,
          child: child!,
        );
      },
    );
  }
}
