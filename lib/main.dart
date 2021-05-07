import 'package:flutter/material.dart';
import 'package:foodmix/models/food_list.dart';
import 'package:foodmix/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  FoodList.init(prefs);

  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}
