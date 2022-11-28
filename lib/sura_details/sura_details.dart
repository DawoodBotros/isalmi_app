import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmi/sura_details/aya.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayaat = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if(ayaat.isEmpty){
      loadFile(args.index);
    }
    return Stack(
      children: [
        Image.asset("assets/images/default_bg.png"),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.name,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: ayaat == 0
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: ayaat.length,
                  itemBuilder: (context, index) {
                    return AyaItem(ayaat[index]);
                  },
                ),
        ),
      ],
    );
  }

  void loadFile(index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
    ayaat = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs(this.name, this.index);
}
