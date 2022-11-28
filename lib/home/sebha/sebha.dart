import 'package:flutter/material.dart';
import 'package:isalmi/myTheme.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              addTesbih(count);
            },
            child: Image.asset(
              "assets/images/sebha_main_bg.png",
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Text(
            "عدد التسبيحات ",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          Container(
            decoration: BoxDecoration(
              color: MyThemeData.colorGold,
              borderRadius: BorderRadius.circular(15),
            ),
            height: 70,
            width: 50,
            child: Center(
              child: Text(
                "$numSebha",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: MyThemeData.colorGold,
            ),
            child: FittedBox(
              child: Text(
                nameSebha,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
