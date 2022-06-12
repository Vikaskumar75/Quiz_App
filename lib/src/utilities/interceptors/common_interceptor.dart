import 'package:dio/dio.dart';
import 'package:quiz_app/src/utilities/common_services/storage_service.dart';

class CommonInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) { 
    options.headers.addAll(
      <String, dynamic>{
        'Authorization': 'Bearer ${StorageService.instance.accessToken}',
      },
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    super.onResponse(response, handler);
  }
}
