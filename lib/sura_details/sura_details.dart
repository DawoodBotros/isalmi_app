import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi/provider/my_provider.dart';
import 'package:isalmi/provider/sura_provider.dart';
import 'package:isalmi/sura_details/aya.dart';
import 'package:provider/provider.dart';

import '../myTheme.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = "sura";

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    return ChangeNotifierProvider(
        create: (context) => SuraDetailsProvider()..loadFile(args.index),
        builder: (c, index) {
          var provider = Provider.of<SuraDetailsProvider>(c);
          var pro = Provider.of<MyProvider>(c);
          return Stack(
            children: [
              Image.asset(pro.mode == ThemeMode.light ?"assets/images/default_bg.png" : "assets/images/dark_bg.png"),
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    args.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                body: provider.ayaat == 0
                    ? CircularProgressIndicator()
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: MyThemeData.colorGold,width: 2
                          ),
                          color: pro.mode == ThemeMode.light ? Colors.grey.shade400 : MyThemeData.darkPrimary,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                        child: ListView.builder(
                          itemCount: provider.ayaat.length,
                          itemBuilder: (context, index) {
                            return AyaItem(provider.ayaat[index], index);
                          },
                        ),
                      ),
              ),
            ],
          );
        });
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs(this.name, this.index);
}
