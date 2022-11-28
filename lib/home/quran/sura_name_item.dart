import 'package:flutter/material.dart';

class SuraNameItem extends StatelessWidget {
 String name;
 SuraNameItem(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.subtitle1,
      textAlign: TextAlign.center,
    );
  }
}
