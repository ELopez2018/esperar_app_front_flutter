import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/core/interceptors/refresh_token.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_model.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicles_response_model.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';

class VehicleService {
  VehicleService({required this.localStorageInterface});

  final LocalStorageInterface localStorageInterface;
  late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost))
    ..interceptors.add(
      ValidateTokenInterceptor(
        localStorageInterface: localStorageInterface,
      ),
    );

  Future<VehicleModel?> createVehicle(
       VehicleRequestModel vehicle) async {
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

  Future<VehiclesResponseModel?> findAllVehicles() async {
    try {
      final response = await _dio.get('/vehicles');
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return VehiclesResponseModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<VehicleModel?> findVehicleById(int id) async {
    try {
      final response = await _dio.get(
        '/vehicles/$id',
      );
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return VehicleModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<VehicleModel?> updateVehicle(
      int id, VehicleRequestModel vehicle) async {
    try {
      final response = await _dio.put('/vehicles/$id', data: vehicle.toJson());
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
      final response = await _dio.delete('/vehicles/$id');
      if (response.statusCode == 204) {
        return true;
      }
      return false;
    } on DioException catch (_) {
      print(_);
    }
  }

  Future assignDriverToVehicle(int vehicleId, int driverId) async {
    try {
      await _dio.get('/vehicles/assignDriver/$vehicleId/$driverId');
    } on DioException catch (_) {
      print(_);
    }
  }
}
