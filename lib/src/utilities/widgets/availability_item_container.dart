import 'package:flutter/material.dart';

import '../export.dart';

class AvailabilityItemContainer extends StatelessWidget {
  const AvailabilityItemContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenScaleFactor.screenHeight * 0.10,
      margin: EdgeInsets.symmetric(
        horizontal: 14.toWidth,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.toWidth,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: child,
    );
  }
}
