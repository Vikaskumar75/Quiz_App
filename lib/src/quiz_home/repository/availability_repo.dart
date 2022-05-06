import 'dart:convert';

import 'package:flutter/services.dart';

part 'availability_model.dart';
part 'availability_service.dart';

class AvailabilityRepository extends AvailabilityService {
  Future<Availability> fetchAvailability() async {
    final String data = await _fetchAvailability();

    try {
      final Availability availability = availabilityFromJson(data);
      return availability;
    } catch (e) {
      throw Exception('Availability parsing gone wrong\n$e');
    }
  }
}
