import '../../src/utilities/export.dart';
import '../authentication/repository/authentication_repo.dart';
import '../quiz/repository/quiz_repo.dart';

// This class is used to initialize every required dependency in the app
// For ex: 1. Shared Preferences 2. Any startup dependencies etc.
class AppService {
  AppService._();
  factory AppService() => _instance;
  static final AppService _instance = AppService._();
  static AppService get getInstance => _instance;

  // There is a reason that all the repositories are nullable.
  // OtherWise for the test cases we have to initialize each and every repo and that is not feasible.
  Future<void> initialize({
    QuizRepository? availabilityRepository,
    AuthenticationRepo? authenticationRepo,
  }) async {
    // Initializing screen scale so that the screen layout can be adjusted according to screen size.
    // This will let us use .toHeight .toWidth .toFont extensions.
    ScreenScaleFactor.initialize();

    // Initializing DeviceInfoService so that this can get the data of current device and thus it can be used in logging service.
    // [ Note: This is a dependency for signUp since we need to send device info to backend. ]
    await DeviceInfoService.getInstacne.initialize();

    // Initializing internet Connectivity stream which will automatically show an overlay based on connectivity.
    InternetConnectivity.instance.initialize();

    // Initializing StorageService which will populate all the Preferences.
    await StorageService.instance.initialize();

    // Initializing repositories
    _availabilityRepository = availabilityRepository;
    _authenticationRepository = authenticationRepo;
  }

  // Defining all the repositories required with in the app.
  // [ Note: Make sure to check for null value while sending any repo. OtherWise throw an Exception. ]
  QuizRepository? _availabilityRepository;
  QuizRepository get availabilityRepo {
    if (_availabilityRepository != null) return _availabilityRepository!;
    throw Exception('AvailabilityRepository not initialized');
  }

  AuthenticationRepo? _authenticationRepository;
  AuthenticationRepo get authenticationRepo {
    if (_authenticationRepository != null) return _authenticationRepository!;
    throw Exception('AuthenticationRepo not initialized');
  }
}
