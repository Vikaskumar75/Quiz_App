import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/utilities/app_error.dart';

import '../../app/app_service.dart';
import '../quiz_home/repository/availability_repo.dart';

// ignore: always_specify_types
final categoryProvider = StateNotifierProvider<CategoryProvider, CategoryState>(
  (_) => CategoryProvider(),
);

class CategoryProvider extends StateNotifier<CategoryState> {
  CategoryProvider() : super(CategoryInitial()) {
    getCategories();
  }

  final AvailabilityRepository _repo = AppService.getInstance.availabilityRepo;

  Future<void> getCategories() async {
    state = CategoryLoading();
    final CategoriesModel categories = await _repo.fetchCategories();
    state = CategorySuccess(categories);
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
}
