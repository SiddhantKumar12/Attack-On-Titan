import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Colors.white));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff15161a),
  appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Color(0xff15161a)),
);

//flutter run --no-sound-null-safety
