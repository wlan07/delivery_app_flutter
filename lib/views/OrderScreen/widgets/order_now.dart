import 'package:delivery_app_flutter/views/AfterOrderScreen/your_order_in_the_way.dart';
import 'package:flutter/material.dart';

class OrderNow extends StatelessWidget {
  const OrderNow({Key? key, required this.animation, required this.color})
      : super(key: key);

  final Animation<double> animation;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: 0.6,
        child: FadeTransition(
          opacity: animation,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 150),
                  pageBuilder: (_, __, ___) {
                    return SlideTransition(
                      position: Tween<Offset>(
                              begin: Offset(1.0, 0.0), end: Offset.zero)
                          .animate(__),
                      child: YourOrderInTheWay(
                        color: color,
                      ),
                    );
                  }));
            },
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
          ),
        ));
  }
}
