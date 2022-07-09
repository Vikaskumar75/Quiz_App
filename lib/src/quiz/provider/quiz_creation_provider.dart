// ignore_for_file: always_specify_types
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/utilities/dialog/dialog_service.dart';

import '../repository/availability_repo.dart';

// This form is responsible for all the validators in quiz creation process
final quizCreationFormKeyProvider = Provider((_) => GlobalKey<FormState>());

// TextEditingControllers
final quizTitleControllerProvider = Provider((_) => TextEditingController());

// Quiz creation page index provider. Use this to navigate through create_quiz_pageview
final quizPageIndexProvider = StateProvider((_) => 0);

// PageController to control the navigation throught create_quiz_pageview
final quizCreationPageControllerProvider = Provider.autoDispose(
  (ref) {
    return PageController(initialPage: ref.read(quizPageIndexProvider));
  },
);

final quizCreationProvider =
    StateNotifierProvider<QuizCreationProvider, QuizCreationState>(
  (_) => QuizCreationProvider(),
);

final selectedCategoryProvider =
    StateNotifierProvider<SelectCategoryProvider, List<Category>>(
  (_) => SelectCategoryProvider(),
);

class SelectCategoryProvider extends StateNotifier<List<Category>> {
  SelectCategoryProvider() : super([]);

  final int maximumCategorySelcted = 3;

  void add(Category category) {
    if (state.length >= maximumCategorySelcted) {
      DialogService.instance.showDialog(
        message: 'You can only select upto $maximumCategorySelcted categories',
      );
    } else {
      state = [...state, category];
    }
  }

  void remove(Category category) {
    state = state.where((element) => element.id != category.id).toList();
  }
}

enum QuizCreationState { quizIntroInitial, quizCreationInitial }

class QuizCreationProvider extends StateNotifier<QuizCreationState> {
  QuizCreationProvider() : super(QuizCreationState.quizIntroInitial);

  void createNewQuiz() {
    state = QuizCreationState.quizCreationInitial;
  }
}
