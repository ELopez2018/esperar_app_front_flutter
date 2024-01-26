import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_model.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicles_response_model.dart';

class VehicleService{
    late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost));


 Future<VehicleModel?> createVehicle(VehicleRequestModel vehicle ) async {
    try {
      final response = await _dio.post('/vehicles/create', data: vehicle);
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return VehicleModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<VehiclesResponseModel?> findAllVehicles(String accessToken) async {
    try {
      final response = await _dio.get('/vehicles',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return  VehiclesResponseModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<VehicleModel?> findVehicleById(int id, String accessToken) async {
    try {
      final response = await _dio.get('/vehicles/$id',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return VehicleModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<VehicleModel?> updateVehicle(
      int id, VehicleRequestModel user, String accessToken) async {
    try {
      final response = await _dio.put('/vehicles/$id',
          data: user,
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return VehicleModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<bool?> deleteVehicle(int id, String accessToken) async {
    try {
      final response = await _dio.delete('/vehicles/$id',
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