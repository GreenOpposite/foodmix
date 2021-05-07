import 'package:flutter/material.dart';
import 'package:foodmix/models/food_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _nameController = TextEditingController();

  void addFood() {
    String name = _nameController.text;
    if (name == "") {
      Fluttertoast.showToast(msg: "Das Essen braucht einen Namen.");
      return;
    }

    FoodList.addFood(
      Food(name: name),
    );
    Fluttertoast.showToast(msg: "$name hinzugefügt!");
    setState(() {
      _nameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hinzufügen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Essen"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => addFood(),
              child: Text("Hinzufügen"),
            ),
          ],
        ),
      ),
    );
  }
}
