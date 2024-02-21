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
    this.enable = true,
    this.showLoader = false,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final TextStyle? style;
  final double? radius;
  final double? width;
  final double? height;
  final bool enable;
  final bool showLoader;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enable ? onTap : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPallet.darkBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 4),
        ),
      ),
      child: Container(
        height: (height ?? 44).toHeight,
        width: (width ?? double.infinity).toWidth,
        alignment: Alignment.center,
        child: showLoader
            ? const Padding(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(ColorPallet.white),
                  strokeWidth: 1.5,
                ),
              )
            : Text(
                text,
                style: style ??
                    CustomTheme.headline6.copyWith(fontSize: 16.toFont),
              ),
      ),
    );
  }
}
