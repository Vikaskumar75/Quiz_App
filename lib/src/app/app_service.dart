import 'package:quiz_app/src/authentication/repository/authentication_repo.dart';
import 'package:quiz_app/src/quiz_home/repository/availability_repo.dart';
import 'package:quiz_app/src/services/storage_service.dart';

import '../../src/utilities/export.dart';

// This class is used to initialize every required dependency in the app
// For ex: 1. Shared Preferences 2. Any startup dependencies etc.
class AppService {
  AppService._();
  factory AppService() => _instance;
  static final AppService _instance = AppService._();
  static AppService get getInstance => _instance;

  void initialize({
    AvailabilityRepository? availabilityRepository,
    AuthenticationRepo? authenticationRepo,
  }) {
    ScreenScaleFactor.initialize();

    // Initializing StorageService which will populate all the Preferences
    StorageService.getInstance.initialize();

    // Initializing repositories
    if (availabilityRepository != null) {
      _availabilityRepository = availabilityRepository;
    }

    if (authenticationRepo != null) {
      _authenticationRepository = authenticationRepo;
    }
  }

  late AvailabilityRepository _availabilityRepository;
  AvailabilityRepository get availabilityRepo => _availabilityRepository;

  late AuthenticationRepo _authenticationRepository;
  AuthenticationRepo get authenticationRepo => _authenticationRepository;
}
