import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/home_layout/home_layout_view.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "Splash-Screen";

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){
      Navigator.pushNamedAndRemoveUntil(context, HomeLayoutView.routeName, (route) => false);
    });
    var mediaQuery=MediaQuery.of(context).size;
    return Scaffold(
      body:Image.asset(
        "assets/images/splash.png",
        width: mediaQuery.width,
        height: mediaQuery.height,
        fit: BoxFit.cover,
      ) ,

    );
  }
}
