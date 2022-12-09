import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier{
  List<String> ayaat = [];
  void loadFile(index) async {
    String content =
    await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
    ayaat = lines;
    notifyListeners();
  }
}