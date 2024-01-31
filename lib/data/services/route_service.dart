import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/routes/routes_response_model.dart';

class RouteService {
  late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost));

  Future<RouteModel?> createRoute(String accessToken, RouteRequestModel route) async {
    try {
      final response = await _dio.post('/routes',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
        }
      ),
       data: route.toJson());
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return RouteModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<RoutesResponseModel?> findAllRoutes(String accessToken) async {
    try {
      final response = await _dio.get('/routes',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return RoutesResponseModel.fromJson(data);
      }
      return null;
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<RouteModel?> findRouteById(int id, String accessToken) async {
    try {
      final response = await _dio.get('/routes/$id',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return RouteModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<RouteModel?> updateRoute(
      int id, RouteRequestModel user, String accessToken) async {
    try {
      final response = await _dio.put('/routes/$id',
          data: user,
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        if (data != null) {
          return RouteModel.fromJson(data);
        }
        return null;
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<bool?> deleteRoute(int id, String accessToken) async {
    try {
      final response = await _dio.delete('/routes/$id',
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
