import 'dart:ui';

import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget glassMorphism({
    double frostValue = 16.0,
    Color? frostColor,
  }) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: frostValue, sigmaY: frostValue),
      child: Container(
        color: frostColor ?? Colors.grey.shade600.withOpacity(0.2),
        child: this,
      ),
    );
  }
}
