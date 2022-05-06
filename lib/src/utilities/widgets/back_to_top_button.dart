import 'package:flutter/material.dart';
import 'package:quiz_app/src/utilities/theme/theme_colors.dart';

class BackToTopButton extends StatelessWidget {
  const BackToTopButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        gradient: ColorPallet.blueGreyGradient,
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: const Icon(
          Icons.keyboard_arrow_up_rounded,
          color: ColorPallet.white,
        ),
      ),
    );
  }
}
