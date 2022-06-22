import 'package:flutter/material.dart';
import 'package:quiz_app/src/authentication/view/authentication_screen.dart';
import 'package:quiz_app/src/quiz_home/view/quiz_home.dart';

import '../../src/utilities/export.dart';
import '../quiz/export.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          getInitialScreen(),
          DialogService.instance.widget,
          const CreateQuizOverlay()
        ],
      ),
    );
  }

  Widget getInitialScreen() {
    if (StorageService.instance.isLoggedIn) {
      // Here, [Flipper] has the flip animation which switches firstWidget to secondWidget and Vice-versa
      // This animation is triggered by [CreateQuizOverlay] writtern in create_quiz_overlay.dart.
      // The provider used to control this animation is flipProvider written in flipper.dart itself.
      return const Flipper(
        firstWidget: QuizHome(),
        secondWidget: QuizForm(),
      );
    }
    return const AuthenticationScreen();
  }
}
