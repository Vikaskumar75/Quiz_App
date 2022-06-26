
import 'package:flutter/material.dart';
import 'package:quiz_app/src/utilities/export.dart';

class CustomActionChip extends StatelessWidget {
  const CustomActionChip({
    Key? key,
    required this.label,
    required this.actionIcon,
    this.backgroundColor,
    this.labelColor,
    this.dividerColor,
    this.actionIconColor,
    this.onTap,
  }) : super(key: key);

  final String label;
  final IconData actionIcon;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? dividerColor;
  final Color? actionIconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0.toWidth),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: backgroundColor,
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              label,
              style: CustomTheme.bodyText1.copyWith(
                fontSize: 14.toFont,
                color: labelColor,
              ),
            ),
            VerticalDivider(
              thickness: 1,
              width: 10.toWidth,
              color: dividerColor,
            ),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                actionIcon,
                size: 20,
                color: actionIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}