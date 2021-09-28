import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 20.0, left: 10.0),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          ...List.generate(
              10,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        if (index == 0)
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 10.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange,
                              ),
                              width: 10.0,
                            ),
                          ),
                        Text(
                          "element$index",
                          style: TextStyle(
                              color: index == 0
                                  ? Colors.orangeAccent
                                  : Colors.grey,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}
