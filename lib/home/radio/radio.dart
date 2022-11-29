import 'package:flutter/material.dart';
import 'package:isalmi/myTheme.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/radio_image.png"),
          Text(
            "اذاعة القران الكريم ",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.080,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ImageIcon(
                AssetImage(
                  "assets/images/icon_next_left.png",
                ),
                color: Color.fromRGBO(183, 147, 95, 1.0),
              ),
              ImageIcon(
                AssetImage("assets/images/icon_play.png"),
                color: Color.fromRGBO(183, 147, 95, 1.0),
              ),
              ImageIcon(
                AssetImage("assets/images/icon_next_right.png"),
                color: Color.fromRGBO(183, 147, 95, 1.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
