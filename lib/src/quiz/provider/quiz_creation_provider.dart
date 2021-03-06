// ignore_for_file: public_member_api_docs, sort_constructors_first
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

// This will determine how many questions will a quiz have while creating it.
final StateProvider<int> noOfQuestionsProvider = StateProvider<int>((_) => 2);

// This will tell us  which question details user is filling.
final currentQuestionProvider = StateProvider<int>((_) => 0);

// This provider will control the number of options.
// You can change it to anything before coming to _QuizQuestions widget.
final noOfOptionsPerQuestionProvider = Provider((_) => 4);

// This will provide controllers to each and every question so that they can be worked on or modified independently.
// Here we are the creating controllers for each and every question
// It will consist of one [QuizQuestionController].
// In there we have on titleController and option controller list based on noOfOptionsPerQuestionProvider
final questionControllers = StateProvider((ref) {
  final noOfQuestions = ref.read(noOfQuestionsProvider);
  final noOfOptionsPerQuestion = ref.read(noOfOptionsPerQuestionProvider);

  return List<QuizQuestionController>.generate(noOfQuestions, (index) {
    return QuizQuestionController(
      titleController: TextEditingController(),
      optionControllers: List<QuizOptionController>.generate(
        noOfOptionsPerQuestion,
        (_) => QuizOptionController(controller: TextEditingController()),
      ),
    );
  });
});

class QuizQuestionController {
  final TextEditingController titleController;
  List<QuizOptionController> optionControllers;

  QuizQuestionController({
    required this.titleController,
    required this.optionControllers,
  });

  QuizQuestionController copyWith({
    TextEditingController? titleController,
    List<QuizOptionController>? optionControllers,
  }) {
    return QuizQuestionController(
      titleController: titleController ?? this.titleController,
      optionControllers: optionControllers ?? this.optionControllers,
    );
  }
}

class QuizOptionController {
  final TextEditingController controller;
  bool isCorrect;
  QuizOptionController({
    required this.controller,
    this.isCorrect = false,
  });

  QuizOptionController copyWith({
    TextEditingController? controller,
    bool? isCorrect,
  }) {
    return QuizOptionController(
      controller: controller ?? this.controller,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}

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

final quizCreationProvider =
    StateNotifierProvider<QuizCreationProvider, QuizCreationState>(
  (_) => QuizCreationProvider(),
);

class QuizCreationProvider extends StateNotifier<QuizCreationState> {
  QuizCreationProvider() : super(QuizCreationState.quizIntroInitial);

  void createNewQuiz() {
    state = QuizCreationState.quizCreationInitial;
  }
}

enum QuizCreationState { quizIntroInitial, quizCreationInitial }
