import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/core/interceptors/refresh_token.dart';
import 'package:esperar_app_front_flutter/data/models/companies/companies_response_model.dart';
import 'package:esperar_app_front_flutter/data/models/companies/company_model.dart';
import 'package:esperar_app_front_flutter/data/models/companies/company_request_model.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';

class CompanyService {
  CompanyService({required this.localStorageInterface});

  final LocalStorageInterface localStorageInterface;
  
  late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost))
    ..interceptors.add(
      ValidateTokenInterceptor(
        localStorageInterface: localStorageInterface,
      ),
    );

  Future<CompanyModel?> createCompany(
      String accessToken, CompanyRequestModel company) async {
    try {
      final response = await _dio.post('/companies',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }),
          data: company.toJson());
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return CompanyModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<CompaniesResponseModel?> findAllComapnies(String accessToken) async {
    try {
      final response = await _dio.get('/companies',
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

  Future<int?> findCompanyById(int id, String accessToken) async {
    try {
      final response = await _dio.get('/companies/$id',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['vehiclesIds'];
        return data[0] as int;
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<CompanyModel?> updateCompany(
      int id, CompanyRequestModel company, String accessToken) async {
    try {
      final response = await _dio.put('/companies/$id',
          data: company,
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return CompanyModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<bool?> deleteCompany(int id, String accessToken) async {
    try {
      final response = await _dio.delete('/companies/$id',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 204) {
        return true;
      }
      return false;
    } on DioException catch (_) {
      print(_);
    }
  }
}
