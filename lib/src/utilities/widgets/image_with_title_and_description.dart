// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../export.dart';

class ImageWithTitleAndDescription extends StatelessWidget {
  const ImageWithTitleAndDescription({
    Key? key,
    required this.asset,
    required this.title,
    required this.description,
    this.height,
    this.width,
  }) : super(key: key);

  final String asset;
  final String title;
  final String description;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          asset,
          fit: BoxFit.cover,
        ),
        Container(
          height:height ?? double.maxFinite,
          width:width?? double.maxFinite,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10.toHeight),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                ColorPallet.black.withOpacity(0.9),
                ColorPallet.black.withOpacity(0.5),
                ColorPallet.black.withOpacity(0.2),
              ],
            ),
          ),
          child: ListTile(
            title: Text(
              title,
              style: CustomTheme.headline6,
            ),
            visualDensity: VisualDensity.comfortable,
            subtitle: Text(
              description,
              style: CustomTheme.bodyText1.copyWith(
                color: ColorPallet.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
