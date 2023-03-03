import 'package:flutter/material.dart';
import 'package:isalmi/myTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'en';
  Color selected = MyThemeData.colorGold;
  ThemeMode mode = ThemeMode.light;

  void ChangeLanguage(String lang) async {
    languageCode = lang;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("lang",languageCode);
    notifyListeners();
  }

  Color getColor(lang) {
    return languageCode == lang
        ? MyThemeData.colorGold
        : MyThemeData.colorBlack;
  }

  void ChangeTheme(ThemeMode themeMode) async{
    mode = themeMode;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("theme",mode == ThemeMode.light ? "light" : "dark");
    notifyListeners();
  }
}
