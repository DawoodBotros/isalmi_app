import 'package:flutter/material.dart';
import 'package:isalmi/provider/my_provider.dart';
import 'package:provider/provider.dart';

import '../myTheme.dart';

class AyaItem extends StatelessWidget {
  String aya;
  int index;
  AyaItem(this.aya,this.index);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Text(
      aya + '(${index +1})',
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
        color: pro.mode == ThemeMode.light ? MyThemeData.colorBlack : MyThemeData.yellowColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
