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
  Future<void> createQuiz(QuizModel quizModel) async {
    try {
      final Response<dynamic> response = await dio.post(
        '/quizzes',
        data: quizModel.toJson(),
      );
      Console.log(response.statusCode);
    } catch (e) {
      rethrow;
    }
  }
}
