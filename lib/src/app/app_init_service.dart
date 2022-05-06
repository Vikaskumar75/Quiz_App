import '../../src/utilities/export.dart';

// This class is used to initialize every required dependency in the app
// For ex: 1. Shared Preferences 2. Any startup dependencies etc.
class AppInitService {
  static void initialize() {
    ScreenScaleFactor.initialize();
  }
}
