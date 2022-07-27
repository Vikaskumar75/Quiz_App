// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../export.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    Key? key,
    required this.tag,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String tag;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: tag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: ColorPallet.darkBlue,
      onPressed: onTap,
      child: Icon(
        icon,
        size: 30.toHeight,
        color: ColorPallet.white,
      ),
    );
  }
}
