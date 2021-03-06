import 'package:flash_cards/screens/home.dart';
import 'package:flash_cards/screens/falshcard_view.dart';
import 'package:flash_cards/screens/swipe_cards.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.orange),
        home: HomePage());
  }
}
