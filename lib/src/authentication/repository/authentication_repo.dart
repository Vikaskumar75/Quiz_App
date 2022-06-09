import 'dart:convert';

import 'package:http/http.dart' as http;

part 'authentication_model.dart';
part 'authentication_service.dart';
part 'otp_model.dart';

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
  Future<OtpModel> sendOtp({required String email}) async {
    // Todo: move this base url to interceptors
    final Uri _url = Uri.parse('http://localhost:3000/api/v1/emails/sendotp');
    final http.Response response = await http.post(
      _url,
      body: jsonEncode(<String, dynamic>{'email': email}),
      headers: <String, String>{'Content-type': 'application/json'},
    );

    // Todo: Move these statuscode checks to interceptors
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw response;
    } else {
      return otpFromJson(response.body);
    }
  }
}
