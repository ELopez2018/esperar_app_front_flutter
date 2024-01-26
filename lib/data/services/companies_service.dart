import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/data/models/companies/companies_response_model.dart';
import 'package:esperar_app_front_flutter/data/models/companies/company_model.dart';
import 'package:esperar_app_front_flutter/data/models/companies/company_request_model.dart';

class CompaniesService{
  late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost));



 Future<CompanyModel?> createCompany(CompanyRequestModel company) async {
    try {
      final response = await _dio.post('/companies', data: company);
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

  Future<CompanyModel?> findCompanyById(int id, String accessToken) async {
    try {
      final response = await _dio.get('/companies/$id',
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
          if(response.statusCode == 204){
            return true;
          }
          return false;
    } on DioException catch (_) {
      print(_);
    }
  }
}