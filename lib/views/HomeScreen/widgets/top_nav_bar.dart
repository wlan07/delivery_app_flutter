import 'package:delivery_app_flutter/data/my_data.dart';
import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar(
      {Key? key, required this.jumpTo, required this.selectedGenreNotifier})
      : super(key: key);

  final Function jumpTo;
  final ValueNotifier<int> selectedGenreNotifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 20.0, left: 10.0),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: ValueListenableBuilder(
          valueListenable:  selectedGenreNotifier,
          builder: (BuildContext context, int value, Widget? child) {
             return  Row(
        children: [
          ...List.generate(
              MyData.foodsbygenre.length,
              (index) => GestureDetector(
                    onTap: () {
                      jumpTo(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          if (index == value)
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
                            MyData.foodsbygenre[index],
                            style: TextStyle(
                                color: index == value
                                    ? Colors.orangeAccent
                                    : Colors.grey,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ))
        ],
      );
          },
       ),
    );
  }
}
