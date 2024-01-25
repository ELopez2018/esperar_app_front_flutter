// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      username: json['username'] as String,
      fullName: json['fullName'] as String,
      image: json['image'] as String?,
      firstName: json['firstName'] as String,
      secondName: json['secondName'] as String?,
      lastName: json['lastName'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
      gender: json['gender'] as String,
      documentNumber: json['documentNumber'] as int,
      documentType: json['documentType'] as String,
      phone: json['phone'] as int,
      currentCountry: json['currentCountry'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'fullName': instance.fullName,
      'image': instance.image,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'lastName': instance.lastName,
      'birthdate': instance.birthdate.toIso8601String(),
      'gender': instance.gender,
      'documentNumber': instance.documentNumber,
      'documentType': instance.documentType,
      'phone': instance.phone,
      'currentCountry': instance.currentCountry,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
