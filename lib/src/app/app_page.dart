import 'package:flutter/material.dart';
import 'package:quiz_app/src/authentication/view/authentication_screen.dart';
import 'package:quiz_app/src/quiz_home/view/quiz_home.dart';
import 'package:quiz_app/src/services/storage_service.dart';

import '../../src/utilities/export.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          if (StorageService.getInstance.isLoggedIn) const QuizHome(),
          const AuthenticationScreen(),
          const InternetOverlay(),
        ],
      ),
    );
  }
}
