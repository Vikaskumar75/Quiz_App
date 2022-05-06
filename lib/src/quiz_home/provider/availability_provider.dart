// ignore_for_file: always_specify_types

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/quiz_home/repository/availability_repo.dart';

final availabilityProvider = FutureProvider((_) async {
  final AvailabilityRepository _repo = AvailabilityRepository();
  final Availability availability = await _repo.fetchAvailability();

  return availability;
});
