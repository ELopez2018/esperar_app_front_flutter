import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/data/models/auth/auth_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/auth/auth_response_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_update_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/users_response_model.dart';

class UserService {
  late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost));

  Future<AuthResponseModel?> singUp(AuthRequestModel user) async {
    try {
      final response = await _dio.post('/users/signup', data: user.toJson());
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return AuthResponseModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<UsersResponseModel?> findAllUsers(String accessToken) async {
    try {
      final response = await _dio.get('users',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return UsersResponseModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<UserModel?> findUserById(int id, String accessToken) async {
    try {
      final response = await _dio.get('/users/$id',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return UserModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }


  Future<UsersResponseModel?> findUserByIdCompany(int id, String accessToken) async {
    try {
      final response = await _dio.get('/users/by-company/$id',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return UsersResponseModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<UserModel?> updateUser(
      int id, UserUpdateModel user, String accessToken) async {
    try {
      final response = await _dio.put('/users/$id',
          data: user,
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return UserModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<bool?> deleteUser(int id, String accessToken) async {
    try {
      final response = await _dio.delete('/users/$id',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
          if(response.statusCode == 204){
            return true;
          }
          return false;
    } on DioException catch (_) {
      print(_);
    }
  }
}
