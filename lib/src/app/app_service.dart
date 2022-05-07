import 'package:quiz_app/src/quiz_home/repository/availability_repo.dart';

import '../../src/utilities/export.dart';

// This class is used to initialize every required dependency in the app
// For ex: 1. Shared Preferences 2. Any startup dependencies etc.
class AppService {
  AppService._();
  factory AppService() {
    return _instance;
  }
  static final AppService _instance = AppService._();

  static AppService get getInstance => _instance;

  void initialize({required AvailabilityRepository availabilityRepository}) {
    ScreenScaleFactor.initialize();
    _availabilityRepository = availabilityRepository;
  }

  late AvailabilityRepository _availabilityRepository;
  AvailabilityRepository get availability => _availabilityRepository;
}
