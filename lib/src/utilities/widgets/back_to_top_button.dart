import 'package:flutter/material.dart';
import '../theme/theme_colors.dart';

class BackToTopButton extends StatelessWidget {
  const BackToTopButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: ColorPallet.white,
      child: const Icon(
        Icons.keyboard_arrow_up_rounded,
        color: ColorPallet.darkBlueGrey,
      ),
    );
  }
}
