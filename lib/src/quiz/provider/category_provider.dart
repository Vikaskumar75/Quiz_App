// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/utilities/app_error.dart';

import '../../app/app_service.dart';
import '../repository/quiz_repo.dart';

// ignore: always_specify_types
final categoryProvider = StateNotifierProvider<CategoryProvider, CategoryState>(
  (_) => CategoryProvider(),
);

// The below code can be written using a future provider but this was done just to explore
// Cubits method using riverpod
class CategoryProvider extends StateNotifier<CategoryState> {
  CategoryProvider() : super(CategoryInitial()) {
    getCategories();
  }

  final QuizRepository _repo = AppService.getInstance.availabilityRepo;

  Future<void> getCategories() async {
    state = CategoryLoading();
    final CategoriesModel categories = await _repo.fetchCategories();
    state = CategorySuccess(categories);
  }

  Future<void> addCategory(String categoryName) async {
    final Category category = await _repo.addCategory(categoryName);
    final CategorySuccess successState = state as CategorySuccess;
    successState.data.categoriesData.categories.add(category);
    state = successState.copyWith(data: successState.data);
  }
}

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryError extends CategoryState {
  final AppError error;

  CategoryError(this.error);

  @override
  List<AppError> get props => <AppError>[error];
}

class CategorySuccess extends CategoryState {
  final CategoriesModel data;

  CategorySuccess(this.data);

  @override
  List<CategoriesModel> get props => <CategoriesModel>[data];

  CategorySuccess copyWith({
    CategoriesModel? data,
  }) {
    return CategorySuccess(
      data ?? this.data,
    );
  }
}
