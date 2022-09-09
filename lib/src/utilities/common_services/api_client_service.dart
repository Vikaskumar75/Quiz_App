import 'dart:io';

import 'package:dio/dio.dart';

import '../interceptors/common_interceptor.dart';

class ApiClient {
  ApiClient._();
  static final ApiClient _instance = ApiClient._();
  static ApiClient get instance => _instance;

  final String baseUrl = Platform.isAndroid
      ? 'http://10.0.2.2:3000/api/v1'
      : 'http://localhost:3000/api/v1';

  late Dio _dio;
  Dio get getClient => _dio;

  void initialize() {
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      contentType: 'application/json',
      baseUrl: baseUrl,
    );
    _dio = Dio(baseOptions);

    // Adding Interceptors
    _dio.interceptors.add(CommonInterceptor());
  }
}
