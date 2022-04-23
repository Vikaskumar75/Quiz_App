import 'package:flutter/material.dart';

import 'src/authentication/authentication_screen.dart';
import 'src/utilities/export.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const <Widget>[
        AuthenticationScreen(),
        InternetOverlay(),
      ],
    );
  }
}

class InternetOverlay extends StatelessWidget {
  const InternetOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.toHeight,
      width: double.infinity,
      color: Colors.black.withOpacity(0.2),
    );
  }
}
