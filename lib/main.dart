import 'package:flutter/material.dart';
import 'package:isalmi/hadeth_details/hadeth_details.dart';
import 'package:isalmi/home/home.dart';
import 'package:isalmi/myTheme.dart';
import 'package:isalmi/splash_screen.dart';
import 'package:isalmi/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale(
          'en',
        ), // English, no country code
        Locale(
          'ar',
        ), // Arabic, no country code
      ],
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context)=> SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      theme: MyThemeData.ligthTheme,
      themeMode: ThemeMode.light,
      darkTheme: MyThemeData.DarkTheme,
    );
  }
}
