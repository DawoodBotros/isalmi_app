import 'package:flutter/material.dart';
import 'package:isalmi/myTheme.dart';
import 'package:isalmi/provider/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.ChangeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Light",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Icon(
                    Icons.done,
                    size: 30,
                  ),
                ]),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.ChangeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dark",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Icon(Icons.done, size: 30),
                ]),
          ),
        ],
      ),
    );
  }
}
