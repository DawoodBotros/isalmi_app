import 'package:flutter/material.dart';
import 'package:isalmi/home/ahadeth/ahdeth.dart';
import 'package:isalmi/myTheme.dart';
import 'package:isalmi/provider/ahadeth_provider.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "hadeth_details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;
    return ChangeNotifierProvider(
        create: (context) => AhadethProvider(),
        builder: (context, index) {
          var pro = Provider.of<MyProvider>(context);
          return Stack(
            children: [
              Image.asset(pro.mode == ThemeMode.light
                  ? "assets/images/default_bg.png"
                  : "assets/images/dark_bg.png"),
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    args.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                body: Container(
                  decoration: BoxDecoration(
                      color: pro.mode == ThemeMode.light
                          ? Colors.grey.shade400
                          : MyThemeData.darkPrimary,
                      borderRadius: BorderRadius.circular(25),
                      border:
                          Border.all(color: MyThemeData.colorGold, width: 2)),
                  margin:
                      const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                  child: ListView.builder(
                    itemCount: args.content.length,
                    itemBuilder: (context, index) {
                      return Text(
                        args.content[index],
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: pro.mode == ThemeMode.light
                                  ? MyThemeData.colorBlack
                                  : MyThemeData.yellowColor,
                            ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        });
  }
}
