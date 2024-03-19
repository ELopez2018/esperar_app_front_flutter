import 'package:esperar_app_front_flutter/data/models/coordinates/coordinates_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_request_model.g.dart';

@JsonSerializable()
class RouteRequestModel {
  RouteRequestModel({
    required this.name,
    required this.from,
    required this.to,
    required this.coordinates,
    required this.stations
  });

  final String name;
  final String from;
  final String to;
  final List<CoordinatesRequestModel> coordinates;
  final List stations;

  factory RouteRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RouteRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RouteRequestModelToJson(this);
}
