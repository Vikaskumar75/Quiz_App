import 'package:flutter/material.dart';

abstract class ColorPallet {
  Color get primaryColor;
  Color get accentColor;
  Color get scaffoldColor;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static const Color red = Colors.red;
  static const Color orange = Color.fromARGB(255, 243, 139, 17);
  static const Color green = Color.fromARGB(255, 23, 205, 20);
  static const Color transparent = Colors.transparent;
  static const Color lightGrey = Color.fromARGB(255, 168, 168, 168);
  static const Color extraLightGrey = Color.fromARGB(255, 235, 231, 231);
  static const Color golden = Color(0xFFF2C94C);
  static const Color darkGolden = Color.fromARGB(255, 202, 154, 9);
  static const Color blackishGolden = Color.fromARGB(255, 145, 119, 41);
  static const Color shimmerHighlight = Color.fromARGB(255, 234, 234, 241);
  static const Color blueGrey = Colors.blueGrey;
  static const Color darkBlueGrey = Color.fromARGB(255, 27, 45, 54);
  static const Color lightBlueGrey = Color.fromARGB(255, 204, 233, 248);

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

  static final Paint dialogShaderPaint = Paint()
    ..shader = const LinearGradient(
      colors: <Color>[
        Color(0xff628EFF),
        Color(0xffBFD5FF),
        Color(0xffE9A0FE),
      ],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static final Shader quizListItemTitleShader = LinearGradient(
    colors: <Color>[
      ColorPallet.white,
      ColorPallet.white.withOpacity(0.8),
      ColorPallet.white.withOpacity(0.5)
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}

class DarkPallet with ColorPallet {
  @override
  Color get primaryColor => Colors.black;

  @override
  Color get accentColor => Colors.blue.shade700;

  @override
  Color get scaffoldColor => ColorPallet.darkBlueGrey;
}

class LightPallet with ColorPallet {
  @override
  Color get primaryColor => Colors.white;

  @override
  Color get accentColor => Colors.blue.shade700;

  @override
  Color get scaffoldColor => Colors.white;
}
