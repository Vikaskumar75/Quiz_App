import 'package:flutter/material.dart';

import '../export.dart';

class BulletList extends StatelessWidget {
  const BulletList(
    this.strings, {
    Key? key,
    this.style,
    this.spacing,
  }) : super(key: key);

  final List<String> strings;
  final TextStyle? style;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: strings.map((String str) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: spacing ?? 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '\u2022',
                textAlign: TextAlign.left,
                softWrap: true,
                style: CustomTheme.headline5,
              ),
              SizedBox(width: 5.toWidth),
              Expanded(
                child: Text(
                  str,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: style ?? CustomTheme.bodyText1,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
