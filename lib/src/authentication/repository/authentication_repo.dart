import 'dart:convert';

import 'package:http/http.dart' as http;

part 'authentication_model.dart';
part 'authentication_service.dart';

class AuthenticationRepo implements AuthenticationService {
  AuthenticationRepo._();
  static final AuthenticationRepo instance = AuthenticationRepo._();

  @override
  Future<AuthenticationModel> signUp() async {
    final Uri _url = Uri.parse('');
    final http.Response response = await http.get(_url);
    return AuthenticationModel.fromJson(response.body);
  }

  @override
  Future<AuthenticationModel> login({
    required String email,
    required String password,
  }) async {
    final Uri _url = Uri.parse('');
    final http.Response response = await http.get(_url);
    return AuthenticationModel.fromJson(response.body);
  }

  @override
  Future<void> sendOtp({required String email}) async {}
}
