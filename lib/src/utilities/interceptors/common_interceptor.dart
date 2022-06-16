import 'dart:io';

import 'package:dio/dio.dart';
import 'package:quiz_app/src/utilities/export.dart';

class CommonInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.error is SocketException) {
      DialogService.instance.showDialog(
        message: Strings.internetError,
        textColor: ColorPallet.orange,
        autoHide: false,
      );
      return;
    }
    final AppError error = AppError.createError(err);
    super.onError(error, handler);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final Map<String, dynamic> headers = options.headers;
    headers['Authorization'] = 'Bearer ${StorageService.instance.accessToken}';
    super.onRequest(options, handler);
  }
}
