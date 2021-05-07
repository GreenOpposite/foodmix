import 'package:flutter/material.dart';
import 'package:foodmix/pages/add_page.dart';
import 'package:foodmix/pages/overview_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Essen"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("Gerichte"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return OverviewPage();
                  }),
                );
              },
            ),
            ListTile(
              title: Text("Hinzufügen"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return AddPage();
                  }),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Hey!"),
      ),
    );
  }
}
