import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService._();
  factory StorageService() => _instance;
  static final StorageService _instance = StorageService._();
  static StorageService get getInstance => _instance;

  Future<void> initialize() async {
    // Make sure that prefs is instantiated at the top since below commands needs to use _prefs
    _prefs = await SharedPreferences.getInstance();

    _isLoggedIn = false;
    _accessToken = '';
  }

  late SharedPreferences _prefs;
  SharedPreferences get prefs => _prefs;

  void saveString() {}

  late bool _isLoggedIn;
  bool get isLoggedIn => _isLoggedIn;

  late String _accessToken;
  String get accessToken => _accessToken;
}
