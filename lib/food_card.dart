import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key, required this.color, required this.index})
      : super(key: key);

  final Color color;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: "CARD_BOX_$index",
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: color,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fruits",
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                    Text(
                      "Pomegranate",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1,),
              Expanded(
                flex: 8,
                child: Hero(
                  flightShuttleBuilder: (_, __, ___, ____, _____) {
                    return RotationTransition(
                      turns: __,
                      alignment: Alignment.center,
                      child: ____.widget,
                    );
                  },
                  tag: "FOOD_$index",
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: Image.asset("assets/images/pineapple.png").image,
                        alignment: Alignment.center
                      ),
                     // color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
