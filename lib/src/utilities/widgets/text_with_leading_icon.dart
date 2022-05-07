import 'package:flutter/material.dart';

import '../export.dart';

class TextWithLeadingIcon extends StatelessWidget {
  const TextWithLeadingIcon({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: ColorPallet.grey,
          size: 20,
        ),
        SizedBox(width: 10.toWidth),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: ColorPallet.grey),
        ),
      ],
    );
  }
}
