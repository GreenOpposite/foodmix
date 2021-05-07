class Food {
  String name;

  Food({this.name = "unnamed"});

  String toString() {
    return name;
  }
}

class FoodList {
  static final FoodList _instance = FoodList._internal();
  factory FoodList() => _instance;
  static List<Food> _foodList = [];

  FoodList._internal() {
    // init things inside this
  }

  static void addFood(Food food) {
    print("Added " + food.toString());
    _foodList.add(food);
  }

  static void removeFood(Food food) {
    print("Removed " + food.toString());
    _foodList.remove(food);
  }

  static List<Food> get food {
    return _foodList;
  }
}
