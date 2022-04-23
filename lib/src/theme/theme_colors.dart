import 'package:flutter/material.dart';

abstract class ColorPallet {
  Color get primaryColor;
  Color get accentColor;
  Color get scaffoldColor;
}

class CommonColors {
  final Color black = Colors.black;
}

class DarkPallet extends CommonColors with ColorPallet {
  @override
  Color get primaryColor => Colors.black;

  @override
  Color get accentColor => Colors.blue.shade700;

  @override
  Color get scaffoldColor => Colors.black;
}

class LightPallet extends CommonColors with ColorPallet {
  @override
  Color get primaryColor => Colors.white;

  @override
  Color get accentColor => Colors.blue.shade700;

  @override
  Color get scaffoldColor => Colors.white;
}
