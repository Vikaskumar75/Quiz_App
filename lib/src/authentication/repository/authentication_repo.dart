// ignore_for_file: always_specify_types
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../utilities/export.dart';

part 'authentication_service.dart';
part 'models/authentication_model.dart';
part 'models/otp_model.dart';
part 'models/registration_model.dart';

class AuthenticationRepo implements AuthenticationService {
  AuthenticationRepo._();
  static final AuthenticationRepo instance = AuthenticationRepo._();
  final Dio dio = ApiClient.instance.getClient;

  @override
  Future<AuthenticationModel> signUp(RegistrationModel model) async {
    try {
      final data = model.toJson();
      final Response response = await dio.post('/users/signup', data: data);
      return AuthenticationModel.fromJson(response.data);
    } on AppError catch (_) {
      rethrow;
    }
  }

  @override
  Future<AuthenticationModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final data = <String, dynamic>{'email': email, 'password': password};
      final Response response = await dio.post('/users/login', data: data);
      return AuthenticationModel.fromJson(response.data);
    } on AppError catch (_) {
      rethrow;
    }
  }

  @override
  Future<OtpModel> sendOtp({required String email}) async {
    try {
      final data = <String, dynamic>{'email': email};
      final Response response = await dio.post('/emails/sendotp', data: data);
      return OtpModel.fromJson(response.data);
    } on AppError catch (_) {
      rethrow;
    }
  }
}
