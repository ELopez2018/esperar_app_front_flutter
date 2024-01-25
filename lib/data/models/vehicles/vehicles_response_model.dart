import 'package:esperar_app_front_flutter/data/models/pageable_model.dart';
import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicles_response_model.g.dart';

@JsonSerializable()
class VehiclesResponseModel {
  VehiclesResponseModel({required this.content, required this.pageable});
  final List<VehicleModel> content;
  final PageableModel pageable;
  factory VehiclesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VehiclesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehiclesResponseModelToJson(this);
}
