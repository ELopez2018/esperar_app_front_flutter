// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelRequest _$UserModelRequestFromJson(Map<String, dynamic> json) =>
    UserModelRequest(
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      firstName: json['firstName'] as String,
      secondName: json['secondName'] as String,
      lastName: json['lastName'] as String,
      birthrate: DateTime.parse(json['birthrate'] as String),
      gender: json['gender'] as String,
      documentNumber: json['documentNumber'] as String,
      documentType: json['documentType'] as String,
      phone: json['phone'] as int,
    );

Map<String, dynamic> _$UserModelRequestToJson(UserModelRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'lastName': instance.lastName,
      'birthrate': instance.birthrate.toIso8601String(),
      'gender': instance.gender,
      'documentNumber': instance.documentNumber,
      'documentType': instance.documentType,
      'phone': instance.phone,
    };
