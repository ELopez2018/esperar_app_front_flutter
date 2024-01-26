import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/data/models/coordinates/coordinate_update_model.dart';
import 'package:esperar_app_front_flutter/data/models/coordinates/coordinates_model.dart';
import 'package:esperar_app_front_flutter/data/models/coordinates/coordinates_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/coordinates/coordinates_response_model.dart';


class CoordinatesService{
    late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost));



 Future<CoordinatesModel?> createCoordinate(CoordinatesRequestModel coordinate) async {
    try {
      final response = await _dio.post('/coordinates', data: coordinate);
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return CoordinatesModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<CoordinatesResponseModel?> findAllCoordinates(String accessToken) async {
    try {
      final response = await _dio.get('/coordinates',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return CoordinatesResponseModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<CoordinatesModel?> findCoordinateById(int id, String accessToken) async {
    try {
      final response = await _dio.get('/coordinates/$id',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return CoordinatesModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<CoordinatesModel?> updateCoordinate(
      int id, CoordinateUpdateModel coordinate, String accessToken) async {
    try {
      final response = await _dio.put('/coordinates/$id',
          data: coordinate,
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return CoordinatesModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<bool?> deleteCoordinate(int id, String accessToken) async {
    try {
      final response = await _dio.delete('/coordinates/$id',
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