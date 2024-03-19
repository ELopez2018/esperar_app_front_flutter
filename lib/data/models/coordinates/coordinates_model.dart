import 'package:json_annotation/json_annotation.dart';

part 'coordinates_model.g.dart';

@JsonSerializable()
class CoordinatesModel {
  CoordinatesModel({
    required this.id,
    required this.latitude,
    required this.longitude,
  });

  final int id;
  final String latitude;
  final String longitude;

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesModelToJson(this);
}
