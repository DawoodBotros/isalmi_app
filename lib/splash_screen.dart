import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isalmi/home/home.dart';
import 'package:isalmi/provider/my_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, HomeScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(provider.mode == ThemeMode.light
            ? "assets/images/splash_screen.png"
            : "assets/images/splash_screen_dark.png"),
      ],
    );
  }
}
