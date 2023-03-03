import 'package:flutter/material.dart';
import 'package:isalmi/hadeth_details/hadeth_details.dart';
import 'package:isalmi/home/home.dart';
import 'package:isalmi/myTheme.dart';
import 'package:isalmi/provider/my_provider.dart';
import 'package:isalmi/splash_screen.dart';
import 'package:isalmi/sura_details/sura_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MyApplication(),
    ),
  );
}

class MyApplication extends StatelessWidget {
  late MyProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MyProvider>(context);
    initSharedPrefs();
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
      locale: Locale(provider.languageCode),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      theme: MyThemeData.ligthTheme,
      themeMode: provider.mode,
      darkTheme: MyThemeData.DarkTheme,
    );
  }

  void initSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("lang") ?? "en";
    provider.ChangeLanguage(lang);
    String? theme = prefs.getString("theme");
    if (theme == "light") {
      provider.ChangeTheme(ThemeMode.light);
    } else if (theme == "dark") {
      provider.ChangeTheme(ThemeMode.dark);
    }
  }
}
