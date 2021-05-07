import 'package:flutter/material.dart';
import 'package:foodmix/models/food_list.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerichte"),
      ),
      body: ListView.builder(
        itemCount: FoodList.food.length,
        itemBuilder: (context, index) {
          Food food = FoodList.food[index];
          return ListTile(title: Text(food.name), onTap: () {
            setState(() {

            FoodList.removeFood(food);
            });
          },);
        },
      ),
    );
  }
}
