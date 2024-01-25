// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateModel _$UserUpdateModelFromJson(Map<String, dynamic> json) =>
    UserUpdateModel(
      email: json['email'] as String?,
      username: json['username'] as String?,
      image: json['image'] as String?,
      firstName: json['firstName'] as String?,
      secondName: json['secondName'] as String?,
      lastName: json['lastName'] as String?,
      gender: json['gender'] as String?,
      documentNumber: json['documentNumber'] as int?,
      documentType: json['documentType'] as String?,
      phone: json['phone'] as int?,
      currentCountry: json['currentCountry'] as String?,
    );

Map<String, dynamic> _$UserUpdateModelToJson(UserUpdateModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'image': instance.image,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'documentNumber': instance.documentNumber,
      'documentType': instance.documentType,
      'phone': instance.phone,
      'currentCountry': instance.currentCountry,
    };
