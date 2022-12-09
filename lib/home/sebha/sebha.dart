import 'package:flutter/material.dart';
import 'package:isalmi/myTheme.dart';
import 'package:isalmi/provider/my_provider.dart';
import 'package:isalmi/provider/sura_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/sebha_provider.dart';

class SebhaTab extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SebhaProvider(),
        builder: (context, index) {
          var provider = Provider.of<SebhaProvider>(context);
          var pro = Provider.of<MyProvider>(context);
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    provider.addTesbih(provider.count);
                  },
                  child: Image.asset(
                    pro.mode == ThemeMode.light
                        ? "assets/images/sebha_main_bg.png"
                        : "assets/images/sebha_main_dark.png",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Text(
                  "عدد التسبيحات ",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: pro.mode == ThemeMode.light
                        ? MyThemeData.colorGold
                        : MyThemeData.darkPrimary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 70,
                  width: 50,
                  child: Center(
                    child: Text(
                      "${provider.numSebha}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: pro.mode == ThemeMode.light
                              ? MyThemeData.colorBlack
                              : Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: pro.mode == ThemeMode.light
                        ? MyThemeData.colorGold
                        : MyThemeData.yellowColor,
                  ),
                  child: FittedBox(
                    child: Text(
                      provider.nameSebha,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: pro.mode == ThemeMode.light
                              ? Colors.white
                              : MyThemeData.colorBlack),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
