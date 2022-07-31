part of 'quiz_repo.dart';

abstract class QuizService {
  Future<QuizAvailability> fetchQuiz();
  Future<CategoriesModel> fetchCategories();
  Future<void> createQuiz(QuizModel quizModel);
}
