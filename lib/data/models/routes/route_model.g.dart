// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteModel _$RouteModelFromJson(Map<String, dynamic> json) => RouteModel(
      id: json['id'] as int,
      name: json['name'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: DateTime.parse(json['deletedAt'] as String),
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => CoordinatesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RouteModelToJson(RouteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'from': instance.from,
      'to': instance.to,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt.toIso8601String(),
      'coordinates': instance.coordinates,
    };
