// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutesResponseModel _$RoutesResponseModelFromJson(Map<String, dynamic> json) =>
    RoutesResponseModel(
      content: (json['content'] as List<dynamic>)
          .map((e) => RouteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable:
          PageableModel.fromJson(json['pageable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoutesResponseModelToJson(
        RoutesResponseModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
    };
