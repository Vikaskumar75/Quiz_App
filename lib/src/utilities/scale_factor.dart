import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScreenScaleFactor {
  ScreenScaleFactor._();
  static final ScreenScaleFactor _instance = ScreenScaleFactor._();
  factory ScreenScaleFactor() {
    return _instance;
  }

  static late double scale;

  static void initialize() {
    final SingletonFlutterWindow window = WidgetsBinding.instance!.window;
    final MediaQueryData media = MediaQueryData.fromWindow(window);
    if (kIsWeb) {
      scale = media.size.width / media.size.height;
    } else {
      scale = media.size.height / media.size.width;
    }
  }
}

extension ScaleFactor on num {
  double get toFont {
    if (kIsWeb) {
      return this * ScreenScaleFactor.scale * 0.5;
    } else {
      return this * ScreenScaleFactor.scale * 0.45;
    }
  }

  double get toHeight {
    if (kIsWeb) {
      return this * ScreenScaleFactor.scale * 0.5;
    } else {
      return this * ScreenScaleFactor.scale * 0.45;
    }
  }

  double get toWidth {
    if (kIsWeb) {
      return this * ScreenScaleFactor.scale * 0.5;
    } else {
      return this * ScreenScaleFactor.scale * 0.45;
    }
  }
}
