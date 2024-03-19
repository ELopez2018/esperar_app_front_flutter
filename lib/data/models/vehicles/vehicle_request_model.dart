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
    required this.driverId,
    required this.companyId,
  });

  final String licensePlate;
  final String brand;
  final String model;
  final String color;
  final int year;
  final double cylinderCapacity;
  final int capacity;
  final int occupancy;
  final int driverId;
  final int companyId;

  factory VehicleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleRequestModelToJson(this);
}
