import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:isalmi/home/radio/radio_model.dart';
import 'package:isalmi/myTheme.dart';
import 'package:provider/provider.dart';
import '../../provider/my_provider.dart';

class RadioItem extends StatefulWidget {
  Radios radios;
  AudioPlayer audioPlayer;

  RadioItem({required this.radios, required this.audioPlayer});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.radios?.name}",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.080,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                color: provider.mode == ThemeMode.light
                    ? MyThemeData.colorGold
                    : MyThemeData.yellowColor,
                onPressed: () {
                  play();
                },
                icon: Icon(
                  Icons.play_arrow_rounded,
                  size: 40,
                ),
              ),
              IconButton(
                color: provider.mode == ThemeMode.light
                    ? MyThemeData.colorGold
                    : MyThemeData.yellowColor,
                onPressed: () {
                  pause();
                },
                icon: Icon(Icons.pause_rounded, size: 40),
              ),
            ],
          )
        ],
      ),
    );
  }

  void play() async {
    if (widget.radios.url != null) {
      await widget.audioPlayer.play(UrlSource(widget.radios.url!));
    }
  }

  void pause() async {
    await widget.audioPlayer.pause();
  }
}
