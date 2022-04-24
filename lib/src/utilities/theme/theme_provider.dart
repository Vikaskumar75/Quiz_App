// ignore_for_file: always_specify_types
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'theme_colors.dart';

final lightThemeProvider = Provider(((ref) => Themes.light));
final darkThemeProvider = Provider(((ref) => Themes.dark));
final themeModeProvider = StateNotifierProvider<Themes, ThemeMode>(
  (ref) => Themes(),
);

class Themes extends StateNotifier<ThemeMode> {
  Themes() : super(ThemeMode.dark);

  static final DarkPallet _darkPallet = DarkPallet();
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkPallet.primaryColor,
    scaffoldBackgroundColor: _darkPallet.scaffoldColor,
    colorScheme: ColorScheme.dark(
      primary: _darkPallet.primaryColor,
      secondary: _darkPallet.accentColor,
    ),
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
  );

  void changeThemeMode() {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }
}
