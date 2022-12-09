import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {
  List<String> tesbih = [
    'لا حول ولا قوة الا باللة ',
    'الحمداللة',
    'لا اله الا اللة',
    'سبحان اللة',
    'اللة واكبر',
  ];
  int numSebha = 0;

  int count = 0;

  String nameSebha = "سبحان اللة";

  void addTesbih(index) {
    numSebha++;
    if (numSebha == 33) {
      nameSebha = tesbih[index];
      numSebha = 0;
      count++;
    }
    if (nameSebha == 'اللة واكبر') {
      count = 0;
    }
    notifyListeners();
  }
}
