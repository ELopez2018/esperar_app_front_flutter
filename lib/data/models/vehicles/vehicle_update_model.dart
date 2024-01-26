import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_update_model.g.dart';

@JsonSerializable()
class VehicleUpdateModel {
  VehicleUpdateModel({
    required this.color,
    required this.occupancy,
    required this.owner,
    required this.driver,
  });
  
  final String? color;
  final int? occupancy;
  final UserModel? owner;
  final UserModel? driver;

  factory VehicleUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleUpdateModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleUpdateModelToJson(this);
}
