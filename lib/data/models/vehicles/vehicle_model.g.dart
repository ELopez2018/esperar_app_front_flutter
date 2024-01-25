// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      id: json['id'] as int,
      licensePlate: json['licensePlate'] as String,
      model: json['model'] as String,
      brand: json['brand'] as String,
      year: json['year'] as int,
      color: json['color'] as String,
      cylinderCapacity: (json['cylinderCapacity'] as num).toDouble(),
      capacity: json['capacity'] as int,
      occupancy: json['occupancy'] as int,
      owner: UserModel.fromJson(json['owner'] as Map<String, dynamic>),
      driver: UserModel.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'licensePlate': instance.licensePlate,
      'model': instance.model,
      'brand': instance.brand,
      'year': instance.year,
      'color': instance.color,
      'cylinderCapacity': instance.cylinderCapacity,
      'capacity': instance.capacity,
      'occupancy': instance.occupancy,
      'owner': instance.owner,
      'driver': instance.driver,
    };
