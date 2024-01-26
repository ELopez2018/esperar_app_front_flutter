import 'package:json_annotation/json_annotation.dart';

part 'auth_request_model.g.dart';

@JsonSerializable()
class AuthRequestModel {
  AuthRequestModel({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;
  
  factory AuthRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRequestModelToJson(this);
}
