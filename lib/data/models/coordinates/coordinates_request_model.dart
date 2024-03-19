import 'package:json_annotation/json_annotation.dart';

part 'coordinates_request_model.g.dart';

@JsonSerializable()
class CoordinatesRequestModel {
  CoordinatesRequestModel({
    required this.latitude,
    required this.longitude,
  });

  final String latitude;
  final String longitude;

  factory CoordinatesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesRequestModelToJson(this);
}
