part of 'availability_repo.dart';

abstract class AvailabilityService {
  Future<String> _fetchAvailability() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final String response = await rootBundle.loadString(
      'data/availability.json',
    );

    return response;
  }
}
