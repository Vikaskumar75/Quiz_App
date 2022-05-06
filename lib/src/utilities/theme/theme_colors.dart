import 'package:flutter/material.dart';

abstract class ColorPallet {
  Color get primaryColor;
  Color get accentColor;
  Color get scaffoldColor;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static const Color golden = Color(0xFFF2C94C);
  static final Color lightGrey = Colors.grey.shade400;

  static final LinearGradient blueGreyGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: <Color>[
      Colors.blueGrey.shade400,
      Colors.blueGrey,
      Colors.blueGrey.shade500,
      Colors.blueGrey.shade700
    ],
    stops: const <double>[
      0.05,
      0.3,
      0.4,
      0.9,
    ],
  );
}

class DarkPallet with ColorPallet {
  @override
  Color get primaryColor => Colors.black;

  @override
  Color get accentColor => Colors.blue.shade700;

  @override
  Color get scaffoldColor => Colors.black;
}

class LightPallet with ColorPallet {
  @override
  Color get primaryColor => Colors.white;

  @override
  Color get accentColor => Colors.blue.shade700;

  @override
  Color get scaffoldColor => Colors.white;
}
