part of 'availability_repo.dart';

abstract class AvailabilityService {
  Future<QuizAvailability> fetchAvailability();
  Future<CategoriesModel> fetchCategories();
}
