import 'package:flutter/material.dart';

abstract class ColorsManger {
  ColorsManger._();
  static const primaryColor = Color(0xff4568dc);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color red = Colors.red;
  static Color greyShade = Colors.grey.shade100;
  static const List<Color> primaryGradientColor = [
    Color(0xff4568dc),
    Color(0xffb06ab3),
  ];
}
