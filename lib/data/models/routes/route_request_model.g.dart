// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteRequestModel _$RouteRequestModelFromJson(Map<String, dynamic> json) =>
    RouteRequestModel(
      name: json['name'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
    );

Map<String, dynamic> _$RouteRequestModelToJson(RouteRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'from': instance.from,
      'to': instance.to,
    };
