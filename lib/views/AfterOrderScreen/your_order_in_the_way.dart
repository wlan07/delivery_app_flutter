import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class YourOrderInTheWay extends StatefulWidget {
  YourOrderInTheWay({Key? key,required this.color}) : super(key: key);


  final Color color;

  @override
  _YourOrderInTheWayState createState() => _YourOrderInTheWayState();
}

class _YourOrderInTheWayState extends State<YourOrderInTheWay> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Lottie.asset(
              "assets/images/delivery.json",
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Spacer(),
                  Text("Your Order's",style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500
                  ),),
                  Text("On The Way",style: TextStyle(
                    color: Colors.black,
                    fontSize: 38,
                    fontWeight: FontWeight.bold
                  ),),
                  const Spacer(),
                  Text(
                    "#78376",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Order Number",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    alignment: Alignment.center,
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(15.0)),
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Check The Receipt",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                  ),
                  const Spacer()
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
