import 'package:flutter/material.dart';
import 'package:isalmi/myTheme.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'en';
  Color selected = MyThemeData.colorGold;
  ThemeMode mode = ThemeMode.light;

  void ChangeLanguage(String lang) {
    languageCode = lang;
    notifyListeners();
  }

  Color getColor(lang) {
    return languageCode == lang
        ? MyThemeData.colorGold
        : MyThemeData.colorBlack;
  }

  void ChangeTheme(ThemeMode themeMode) {
    mode =themeMode;
    notifyListeners();
  }
}
