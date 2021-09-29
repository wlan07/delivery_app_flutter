import 'dart:developer';

import 'package:flutter/material.dart';

class FoodExtraDetails extends StatelessWidget {
  const FoodExtraDetails(
      {Key? key,
      required this.pageOffsetNotifier,
      required this.index,
      required this.marketName,
      required this.time,
      required this.kcal})
      : super(key: key);

  final ValueNotifier<double> pageOffsetNotifier;
  final int index;
  final String marketName;
  final String time;
  final String kcal;

  // A MATHEMATIC CALCULATION TO DETERMINE THE OPACITY
  double get opacity => (index > pageOffsetNotifier.value
          ? pageOffsetNotifier.value - index + 1.0
          : 1 - pageOffsetNotifier.value + index)
      .clamp(0.0, 1.0);

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
                  marketName,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                ),
                Text("$time min"),
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
                Text("$kcal kcal"),
              ],
            ),
          ],
        ),
      ),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: opacity,
          child: Transform.translate(
              offset: Offset.lerp(Offset(index < value ? -100 : 100.0, 0.0), Offset.zero, opacity)!,
              child: child!),
        );
      },
    );
  }
}
