import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class Food {
  String name;

  Food({this.name = "unnamed"});

  String toString() {
    return name;
  }

  Map<String, dynamic> toJson() {
    return {"name": name};
  }
}

class FoodList {
  static final FoodList _instance = FoodList._internal();
  factory FoodList() => _instance;
  static List<Food> _foodList = [];

  FoodList._internal() {
  }

  static void init(SharedPreferences prefs) => asyncInit(prefs);

  static void asyncInit(SharedPreferences prefs) async {
    loadData(prefs);
  }

  static void addFood(Food food) {
    print("Added " + food.toString());
    _foodList.add(food);
  }

  static void removeFood(Food food) {
    print("Removed " + food.toString());
    _foodList.remove(food);
  }

  static void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("foodList", jsonEncode(toJson()));
  }

  static void loadData(SharedPreferences prefs) {
    log("Loading data...", name: "cache");
    String? data = prefs.getString("foodList");
    if(data == null) {
      log("No data to load.", name: "cache");
      return;
    }

    Map<String, dynamic> json = jsonDecode(data);
    log("loaded $json", name: "cache");
    _loadFromJson(json);
  }

  static Map<String, dynamic> toJson() {
    return {"foodList": _foodList};
  }

  static void _loadFromJson(Map<String, dynamic> json) {
    _foodList = json["foodList"];
  }

  static List<Food> get food {
    return _foodList;
  }
}
