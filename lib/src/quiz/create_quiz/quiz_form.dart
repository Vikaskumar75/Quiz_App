import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/utilities/export.dart';

import '../provider/quiz_overlay_provider.dart';

part 'quiz_form_intro.dart';
part 'create_quiz_overlay.dart';
class QuizForm extends StatefulWidget {
  const QuizForm({Key? key}) : super(key: key);

  @override
  State<QuizForm> createState() => _QuizFormState();
}

class _QuizFormState extends State<QuizForm> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _QuizFormIntro(),
    );
  }
}


