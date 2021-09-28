import 'dart:developer';

import 'package:delivery_app_flutter/food_card.dart';
import 'package:delivery_app_flutter/food_extra_details.dart';
import 'package:delivery_app_flutter/food_order_screen.dart';
import 'package:delivery_app_flutter/top_bar.dart';
import 'package:delivery_app_flutter/top_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ENTER THE FULL SCREEN MODE
  await SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<double> pageoffsetNotifier;
  late PageController pageController;

  late List<double> draggedX;

  @override
  void initState() {
    pageoffsetNotifier = ValueNotifier<double>(0.0);

    draggedX = [];

    pageController = PageController(viewportFraction: 0.8)
      ..addListener(() {
        pageoffsetNotifier.value = pageController.page!;
      });

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    pageController.dispose();
    pageoffsetNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          const TopBar(),
          const TopNavBar(),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: PageView.builder(
                  itemCount: 20,
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, __) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 600),
                            opaque: false,
                            pageBuilder: (_, animation, reverseAnimation) {
                              return FadeTransition(
                                opacity: animation,
                                child: FoodOrderScreen(
                                  index: __,
                                  color: Colors
                                      .primaries[__ % Colors.primaries.length],
                                ),
                              );
                            }));
                      },
                      onHorizontalDragUpdate: (_) {
                        draggedX.add(_.delta.dx);
                      },
                      onHorizontalDragEnd: (_) {
                        // log(draggedX.toString());

                        if (draggedX.last > 1.0) {
                          pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        } else if (draggedX.last < -1.0) {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 500),
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
                                  index: __,
                                  color: Colors
                                      .primaries[__ % Colors.primaries.length],
                                )),
                          ),
                          Expanded(
                            child: FractionallySizedBox(
                                widthFactor: 0.9,
                                child: FoodExtraDetails(
                                  index: __,
                                  pageOffsetNotifier: pageoffsetNotifier,
                                )),
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
