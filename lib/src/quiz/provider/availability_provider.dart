import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_service.dart';
import '../quiz_home/repository/availability_repo.dart';

final availabilityProvider = FutureProvider((_) async {
  final AvailabilityRepository _repo = AppService.getInstance.availabilityRepo;
  final QuizAvailability availability = await _repo.fetchAvailability();

  return availability;
});
