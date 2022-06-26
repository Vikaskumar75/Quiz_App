import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../quiz_home/repository/availability_repo.dart';

import '../../app/app_service.dart';

final categoryProvider = FutureProvider((_) async {
  final AvailabilityRepository _repo = AppService.getInstance.availabilityRepo;
  final CategoriesModel categoriesModel = await _repo.fetchCategories();
  return categoriesModel;
});
