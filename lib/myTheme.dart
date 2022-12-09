import 'package:flutter/material.dart';

class MyThemeData {
  static Color colorBlack = Color.fromRGBO(36, 36, 36, 1.0);
  static Color colorGold = Color.fromRGBO(183, 147, 95, 1.0);
  static Color darkPrimary = Color.fromRGBO(20, 26, 46, 1.0);
  static Color yellowColor = Color.fromRGBO(250, 204, 29, 1.0);

  static ThemeData ligthTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: colorGold,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colorGold,
        onPrimary: Colors.white,
        secondary: colorBlack,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.transparent,
        onBackground: colorBlack,
        surface: Colors.grey,
        onSurface: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: colorBlack,
        ),
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
        subtitle1: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        subtitle2: TextStyle(fontSize: 25),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: colorBlack,
        unselectedItemColor: Colors.white,
      ));
  static ThemeData DarkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: darkPrimary,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: darkPrimary,
        onPrimary: Colors.white,
        secondary: yellowColor,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.transparent,
        onBackground: yellowColor,
        surface: Colors.grey,
        onSurface: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        subtitle1: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        subtitle2: TextStyle(fontSize: 25),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        unselectedItemColor: Colors.white,
      ));
}
