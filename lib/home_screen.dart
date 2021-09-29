import 'package:delivery_app_flutter/data/my_data.dart';
import 'package:delivery_app_flutter/food_page_item.dart';
import 'package:delivery_app_flutter/top_bar.dart';
import 'package:delivery_app_flutter/top_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  late ValueNotifier<int> selectedGenreNotifier;

  late PageController foodGenrePageController;

  @override
  void initState() {
    selectedGenreNotifier = ValueNotifier<int>(0);

    foodGenrePageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    selectedGenreNotifier.dispose();

    foodGenrePageController.dispose();

    super.dispose();
  
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          const TopBar(),
          TopNavBar(
            selectedGenreNotifier: selectedGenreNotifier,
            jumpTo: (int index) {
              foodGenrePageController.jumpToPage(index);
              selectedGenreNotifier.value = index;
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: PageView.builder(
                  controller: foodGenrePageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: MyData.foodsbygenre.length,
                  itemBuilder: (_, i) => FoodPageItem(
                      models: MyData.foods[i],
                      foodGenre: MyData.foodsbygenre[i])))
        ],
      ),
    );
  }
}
