import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice(
      {Key? key, required this.animation, required this.quantityNotifier})
      : super(key: key);

  final Animation<double> animation;
  final ValueNotifier<Map<String, int>> quantityNotifier;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: 0.2,
        child: FadeTransition(
          opacity: animation,
          child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: FittedBox(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Text("\$",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  ValueListenableBuilder(
                    valueListenable: quantityNotifier,
                    builder: (BuildContext context, Map<String, int> value,
                        Widget? child) {
                      final int old = value["old"]!;
                      final int current = value["current"]!;
                      return AnimatedCrossFade(
                          firstChild: Text(
                              (current % 2 == 0 ? old * 10 : current * 10)
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold)),
                          secondChild: Text(
                              (current % 2 == 0 ? current * 10 : old * 10)
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold)),
                          crossFadeState: current % 2 == 0
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 500));
                    },
                  ),
                ],
              ),
              fit: BoxFit.scaleDown,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: Colors.black),
          ),
        ));
  }
}
