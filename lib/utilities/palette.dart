import 'package:flutter/material.dart';

class Palette {
  static const Color primaryColor = Color(0xffe30b5e);


  static const Color red = Color(0xffc20a0a);
  static const Color yellow = Color(0xfffbff00);
  static const Color orange = Color(0xffff9100);
  static const Color green = Color(0xff2ac96f);
  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.01, 0.5, 0.9, 1],
    colors: [Palette.primaryColor, Palette.red, Palette.orange, Palette.yellow]
  );
}