import 'package:flutter/material.dart';
import 'package:flutter_demo/splash/spalash.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter Demo",
    theme: ThemeData(
      primaryIconTheme: const IconThemeData(color: Colors.white),
      brightness: Brightness.light,
      primaryColor: Color.fromARGB(255, 0, 215, 198),
      accentColor: Colors.cyan[300],
    ),
    home: SplashPage(),
  ));
}
