import 'package:delivery_app_flutter/models/food_model.dart';

class MyData {
  static const List<String> foodsbygenre = [
    "Fruits",
    "Vegetables",
    "Coffes",
    "Ice Creams",
    "Bevrage"
  ];

  static const List<List<MyFoodModel>> foods = [
    [
      MyFoodModel("assets/images/pineapple.png",
          marketName: "LYNX Market",
          kcalPer100g: "437",
          name: "Pineapple",
          time: "30"),
      MyFoodModel("assets/images/strawberry.png",
          marketName: "KIOX Market",
          kcalPer100g: "420",
          name: "Strawberry",
          time: "20"),
      MyFoodModel("assets/images/orange.png",
          marketName: "YIOR Market",
          kcalPer100g: "200",
          name: "Orange",
          time: "25"),
      MyFoodModel("assets/images/mango.png",
          marketName: "XORR Market",
          kcalPer100g: "200",
          name: "Mango",
          time: "27"),
      MyFoodModel("assets/images/pomegranate.png",
          marketName: "LYNX Market",
          kcalPer100g: "400",
          name: "Pomegranate",
          time: "30"),
      MyFoodModel("assets/images/lemon.png",
          marketName: "LYNX Market",
          kcalPer100g: "100",
          name: "Lemon.png",
          time: "30"),
    ],
    [
      MyFoodModel("assets/images/tomato.png",
          marketName: "LYNX Market",
          kcalPer100g: "100",
          name: "Tomato",
          time: "30"),
      MyFoodModel("assets/images/eggplant.png",
          marketName: "LYNX Market",
          kcalPer100g: "200",
          name: "Eggplant",
          time: "30"),
      MyFoodModel("assets/images/onion.png",
          marketName: "LYNX Market",
          kcalPer100g: "150",
          name: "Onion",
          time: "27"),
    ],
    [],
    [],
    []
  ];
}
