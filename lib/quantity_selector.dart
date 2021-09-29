import 'dart:ui';

import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector(
      {Key? key, required this.animation, required this.quantityNotifier})
      : super(key: key);

  final Animation<double> animation;
  final ValueNotifier<Map<String, int>> quantityNotifier;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: 0.4,
        child: FadeTransition(
          opacity: animation,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
            height: 50.0,
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.blue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          if (quantityNotifier.value["current"]! > 1) {
                            quantityNotifier.value = {
                              "old": quantityNotifier.value["current"]!,
                              "current": quantityNotifier.value["current"]! - 1
                            };
                          }
                        },
                        child: Center(child: Icon(Icons.remove,color: Colors.blue,))),
                  ),
                  Expanded(
                    child: Center(
                      child: ValueListenableBuilder(
                        valueListenable: quantityNotifier,
                        builder: (BuildContext context, Map<String, int> value,
                            Widget? child) {
                          return Text(
                            value["current"].toString(),
                            style:
                                TextStyle(color: Colors.black, fontSize: 24.0),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          quantityNotifier.value = {
                            "old": quantityNotifier.value["current"]!,
                            "current": quantityNotifier.value["current"]! + 1
                          };
                        },
                        child: Center(child: Icon(Icons.add,color: Colors.blue,))),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
