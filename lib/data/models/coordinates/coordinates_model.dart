import 'package:json_annotation/json_annotation.dart';


part 'coordinates_model.g.dart';

@JsonSerializable()
class CoordinatesModel {
  CoordinatesModel(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt});
  final int id;
  final String latitude;
  final String longitude;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
    factory CoordinatesModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesModelToJson(this);
}
