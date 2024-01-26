import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class VehicleModel {
  VehicleModel({
    required this.id,
    required this.licensePlate,
    required this.model,
    required this.brand,
    required this.year,
    required this.color,
    required this.cylinderCapacity,
    required this.capacity,
    required this.occupancy,
    required this.owner,
    required this.driver,
  });

  final int id;
  final String licensePlate;
  final String model;
  final String brand;
  final int year;
  final String color;
  final double cylinderCapacity;
  final int capacity;
  final int occupancy;
  final UserModel owner;
  final UserModel driver;

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}
