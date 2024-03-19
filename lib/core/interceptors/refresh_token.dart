import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';

class ValidateTokenInterceptor extends Interceptor {
  ValidateTokenInterceptor({required this.localStorageInterface});

  final LocalStorageInterface localStorageInterface;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? access = await localStorageInterface.getAccessToken();
    if (access != null) {
      options.headers['Authorization'] = 'Bearer $access';
      options.contentType = 'application/json';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response!.statusCode == 401) {
      //refresh token
      localStorageInterface.clean();
    }
    handler.next(err);
  }
}
