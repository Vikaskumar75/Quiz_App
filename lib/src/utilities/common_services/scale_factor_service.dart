import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScreenScaleFactor {
  ScreenScaleFactor._();
  static final ScreenScaleFactor _instance = ScreenScaleFactor._();
  factory ScreenScaleFactor() => _instance;

  static late double scale;
  static late MediaQueryData _media;

  static void initialize() {
    _media = MediaQueryData.fromWindow(window);
    if (kIsWeb) {
      scale = _media.size.width / _media.size.height;
    } else {
      scale = _media.size.height / _media.size.width;
    }
  }

  static double get screenHeight => _media.size.height;
  static double get screenWidth => _media.size.width;
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
