import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard(
      {Key? key,
      required this.color,
      required this.index,
      required this.foodGenre,
      required this.name,
      required this.imagePath})
      : super(key: key);

  final Color color;
  final String name;
  final String foodGenre;
  final String imagePath;
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
                      foodGenre,
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
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
                      child: Image.asset(
                        imagePath,
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
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
