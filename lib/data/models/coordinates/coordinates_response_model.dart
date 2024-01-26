import 'package:esperar_app_front_flutter/data/models/coordinates/coordinates_model.dart';
import 'package:esperar_app_front_flutter/data/models/pageable_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coordinates_response_model.g.dart';

@JsonSerializable()
class CoordinatesResponseModel {
  CoordinatesResponseModel({
    required this.content,
    required this.pageable,
  });
  
  final List<CoordinatesModel> content;
  final PageableModel pageable;

  factory CoordinatesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesResponseModelToJson(this);
}
