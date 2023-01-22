// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/utilities/app_error.dart';
import 'package:quiz_app/src/utilities/dialog/dialog_service.dart';

import '../repository/quiz_repo.dart';

// This form is responsible for all the validators in quiz creation process
final quizCreationFormKeyProvider = Provider((_) => GlobalKey<FormState>());

// TextEditingControllers
final quizTitleControllerProvider = Provider((_) => TextEditingController());

// Quiz creation page index provider. Use this to navigate through create_quiz_pageview
final quizPageIndexProvider = StateProvider((_) => 0);

// PageController to control the navigation throught create_quiz_pageview
final quizCreationPageControllerProvider = Provider.autoDispose(
  (ref) => PageController(
    initialPage: ref.read(quizPageIndexProvider),
  ),
);

// This will determine how many questions will a quiz have while creating it.
final StateProvider<int> noOfQuestionsProvider = StateProvider<int>((_) => 2);

// This will tell us  which question details user is filling.
final currentQuestionProvider = StateProvider<int>((_) => 0);

// This provider will control the number of options.
// You can change it to anything before coming to _QuizQuestions widget.
final noOfOptionsPerQuestionProvider = Provider((_) => 4);

// Time Per Question provider is used on quiz_time_and_points screen to manange time for each question
// The starting value for this will be 2 because we can't set required time to zero
final timePerQuestionProvider = StateProvider<double>((_) => 2);

// Points Per Question provider is used on quiz_time_and_points screen to manange points for each question
final pointsPerQuestionProvider = StateProvider<double>((_) => 5);

final pointsToclearQuizProvider = StateProvider<double>((ref) => 1);

// This will provide controllers to each and every question so that they can be worked on or modified independently.
// Here we are the creating controllers for each and every question
// It will consist of one [QuizQuestionController].
// In there we have on titleController and option controller list based on noOfOptionsPerQuestionProvider
final quizControllersProvider = StateProvider((ref) {
  final noOfOptionsPerQuestion = ref.read(noOfOptionsPerQuestionProvider);
  final noOfQuestions = ref.read(noOfQuestionsProvider);

  return List<QuizQuestionController>.generate(noOfQuestions, (index) {
    return QuizQuestionController.getInstance(noOfOptionsPerQuestion);
  });
});

class QuizQuestionController {
  final TextEditingController titleController;
  List<QuizOptionController> optionControllers;

  QuizQuestionController({
    required this.titleController,
    required this.optionControllers,
  });

  factory QuizQuestionController.getInstance(int noOfOptionsPerQuestion) {
    return QuizQuestionController(
      titleController: TextEditingController(),
      optionControllers: List<QuizOptionController>.generate(
        noOfOptionsPerQuestion,
        (_) => QuizOptionController(controller: TextEditingController()),
      ),
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
}

// This category manages all the categories that are selected to create a quiz.
final selectedCategoryProvider =
    StateNotifierProvider<SelectCategoryProvider, List<Category>>(
  (_) => SelectCategoryProvider(),
);

class SelectCategoryProvider extends StateNotifier<List<Category>> {
  SelectCategoryProvider() : super([]);

  // This no. is controlled to manage how many categories a quiz can have.
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

// This provider is ultimately responsibe to create a quiz after every detail is filled
final quizCreationProvider =
    StateNotifierProvider<QuizCreationProvider, QuizCreationState>(
  (ref) => QuizCreationProvider(ref),
);

class QuizCreationProvider extends StateNotifier<QuizCreationState> {
  final Ref ref;
  QuizCreationProvider(this.ref) : super(QuizCreationState.quizIntroInitial);

  final QuizRepository _repo = QuizRepository.instance;

  void startCreatingNewQuiz() => state = QuizCreationState.quizCreationInitial;

  Future<void> createQuiz() async {
    final List<QuestionModel> questions = List.generate(
      ref.read(noOfQuestionsProvider),
      (int index) {
        final QuizQuestionController controller =
            ref.read(quizControllersProvider)[index];

        return QuestionModel(
          title: controller.titleController.text,
          options: List.generate(
            controller.optionControllers.length,
            (optionIndex) {
              final QuizOptionController optionController =
                  controller.optionControllers[optionIndex];
              return Options(
                answer: optionController.controller.text,
                isCorrect: optionController.isCorrect,
              );
            },
          ),
        );
      },
    );

    QuizModel quizModel = QuizModel(
      title: ref.read(quizTitleControllerProvider).text,
      avgTimePerQuestion: ref.read(timePerQuestionProvider).toInt(),
      pointsForCorrectAnswer: ref.read(pointsPerQuestionProvider).toInt(),
      pointsToWin: ref.read(pointsToclearQuizProvider).toInt() *
          ref.read(pointsPerQuestionProvider).toInt(),
      categoriesId: ref
          .read(selectedCategoryProvider)
          .map((element) => element.id)
          .toList(),
      warnings: [
        '10 point awarded for a correct answer and no marks for a incorrect answer',
        'Tap on options to select the correct answer',
        'Tap on the bookmark icon to save interesting questions',
        'Click submit if you are sure you want to complete all the quizzes'
      ],
      questions: questions,
    );

    try {
      await _repo.createQuiz(quizModel);
    } on AppError catch (e) {
      DialogService.instance.showDialog(
        message: e.serverMessage ?? e.errorMessage,
      );
    }
  }
}

enum QuizCreationState { quizIntroInitial, quizCreationInitial }
