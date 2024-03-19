import 'package:esperar_app_front_flutter/data/models/coordinates/coordinates_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'route_model.g.dart';

@JsonSerializable()
class RouteModel {
  RouteModel(
      {required this.id,
      required this.name,
      required this.from,
      required this.to,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt,
      required this.coordinates});

  final int? id;
  final String? name;
  final String? from;
  final String? to;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final List<CoordinatesModel?>? coordinates;

  factory RouteModel.fromJson(Map<String, dynamic> json) =>
      _$RouteModelFromJson(json);
  Map<String, dynamic> toJson() => _$RouteModelToJson(this);
  
}
