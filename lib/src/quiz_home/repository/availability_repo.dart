import 'dart:convert';

import 'package:flutter/services.dart';

part 'availability_model.dart';
part 'availability_service.dart';

class AvailabilityRepository extends AvailabilityService {
  AvailabilityRepository._();
  static final AvailabilityRepository instance = AvailabilityRepository._();

  Future<QuizAvailability> fetchAvailability() async {
    final String data = await _fetchAvailability();

    try {
      final QuizAvailability availability = availabilityFromJson(data);
      return availability;
    } catch (e) {
      throw Exception('Availability parsing gone wrong\n$e');
    }
  }
}
