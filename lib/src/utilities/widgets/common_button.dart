import 'package:flutter/material.dart';

import '../export.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: ColorPallet.darkBlue,
      ),
      child: Text(
        text,
        style: CustomTheme.bodyText1,
      ),
    );
  }
}
