import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi/hadeth_details/hadeth_details.dart';
import 'package:isalmi/home/ahadeth/ahadeth_item.dart';
import 'package:isalmi/myTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:isalmi/provider/ahadeth_provider.dart';
import 'package:provider/provider.dart';

class AhadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AhadethProvider()..loadFileAhadeth(),
      builder: (context, index) {
        var pro = Provider.of<AhadethProvider>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/hadeth_logo.png"),
            Divider(
              color: MyThemeData.colorGold,
              thickness: 3,
            ),
            Text(
              AppLocalizations.of(context)!.ahadeth,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            Divider(
              color: MyThemeData.colorGold,
              thickness: 3,
            ),
            pro.Ahadeth.isEmpty
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: MyThemeData.colorGold,
                        indent: 25,
                        endIndent: 25,
                      ),
                      itemCount: pro.Ahadeth.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, HadethDetails.routeName,
                                arguments: pro.Ahadeth[index]);
                          },
                          child: AhadethItem(pro.Ahadeth[index].title),
                        );
                      },
                    ),
                  )
          ],
        );
      },
    );
  }
}

class HadethData {
  String title;
  List<String> content;

  HadethData(this.title, this.content);
}
