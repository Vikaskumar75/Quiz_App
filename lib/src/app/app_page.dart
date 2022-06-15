import 'package:flutter/material.dart';
import 'package:quiz_app/src/authentication/view/authentication_screen.dart';

import '../../src/utilities/export.dart';
import '../quiz_home/view/quiz_home.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          getInitialScreen(),
          DialogService.instance.widget,
        ],
      ),
    );
  }

  Widget getInitialScreen() {
    if (StorageService.instance.isLoggedIn) return const QuizHome();
    return const AuthenticationScreen();
  }
}
