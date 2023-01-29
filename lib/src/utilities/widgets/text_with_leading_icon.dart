import 'package:flutter/material.dart';

import '../export.dart';

class TextWithLeadingIcon extends StatelessWidget {
  const TextWithLeadingIcon({
    Key? key,
    required this.text,
    required this.icon,
    this.iconColor = ColorPallet.extraLightGrey,
    this.textColor = ColorPallet.extraLightGrey,
    this.iconSize = 20,
    this.textSize,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final String text;
  final Color textColor;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
        SizedBox(width: 10.toWidth),
        Text(
          text,
          style: CustomTheme.headline5.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
