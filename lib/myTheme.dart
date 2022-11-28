import 'package:flutter/material.dart';

class MyThemeData {
  static Color colorBlack = Color.fromRGBO(36, 36, 36, 1.0);
  static Color colorGold = Color.fromRGBO(183, 147, 95, 1.0);
  static ThemeData ligthTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: colorBlack,
      ),
      subtitle1: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: colorBlack,
      unselectedItemColor: Colors.white,
    )
  );
  static ThemeData DarkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: colorBlack,
        ),
      ));
}
