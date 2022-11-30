import 'package:flutter/material.dart';
import 'package:isalmi/home/ahadeth/ahdeth.dart';
import 'package:isalmi/home/quran/quran.dart';
import 'package:isalmi/home/radio/radio.dart';
import 'package:isalmi/home/sebha/sebha.dart';
import 'package:isalmi/myTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/default_bg.png"),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: MyThemeData.colorGold,
                icon: const ImageIcon(
                  AssetImage("assets/images/icon_radio.png"),
                  size: 30,
                ),
                label: AppLocalizations.of(context)!.radio,
              ),
              BottomNavigationBarItem(
                backgroundColor: MyThemeData.colorGold,
                icon: const ImageIcon(
                  AssetImage("assets/images/icon_sebha.png"),
                  size: 30,
                ),
                label: AppLocalizations.of(context)!.sebha,
              ),
              BottomNavigationBarItem(
                backgroundColor: MyThemeData.colorGold,
                icon: const ImageIcon(
                  AssetImage("assets/images/icon_hadeth.png"),
                  size: 30,
                ),
                label: AppLocalizations.of(context)!.hadeth,
              ),
              BottomNavigationBarItem(
                backgroundColor: MyThemeData.colorGold,
                icon: const ImageIcon(
                  AssetImage("assets/images/icon_quran.png"),
                  size: 30,
                ),
                label: AppLocalizations.of(context)!.quran,
              ),
            ],
          ),
          body: tab[currentIndex],
        ),
      ],
    );
  }
}

List<Widget> tab = [
  RadioTab(),
  SebhaTab(),
  AhadethTab(),
  QuranTab(),
];
