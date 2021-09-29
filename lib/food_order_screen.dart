import 'dart:developer';

import 'package:delivery_app_flutter/order_now.dart';
import 'package:delivery_app_flutter/top_bar.dart';
import 'package:delivery_app_flutter/total_price.dart';
import 'package:flutter/material.dart';

import 'quantity_selector.dart';

class FoodOrderScreen extends StatefulWidget {
  const FoodOrderScreen(
      {Key? key,
      required this.color,
      required this.index,
      required this.name,
      required this.imagePath})
      : super(key: key);

  final Color color;
  final int index;
  final String name;
  final String imagePath;

  @override
  _FoodOrderScreenState createState() => _FoodOrderScreenState();
}

class _FoodOrderScreenState extends State<FoodOrderScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController opacityAnimationController;

  late ValueNotifier<Map<String,int>> quantityNotifier;

  late List<Animation<double>> _animations;

  @override
  void initState() {
    opacityAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    quantityNotifier = ValueNotifier<Map<String,int>>({
      "old":1,
      "current":1
    });

    _animations = [
      CurvedAnimation(
          parent: opacityAnimationController, curve: Interval(0.0, 0.2)),
      CurvedAnimation(
          parent: opacityAnimationController, curve: Interval(0.2, 0.9)),
      CurvedAnimation(
          parent: opacityAnimationController, curve: Interval(0.3, 1.0))
    ];

    Future.delayed(const Duration(milliseconds: 200), () {
      opacityAnimationController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    quantityNotifier.dispose();
    opacityAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("FOOD ORDER SCREEN ${widget.index}");

    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const TopBar(),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                        top: constraints.maxHeight * 0.25,
                        child: Hero(
                          tag: "CARD_BOX_${widget.index}",
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: constraints.maxHeight * 0.225),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 35.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  TotalPrice(
                                    animation: _animations[0],
                                    quantityNotifier: quantityNotifier,
                                  ),
                                  Spacer(),
                                  QuantitySelector(
                                    quantityNotifier: quantityNotifier,
                                    animation: _animations[1],
                                  ),
                                  Spacer(),
                                  OrderNow(
                                    animation: _animations[2],
                                  ),
                                  Spacer(),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: widget.color,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      topRight: Radius.circular(25.0))),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: constraints.maxHeight * 0.05,
                        child: Hero(
                          tag: "FOOD_${widget.index}",
                          child: Container(
                            height: constraints.maxHeight * 0.4,
                            width: constraints.maxWidth * 0.7,
                            child: Image.asset(
                              widget.imagePath,
                              alignment: Alignment.center,
                              fit: BoxFit.contain,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
