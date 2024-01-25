// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehiclesResponseModel _$VehiclesResponseModelFromJson(
        Map<String, dynamic> json) =>
    VehiclesResponseModel(
      content: (json['content'] as List<dynamic>)
          .map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable:
          PageableModel.fromJson(json['pageable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehiclesResponseModelToJson(
        VehiclesResponseModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
    };
