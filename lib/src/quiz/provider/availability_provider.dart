import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/app_service.dart';
import '../repository/availability_repo.dart';


// ignore: always_specify_types
final availabilityProvider = FutureProvider<QuizAvailability>((_) async {
  final AvailabilityRepository repo = AppService.getInstance.availabilityRepo;
  final QuizAvailability availability = await repo.fetchAvailability();

  return availability;
});
