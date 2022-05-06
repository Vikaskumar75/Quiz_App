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
      height: ScreenScaleFactor.screenHeight * 0.15,
      margin: EdgeInsets.symmetric(
        vertical: 10.toHeight,
        horizontal: 14.toWidth,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.toWidth,
        vertical: 20.toHeight,
      ),
      decoration: BoxDecoration(
        color: ColorPallet.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(
              2.0,
              4.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 8.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
