import 'package:json_annotation/json_annotation.dart';

part 'vehicle_request_model.g.dart';

@JsonSerializable()
class VehicleRequestModel {
  VehicleRequestModel({
    required this.licensePlate,
    required this.brand,
    required this.model,
    required this.color,
    required this.year,
    required this.cylinderCapacity,
    required this.capacity,
    required this.occupancy,
    required this.ownerId,
    required this.driverId,
  });

  final String licensePlate;
  final String brand;
  final String model;
  final String color;
  final int year;
  final double cylinderCapacity;
  final int capacity;
  final int occupancy;
  final int ownerId;
  final int driverId;

  factory VehicleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleRequestModelToJson(this);
}
