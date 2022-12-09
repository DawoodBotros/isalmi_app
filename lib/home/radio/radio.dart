import 'package:flutter/material.dart';
import 'package:isalmi/myTheme.dart';
import 'package:provider/provider.dart';

import '../../provider/my_provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/radio_image.png"),
          Text(
            "اذاعة القران الكريم ",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.080,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              ImageIcon(
                AssetImage(
                  "assets/images/icon_next_left.png",
                ),
                color: provider.mode == ThemeMode.light ? MyThemeData.colorGold :MyThemeData.yellowColor,

              ),
              ImageIcon(
                AssetImage("assets/images/icon_play.png"),
                color: provider.mode == ThemeMode.light ? MyThemeData.colorGold :MyThemeData.yellowColor,

              ),
              ImageIcon(
                AssetImage("assets/images/icon_next_right.png"),
                color: provider.mode == ThemeMode.light ? MyThemeData.colorGold :MyThemeData.yellowColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
