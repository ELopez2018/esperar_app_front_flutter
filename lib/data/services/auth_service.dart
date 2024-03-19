import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/core/interceptors/refresh_token.dart';
import 'package:esperar_app_front_flutter/data/models/auth/auth_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/auth/auth_response_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';

class AuthService {
  AuthService({required this.localStorageInterface});
  final LocalStorageInterface localStorageInterface;
  late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost))
    ..interceptors.add(
      ValidateTokenInterceptor(
        localStorageInterface: localStorageInterface,
      ),
    );

  Future<AuthResponseModel?> login(AuthRequestModel auth) async {
    try {
      final response = await _dio.post('/auth/login',
          options: Options(headers: {
            'Content-Type': 'application/json',
          }),
          data: auth.toJson());
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return AuthResponseModel.fromJson(data);
      }
      return null;
    } on DioException catch (_) {
      exception(_);
    }
  }

  Future<bool?> logout(String accessToken) async {
    try {
      final response = await _dio.post('/auth/logout',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        return true;
      }
      return null;
    } on DioException catch (_) {
      exception(_);
    }
  }

  Future<bool?> ValidateToken(String accessToken) async {
    try {
      final response = await _dio.get('auth/validate-token',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        return response.data as bool;
      }
      return null;
    } on DioException catch (_) {
      exception(_);
    }
  }

  Future<UserModel?> getUser(String accessToken) async {
    try {
      final response = await _dio.get('/auth/current-user',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return UserModel.fromJson(data);
      }
      return null;
    } on DioException catch (_) {
      exception(_);
    }
  }

  Future<UserModel?> getUserTemp(String accessToken) async {
    try {
      final response = await _dio.get('/auth/current-user',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return UserModel.fromJson(data);
      }
      return null;
    } on DioException catch (_) {
      exception(_);
    }
  }

  void exception(DioException _) {
    final Map<String, dynamic> data = _.response!.data;
    if (data.isNotEmpty) {
      if (data.containsKey('backedMessage')) {
        throw data['backedMessage'];
      }
    }
    throw 'Se ha producido un error inténtalo nuevamente, si el error persiste comunícate con soporte';
  }
}
