import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../utilities/export.dart';

part 'models/availability_model.dart';
part 'models/categories_model.dart';
part 'models/questions_model.dart';
part 'models/quiz_model.dart';
part 'quiz_service.dart';

class QuizRepository implements QuizService {
  QuizRepository._();
  static final QuizRepository instance = QuizRepository._();
  final Dio dio = ApiClient.instance.getClient;

  @override
  Future<void> createQuiz(QuizModel quizModel) async {
    try {
      await dio.post('/quizzes', data: quizModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  // Todo: Come back here and implement the actual api instead of fetching data from a file.
  @override
  Future<QuizAvailability> fetchQuiz() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    final String response = await rootBundle.loadString(
      'data/availability.json',
    );

    try {
      final QuizAvailability availability = availabilityFromJson(response);
      return availability;
    } catch (e) {
      throw Exception('Availability parsing gone wrong\n$e');
    }
  }

  @override
  Future<CategoriesModel> fetchCategories() async {
    try {
      final Response<dynamic> response = await dio.get('/categories');
      return CategoriesModel.fromJson(response.data);
    } on AppError catch (_) {
      rethrow;
    }
  }

  @override
  Future<Category> addCategory(String categoryName) async {
    try {
      final Response<dynamic> response = await dio.post(
        '/categories',
        data: <String, dynamic>{'name': categoryName},
      );
      final Category addedCategory = Category.fromJson(
        response.data['data']['category'],
      );

      Console.log(response.statusCode);
      Console.info(addedCategory);

      return addedCategory;
    } on AppError catch (_) {
      rethrow;
    }
  }
}
