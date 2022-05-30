import 'package:flutter/material.dart';

import '../export.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: PhysicalModel(
        color: ColorPallet.darkBlueGrey,
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 50.toHeight,
          width: 50.toWidth,
          padding: const EdgeInsets.only(left: 8.0),
          alignment: Alignment.center,
          child: const Icon(
            Icons.arrow_back_ios,
            color: ColorPallet.white,
          ),
        ),
      ),
    );
  }
}
