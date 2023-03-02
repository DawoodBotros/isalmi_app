import 'package:flutter/material.dart';
import 'package:isalmi/home/setting/language_bottom_sheet.dart';
import 'package:isalmi/home/setting/theme_bottom_sheet.dart';
import 'package:isalmi/myTheme.dart';
import 'package:isalmi/provider/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: MyThemeData.colorGold,
                  )),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: MyThemeData.colorGold),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                pro.languageCode == "en" ? AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.arabic,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: MyThemeData.colorGold,
                  )),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: MyThemeData.colorGold),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                pro.mode == ThemeMode.light ? AppLocalizations.of(context)!.light : AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showThemeBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeBottomSheet();
      });
}

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      });
}
