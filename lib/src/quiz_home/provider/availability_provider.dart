// ignore_for_file: always_specify_types

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/quiz_home/repository/availability_repo.dart';

import '../../app/app_service.dart';

final availabilityProvider = FutureProvider((_) async {
  final AvailabilityRepository _repo = AppService.getInstance.availability;
  final QuizAvailability availability = await _repo.fetchAvailability();

  return availability;
});
