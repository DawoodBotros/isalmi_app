import 'package:flutter/material.dart';
import 'package:isalmi/home/ahadeth/ahdeth.dart';
import 'package:isalmi/myTheme.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "hadeth_details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;
    return Stack(
      children: [
        Image.asset("assets/images/default_bg.png"),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(25),
                border: Border.all(color: MyThemeData.colorGold,width: 2)
            ),
            margin: EdgeInsets.symmetric(vertical: 35,horizontal: 25),
            child: ListView.builder(
              itemCount: args.content.length,
              itemBuilder: (context, index) {
                return Text(
                  args.content[index],
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
