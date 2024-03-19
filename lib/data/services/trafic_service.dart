import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/data/models/trafic/places_model.dart';
import 'package:esperar_app_front_flutter/data/models/trafic/trafic_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class TrafficService {
  final Dio _dioTraffic;
  final Dio _dioPlace;
  final String _baseTraffic = 'https://api.mapbox.com/directions/v5/mapbox';
  final String _baseUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';
  TrafficService()
      : _dioTraffic = Dio()
          ..interceptors.add(
            TrafficInterceptor(),
          ),
        _dioPlace = Dio()..interceptors.add(TrafficInterceptor());

  Future<TrafficModel> getCoorsStartToEnd(LatLng start, LatLng end) async {
    final String coorsString =
        "${start.longitude},${start.latitude};${end.longitude},${end.latitude}";
    final String url = '$_baseTraffic/driving/$coorsString';
    final res = await _dioTraffic.get(url);
    final data = TrafficModel.fromMap(res.data); 
    return data;
  }

  Future<List<Feature>> getResultByQuery(LatLng proximity, String query) async {
    if (query.isEmpty) return [];
    final url = '$_baseUrl/$query.json';
    final response = await _dioPlace.get(
      url,
      queryParameters: {
        'proximity': '${proximity.longitude},${proximity.latitude}',
        'limit': 7
      },
    );
    final placeResponse = PlaceModel.fromMap(response.data);
    return placeResponse.features;
  }

  Future<Feature> getInformationByCoor(LatLng coors) async {
    final url = '$_baseUrl/${coors.longitude},${coors.latitude}.json';
    final response = await _dioPlace.get(url, queryParameters: {
      'limit': 1,
    });

    final placesResponse = PlaceModel.fromMap(response.data);
    return placesResponse.features[0];
  }
}

class TrafficInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'full',
      'steps': false,
      'access_token': 'pk.eyJ1IjoiY2FtaWxvOTlnb21leiIsImEiOiJjbHM5ZDBjdTAwNWl5Mmt0dnJyYzRyZ3dyIn0.0A_4urfVzReqUuSSNHZbJQ',
    });
    super.onRequest(options, handler);
  }
}

class PlaceInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters
        .addAll({'access_token': 'pk.eyJ1IjoiY2FtaWxvOTlnb21leiIsImEiOiJjbHM5ZDBjdTAwNWl5Mmt0dnJyYzRyZ3dyIn0.0A_4urfVzReqUuSSNHZbJQ', 'languaje': 'es'});
    super.onRequest(options, handler);
  }
}
