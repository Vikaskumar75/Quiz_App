import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This form is responsible for all the validators in quiz creation process
final quizCreationFormKeyProvider = Provider((_) => GlobalKey<FormState>());

// TextEditingControllers
final quizTitleControllerProvider = Provider((_) => TextEditingController());

// Quiz creation page index provider. Use this to navigate through create_quiz_pageview
final quizPageIndexProvider = StateProvider((_) => 0);

// PageController to control the navigation throught create_quiz_pageview
final quizCreationPageControllerProvider = Provider.autoDispose(
  (_) => PageController(),
);

final quizCreationProvider =
    StateNotifierProvider<QuizCreationProvider, QuizCreationState>(
  (_) => QuizCreationProvider(),
);

enum QuizCreationState { quizIntroInitial, quizCreationInitial }

class QuizCreationProvider extends StateNotifier<QuizCreationState> {
  QuizCreationProvider() : super(QuizCreationState.quizIntroInitial);

  void createNewQuiz() {
    state = QuizCreationState.quizCreationInitial;
  }
}
