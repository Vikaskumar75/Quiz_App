import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../utilities/export.dart';



part 'availability_service.dart';
part 'models/availability_model.dart';
part 'models/categories_model.dart';
part 'models/questions_model.dart';

class AvailabilityRepository implements AvailabilityService {
  AvailabilityRepository._();
  static final AvailabilityRepository instance = AvailabilityRepository._();
  final Dio dio = ApiClient.instance.getClient;

  @override
  Future<QuizAvailability> fetchAvailability() async {
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
}
