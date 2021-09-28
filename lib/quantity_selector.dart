import 'dart:ui';

import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({Key? key, required this.animation}) : super(key: key);

  final Animation<double> animation;

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
                    child: Center(child: Text("-")),
                  ),
                  Expanded(
                    child: Center(
                        child: Text(
                      "1",
                      style: TextStyle(color: Colors.black, fontSize: 24.0),
                    )),
                  ),
                  Expanded(
                    child: Center(child: Text("+")),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
