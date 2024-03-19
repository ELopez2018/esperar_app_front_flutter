import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/core/interceptors/refresh_token.dart';
import 'package:esperar_app_front_flutter/data/models/auth/sing_up_company_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/auth/sing_up_company_response_model.dart';
import 'package:esperar_app_front_flutter/data/models/auth/sing_up_user_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/auth/sing_up_user_response_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_update_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/users_response_model.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';

class UserService {
  final LocalStorageInterface localStorageInterface;
  late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost))..interceptors.add(
      ValidateTokenInterceptor(
        localStorageInterface: localStorageInterface,
      ),
    );

  UserService({required this.localStorageInterface});

  Future<SingUpUserResponse?> singUpUser(SingUpUserRequest user) async {
    try {
      final response = await _dio.post('/users/sign-up/natural-person', data: user.toJson());
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return SingUpUserResponse.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

    Future<SingUpCompanyResponse?> singUpCompany(SingUpCompanyRequest user) async {
    try {
      final response = await _dio.post('/sign-up/legal-person', data: user.toJson());
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return SingUpCompanyResponse.fromJson(data);
      }
    } on DioException catch (_) {
      throw 'Error';
    }
  }

  Future<UsersResponseModel?> findAllUsers() async {
    try {
      final response = await _dio.get('users'
         );
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return UsersResponseModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<UserModel?> findUserById(int id) async {
    try {
      final response = await _dio.get('/users/$id'
          );
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return UserModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }


  Future<UsersResponseModel?> findUserByIdCompany(int id) async {
    try {
      final response = await _dio.get('/users/find-by-company/$id'
        );
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return UsersResponseModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<UserModel?> updateUser(
      int id, UserUpdateModel user) async {
    try {
      final response = await _dio.put('/users/$id',
          data: user
        );
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return UserModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<bool?> deleteUser(int id) async {
    try {
      final response = await _dio.delete('/users/$id'
         );
          if(response.statusCode == 204){
            return true;
          }
          return false;
    } on DioException catch (_) {
      print(_);
    }
  }
}
