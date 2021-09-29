import 'package:delivery_app_flutter/models/food_model.dart';
import 'package:flutter/material.dart';

import 'food_card.dart';
import 'food_extra_details.dart';
import '../../OrderScreen/food_order_screen.dart';

class FoodPageItem extends StatefulWidget {
  const FoodPageItem({Key? key, required this.models, required this.foodGenre})
      : super(key: key);

  final String foodGenre;
  final List<MyFoodModel> models;

  @override
  _FoodPageItemState createState() => _FoodPageItemState();
}

class _FoodPageItemState extends State<FoodPageItem> {
  late PageController pageController;

  late ValueNotifier<double> pageoffsetNotifier;

  late List<double> draggedX;

  @override
  void initState() {
    draggedX = [];

    pageoffsetNotifier = ValueNotifier<double>(0.0);

    pageController = pageController = PageController(viewportFraction: 0.8)
      ..addListener(() {
        pageoffsetNotifier.value = pageController.page!;
      });

    super.initState();
  }

  @override
  void dispose() {
    pageoffsetNotifier.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: widget.models.length,
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, j) {
          final MyFoodModel model = widget.models[j];

          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 600),
                    opaque: false,
                    pageBuilder: (_, animation, reverseAnimation) {
                      return FadeTransition(
                        opacity: animation,
                        child: FoodOrderScreen(
                          imagePath: model.imagePath,
                          name: model.name,
                          index: j,
                          color: Colors.primaries[j % Colors.primaries.length],
                        ),
                      );
                    }));
              },
              onHorizontalDragUpdate: (_) {
                draggedX.add(_.delta.dx);
              },
              onHorizontalDragEnd: (_) {
                if (draggedX.last > 1.0) {
                  pageController.previousPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn);
                } else if (draggedX.last < -1.0) {
                  pageController.nextPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn);
                }

                draggedX.clear();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: FractionallySizedBox(
                        widthFactor: 0.85,
                        alignment: Alignment.centerLeft,
                        child: FoodCard(
                          foodGenre: widget.foodGenre,
                          imagePath: model.imagePath,
                          name: model.name,
                          index: j,
                          color:
                              Colors.primaries[j % Colors.primaries.length],
                        )),
                  ),
                  Expanded(
                    child: FractionallySizedBox(
                        widthFactor: 0.9,
                        child: FoodExtraDetails(
                          kcal: model.kcalPer100g,
                          marketName: model.marketName,
                          time: model.time,
                          index: j,
                          pageOffsetNotifier: pageoffsetNotifier,
                        )),
                  )
                ],
              ));
        });
  }
}
