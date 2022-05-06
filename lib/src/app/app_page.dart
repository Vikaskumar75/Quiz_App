import 'package:flutter/material.dart';

import '../../src/quiz_home/view/quiz_home.dart';
import '../../src/utilities/export.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const <Widget>[
          QuizHome(),
          InternetOverlay(),
        ],
      ),
    );
  }
}
