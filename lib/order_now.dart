import 'package:flutter/material.dart';

class OrderNow extends StatelessWidget {
  const OrderNow({Key? key,required this.animation}) : super(key: key);

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {

    return FractionallySizedBox(
      alignment: Alignment.center,
      widthFactor: 0.6,
      child: FadeTransition(
        opacity: animation,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15.0)),
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            "Order Now",
            style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ), 
      )
    );
  }
}
