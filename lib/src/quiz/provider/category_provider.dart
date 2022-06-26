import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/utilities/app_error.dart';

import '../../app/app_service.dart';
import '../quiz_home/repository/availability_repo.dart';

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
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryError extends CategoryState {
  final AppError error;

  CategoryError(this.error);

  @override
  List<Object?> get props => [error];
}

class CategorySuccess extends CategoryState {
  final CategoriesModel data;

  CategorySuccess(this.data);

  @override
  List<Object?> get props => [data];
}
