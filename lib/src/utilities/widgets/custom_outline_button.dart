import 'package:flutter/material.dart';

import '../export.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20.toHeight,
          left: 50.toWidth,
          right: 50.toWidth,
        ),
        width: double.maxFinite,
        height: 50.toHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorPallet.blueGrey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.toFont,
            color: ColorPallet.blueGrey,
          ),
        ),
      ),
    );
  }
}
