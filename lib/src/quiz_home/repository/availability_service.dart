part of 'availability_repo.dart';

class AvailabilityService {
  Future<String> _fetchAvailability() async {
    final String response = await rootBundle.loadString(
      'data/availability.json',
    );

    return response;
  }
}
