class MyFoodModel {
  final String name;
  final String marketName;
  final String time;
  final String kcalPer100g;
  final String imagePath;

  const MyFoodModel(this.imagePath, 
      {required this.name,
      required this.marketName,
      required this.time,
      required this.kcalPer100g});
}
