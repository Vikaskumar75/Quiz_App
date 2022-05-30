import 'package:flutter/material.dart';
import 'package:quiz_app/src/authentication/view/authentication_screen.dart';

import '../../src/utilities/export.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const <Widget>[
          // if (StorageService.getInstance.isLoggedIn) const QuizHome(),
          AuthenticationScreen(),
          InternetOverlay(),
        ],
      ),
    );
  }
}
