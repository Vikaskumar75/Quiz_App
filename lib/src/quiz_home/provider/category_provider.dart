// ignore_for_file: always_specify_types

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_service.dart';
import '../repository/availability_repo.dart';

final categoryProvider = FutureProvider((_) async {
  final AvailabilityRepository _repo = AppService.getInstance.availabilityRepo;
  final CategoriesModel categoriesModel = await _repo.fetchCategories();
  return categoriesModel;
});
