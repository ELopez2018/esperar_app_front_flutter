// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponseModel _$UsersResponseModelFromJson(Map<String, dynamic> json) =>
    UsersResponseModel(
      content: (json['content'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable:
          PageableModel.fromJson(json['pageable'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersResponseModelToJson(UsersResponseModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
    };
