import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi/hadeth_details/hadeth_details.dart';
import 'package:isalmi/home/ahadeth/ahadeth_item.dart';
import 'package:isalmi/myTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethData> Ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (Ahadeth.isEmpty) {
      loadFileAhadeth();
    }
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
        Ahadeth.isEmpty
            ? CircularProgressIndicator()
            : Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: MyThemeData.colorGold,
                    indent: 25,
                    endIndent: 25,
                  ),
                  itemCount: Ahadeth.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, HadethDetails.routeName,
                            arguments: Ahadeth[index]);
                      },
                      child: AhadethItem(Ahadeth[index].title),
                    );
                  },
                ),
              )
      ],
    );
  }

  void loadFileAhadeth() async {
    String content = await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> AllAhadeth = content.trim().split("#\r\n");
    // for loop
    for (int i = 0; i < AllAhadeth.length; i++) {
      String hadeth = AllAhadeth[i];
      List<String> hadethLines = hadeth.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethData hadethData = HadethData(title, hadethLines);
      Ahadeth.add(hadethData);
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  List<String> content;

  HadethData(this.title, this.content);
}
