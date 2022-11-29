import 'package:flutter/material.dart';

class AhadethItem extends StatelessWidget {
  String text;

  AhadethItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1,
      textAlign: TextAlign.center,
    );
  }
}
