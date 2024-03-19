import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/core/interceptors/refresh_token.dart';
import 'package:esperar_app_front_flutter/data/models/companies/companies_response_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';

class ChatService {
  ChatService({required this.localStorageInterface});
  final LocalStorageInterface localStorageInterface;
  late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost))
    ..interceptors.add(
      ValidateTokenInterceptor(
        localStorageInterface: localStorageInterface,
      ),
    );

  Future<CompaniesResponseModel?> findAllMessage(String accessToken) async {
    try {
      final response = await _dio.get('/chats',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return CompaniesResponseModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<List<UserModel>?> getChats() async {
    try {
      final response = await _dio.get('/users/connectedUsers');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((e) => UserModel.fromJson(e)).toList();
      }
    } on DioException catch (_) {}
  }
}
