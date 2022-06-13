import 'dart:convert';

import 'package:quiz_app/src/authentication/repository/authentication_repo.dart';
import 'package:quiz_app/src/utilities/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService._();
  factory StorageService() => _instance;
  static final StorageService _instance = StorageService._();
  static StorageService get instance => _instance;

  Future<void> initialize() async {
    // Make sure that prefs is instantiated at the top since below commands needs to use _prefs
    _prefs = await SharedPreferences.getInstance();

    // This function will set the value of isLoggedIn, authModel and accessToken
    readAuthData();
  }

  late SharedPreferences _prefs;
  SharedPreferences get prefs => _prefs;

  late bool _isLoggedIn;
  bool get isLoggedIn => _isLoggedIn;

  String? _accessToken;
  String? get accessToken => _accessToken;

  AuthenticationModel? _model;
  AuthenticationModel? get authModel => _model;

  Future<void> saveAuthData(AuthenticationModel model) async {
    try {
      final String _authString = jsonEncode(model);
      await saveString(GlobalKeys.login, _authString);
      readAuthData();
    } catch (e) {
      throw Exception('Could not save the session');
    }
  }

  void readAuthData() {
    final String? _authString = readString(GlobalKeys.login);
    if (_authString == null) {
      _isLoggedIn = false;
      return;
    }

    try {
      _model = authenticationModelFromJson(_authString);
      _isLoggedIn = true;
      _accessToken = _model!.data.token;
    } catch (e) {
      throw AppError.createError('Could not read the session data');
    }
  }

  Future<void> saveString(String key, String data) async {
    await _prefs.setString(key, data);
  }

  String? readString(String key) => _prefs.getString(key);

  Future<void> deleteString(String key) async => await _prefs.remove(key);
}
