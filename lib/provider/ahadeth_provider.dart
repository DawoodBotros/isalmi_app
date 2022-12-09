import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../home/ahadeth/ahdeth.dart';

class AhadethProvider extends ChangeNotifier {
  List<HadethData> Ahadeth = [];
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
    notifyListeners();
  }
}

