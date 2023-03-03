import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:isalmi/home/radio/radio.dart';
import 'package:isalmi/home/radio/radio_model.dart';
import 'package:http/http.dart' as http;
import 'package:isalmi/myTheme.dart';
import 'package:provider/provider.dart';

import '../../provider/my_provider.dart';

class RadioTab extends StatefulWidget {
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  var audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Image.asset("assets/images/radio_image.png"),
        ),
        Expanded(
          flex: 2,
          child: FutureBuilder<RadiosResponse>(
            future: getRadios(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var radios = snapshot.data?.radios ?? [];
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  itemCount: snapshot.data!.radios!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        width: size.width,
                        child: RadioItem(
                          radios: radios[index],
                          audioPlayer: audioPlayer,
                        ));
                  },
                );
              } else if (snapshot.hasError) {
                return Text("Somthing Erorr");
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }

  Future<RadiosResponse> getRadios() async {
    var uri = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return RadiosResponse.fromJson(json);
    } else {
      throw Exception("Failed to load radios");
    }
  }
}
