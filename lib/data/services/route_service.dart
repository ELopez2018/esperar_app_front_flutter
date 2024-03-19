import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/core/interceptors/refresh_token.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/routes/routes_response_model.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';

class RouteService {
  final LocalStorageInterface localStorageInterface;
  late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost))..interceptors.add(
      ValidateTokenInterceptor(
        localStorageInterface: localStorageInterface,
      ),
    );

  RouteService({required this.localStorageInterface});

  Future<RouteModel?> createRoute(RouteRequestModel route) async {
    try {
      final response = await _dio.post('/routes',
       data: route.toJson());
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return RouteModel.fromJson(data);
      }
    } on DioException catch (_) {
      
      
      print(_);
    }
  }
  
  Future<RoutesResponseModel?> findAllRoutes() async {
    try {
      final response = await _dio.get('/routes',
          );
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return RoutesResponseModel.fromJson(data);
      }
      return null;
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<RouteModel?> findRouteById(int id) async {
    try {
      final response = await _dio.get('/routes/$id'
          );
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return RouteModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<RouteModel?> updateRoute(
      int id, RouteRequestModel user) async {
    try {
      final response = await _dio.put('/routes/$id',
          data: user,
          );
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

  Future<bool?> deleteRoute(int id) async {
    try {
      final response = await _dio.delete('/routes/$id',
        );
      if (response.statusCode == 204) {
        return true;
      }
      return false;
    } on DioException catch (_) {
      print(_);
    }
  }
}
