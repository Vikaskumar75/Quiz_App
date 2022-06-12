import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/src/services/device_info_service.dart';

part 'authentication_service.dart';
part 'models/authentication_model.dart';
part 'models/otp_model.dart';
part 'models/registration_model.dart';

class AuthenticationRepo implements AuthenticationService {
  AuthenticationRepo._();
  static final AuthenticationRepo instance = AuthenticationRepo._();

  @override
  Future<AuthenticationModel> signUp(RegistrationModel model) async {
    final Uri _url = Uri.parse('http://localhost:3000/api/v1/users/signup');
    final http.Response response = await http.post(
      _url,
      body: jsonEncode(model.toJson()),
      headers: <String, String>{'Content-type': 'application/json'},
    );

    // Todo: Move these statuscode checks to interceptors
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw response;
    } else {
      return authenticationModelFromJson(response.body);
    }
  }

  @override
  Future<AuthenticationModel> login({
    required String email,
    required String password,
  }) async {
    final Uri _url = Uri.parse('http://localhost:3000/api/v1/users/login');
    final http.Response response = await http.post(
      _url,
      body: jsonEncode(<String, dynamic>{'email': email, 'password': password}),
      headers: <String, String>{'Content-type': 'application/json'},
    );
    
    // Todo: Move these statuscode checks to interceptors
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw response;
    } else {
      return authenticationModelFromJson(response.body);
    }
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
