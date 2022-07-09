import 'package:flutter/material.dart';

import '../export.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.style,
    this.radius,
    this.width,
    this.height,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final TextStyle? style;
  final double? radius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: ColorPallet.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 4),
        ),
      ),
      child: Container(
        height: (height ?? 44).toHeight,
        width: (width ?? double.infinity).toWidth,
        alignment: Alignment.center,
        child: Text(
          text,
          style: style ?? CustomTheme.headline6.copyWith(fontSize: 16.toFont),
        ),
      ),
    );
  }
}
