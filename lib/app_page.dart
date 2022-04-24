import 'package:flutter/material.dart';
import 'src/authentication/authentication_screen.dart';
import 'src/utilities/export.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const <Widget>[
          AuthenticationScreen(),
          InternetOverlay(),
        ],
      ),
    );
  }
}
