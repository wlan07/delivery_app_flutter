import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({Key? key,required this.animation}) : super(key: key);

  final Animation<double> animation;

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
              child: Text("\$ 10",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold)),
              fit: BoxFit.scaleDown,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: Colors.black),
          ),
        ));
  }
}
