// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleUpdateModel _$VehicleUpdateModelFromJson(Map<String, dynamic> json) =>
    VehicleUpdateModel(
      color: json['color'] as String?,
      occupancy: json['occupancy'] as int?,
      owner: json['owner'] == null
          ? null
          : UserModel.fromJson(json['owner'] as Map<String, dynamic>),
      driver: json['driver'] == null
          ? null
          : UserModel.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleUpdateModelToJson(VehicleUpdateModel instance) =>
    <String, dynamic>{
      'color': instance.color,
      'occupancy': instance.occupancy,
      'owner': instance.owner,
      'driver': instance.driver,
    };
