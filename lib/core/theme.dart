import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constant.dart';

final ThemeData spacetomicTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurpleAccent,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepPurpleAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    ),
  ),
);
