// ignore_for_file: always_specify_types

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/quiz_home/repository/availability_repo.dart';

final FutureProvider availabilityProvider = FutureProvider((_) async {
  await AvailabilityRepository().fetchAvailability();
});
