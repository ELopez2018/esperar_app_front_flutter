import 'package:json_annotation/json_annotation.dart';

part 'coordinate_update_model.g.dart';

@JsonSerializable()
class CoordinateUpdateModel {
  CoordinateUpdateModel({
    required this.latitude,
    required this.longitude,
  });

  final String latitude;
  final String longitude;

  factory CoordinateUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateUpdateModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinateUpdateModelToJson(this);
}
