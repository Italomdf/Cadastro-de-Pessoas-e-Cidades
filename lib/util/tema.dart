import 'package:flutter/material.dart';

class Tema {
  criaTema() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.blueGrey.shade900,
      brightness: Brightness.dark,
      primaryColor: Colors.amber.shade700,
      fontFamily: 'Georgia',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0),
        headline2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );
  }
}
