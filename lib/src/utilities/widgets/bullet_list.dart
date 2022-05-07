import 'package:flutter/material.dart';
import 'package:quiz_app/src/utilities/export.dart';

class BulletList extends StatelessWidget {
  const BulletList(this.strings, {Key? key}) : super(key: key);
  final List<String> strings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: strings.map((String str) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20.0.toHeight),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '\u2022',
                textAlign: TextAlign.left,
                softWrap: true,
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(width: 5.toWidth),
              Expanded(
                child: Text(
                  str,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
