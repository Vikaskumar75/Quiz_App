import 'package:flutter/material.dart';
import '../authentication/view/authentication_screen.dart';

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
        ],
      ),
    );
  }

  Widget getInitialScreen() {
    if (StorageService.instance.isLoggedIn) {
      return Stack(
        children: const <Widget>[
          // Here, [Flipper] has the flip animation which switches firstWidget to secondWidget and Vice-versa
          // This animation is triggered by [CreateQuizOverlay] writtern in create_quiz_overlay.dart.
          // The provider used to control this animation is flipProvider written in flipper.dart itself.
          Flipper(
            firstWidget: QuizHome(),
            secondWidget: QuizForm(),
          ),
          CreateQuizOverlay(),
        ],
      );
    }
    return const AuthenticationScreen();
  }
}
