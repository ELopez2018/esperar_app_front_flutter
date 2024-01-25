// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleRequestModel _$VehicleRequestModelFromJson(Map<String, dynamic> json) =>
    VehicleRequestModel(
      licensePlate: json['licensePlate'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      color: json['color'] as String,
      year: json['year'] as int,
      cylinderCapacity: (json['cylinderCapacity'] as num).toDouble(),
      capacity: json['capacity'] as int,
      occupancy: json['occupancy'] as int,
      ownerId: json['ownerId'] as int,
      driverId: json['driverId'] as int,
    );

Map<String, dynamic> _$VehicleRequestModelToJson(
        VehicleRequestModel instance) =>
    <String, dynamic>{
      'licensePlate': instance.licensePlate,
      'brand': instance.brand,
      'model': instance.model,
      'color': instance.color,
      'year': instance.year,
      'cylinderCapacity': instance.cylinderCapacity,
      'capacity': instance.capacity,
      'occupancy': instance.occupancy,
      'ownerId': instance.ownerId,
      'driverId': instance.driverId,
    };
