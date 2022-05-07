import 'package:flutter/material.dart';

import '../export.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    Key? key,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);
  final Widget? child;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? ScreenScaleFactor.screenHeight,
      width: width ?? ScreenScaleFactor.screenWidth,
      decoration: BoxDecoration(
        gradient: ColorPallet.blueGreyGradient,
      ),
      child: child,
    );
  }
}
