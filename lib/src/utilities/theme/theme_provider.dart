// ignore_for_file: always_specify_types
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/src/utilities/export.dart';
import 'package:riverpod/riverpod.dart';

final lightThemeProvider = Provider(((ref) => CustomTheme.light));
final darkThemeProvider = Provider(((ref) => CustomTheme.dark));
final themeModeProvider = StateNotifierProvider<CustomTheme, ThemeMode>(
  (ref) => CustomTheme(),
);

class CustomTheme extends StateNotifier<ThemeMode> {
  CustomTheme() : super(ThemeMode.dark);

  static final DarkPallet _darkPallet = DarkPallet();
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkPallet.primaryColor,
    scaffoldBackgroundColor: _darkPallet.scaffoldColor,
    colorScheme: ColorScheme.dark(
      primary: _darkPallet.primaryColor,
      secondary: _darkPallet.accentColor,
    ),
    textTheme: _textTheme,
  );

  static final LightPallet _lightPallet = LightPallet();
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightPallet.primaryColor,
    scaffoldBackgroundColor: _lightPallet.scaffoldColor,
    colorScheme: ColorScheme.light(
      primary: _lightPallet.primaryColor,
      secondary: _lightPallet.accentColor,
    ),
    textTheme: _textTheme,
  );

  static final TextTheme _textTheme = GoogleFonts.ubuntuTextTheme().copyWith(
    headline1: headline1,
    headline2: headline2,
    headline3: headline3,
    headline4: headline4,
    headline5: headline5,
    headline6: headline6,
    bodyText1: bodyText1,
    bodyText2: bodyText2,
  );

  void changeThemeMode() {
    if (isDark) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }
  }

  bool get isDark => state == ThemeMode.dark;

  static final TextStyle headline1 = GoogleFonts.ubuntu(
    fontSize: 33.toFont,
    color: ColorPallet.white,
  );
  static final TextStyle headline2 = GoogleFonts.ubuntu(
    fontSize: 30.toFont,
    color: ColorPallet.white,
  );
  static final TextStyle headline3 = GoogleFonts.ubuntu(
    fontSize: 27.toFont,
    color: ColorPallet.white,
  );
  static final TextStyle headline4 = GoogleFonts.ubuntu(
    fontSize: 24.toFont,
    color: ColorPallet.white,
  );
  static final TextStyle headline5 = GoogleFonts.ubuntu(
    fontSize: 21.toFont,
    color: ColorPallet.white,
  );
  static final TextStyle headline6 = GoogleFonts.ubuntu(
    fontSize: 18.toFont,
    color: ColorPallet.white,
  );
  static final TextStyle bodyText1 = GoogleFonts.ubuntu(
    fontSize: 15.toFont,
    color: ColorPallet.white,
  );
  static final TextStyle bodyText2 = GoogleFonts.ubuntu(
    fontSize: 12.toFont,
    color: ColorPallet.white,
  );
}
