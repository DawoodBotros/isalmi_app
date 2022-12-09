import 'package:flutter/material.dart';
import 'package:isalmi/myTheme.dart';
import 'package:isalmi/provider/my_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.ChangeLanguage("en");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("English",style: Theme.of(context).textTheme.headline1?.copyWith(
                  color:provider.getColor("en"),
                )),
                Icon(Icons.done,size: 30,color: provider.getColor("en"),),
              ]
            ),
          ),
          SizedBox(height: 15,),
          InkWell(
            onTap: () {
              provider.ChangeLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Arabic",style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: provider.getColor("ar"),
                  )),
                  Icon(Icons.done,size: 30,color: provider.getColor("ar"),),
                ]
            ),
          ),
        ],
      ),
    );
  }
}
