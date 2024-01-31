import 'package:json_annotation/json_annotation.dart';

part 'auth_request_model.g.dart';

@JsonSerializable()
class AuthRequestModel {
  AuthRequestModel({
    required this.username,
    required this.password,
    this.confirmPassword,
  });

  final String username;
  final String password;
  final String? confirmPassword;
  
  factory AuthRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRequestModelToJson(this);
}
