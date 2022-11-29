import 'package:flutter/material.dart';
import 'package:isalmi/hadeth_details/hadeth_details.dart';
import 'package:isalmi/home/home.dart';
import 'package:isalmi/myTheme.dart';
import 'package:isalmi/sura_details/sura_details.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName :(context) => SuraDetails(),
        HadethDetails.routeName :(context)=> HadethDetails(),
      },
      theme: MyThemeData.ligthTheme,
      themeMode: ThemeMode.light,
      darkTheme: MyThemeData.DarkTheme,
    );
  }
}
