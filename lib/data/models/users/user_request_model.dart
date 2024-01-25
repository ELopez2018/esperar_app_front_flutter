import 'package:json_annotation/json_annotation.dart';


part 'user_request_model.g.dart';

@JsonSerializable()
class UserModelRequest {
  UserModelRequest(
      {required this.email,
      required this.username,
      required this.password,
      required this.confirmPassword,
      required this.firstName,
      required this.secondName,
      required this.lastName,
      required this.birthrate,
      required this.gender,
      required this.documentNumber,
      required this.documentType,
      required this.phone});
      
  final String email;
  final String username;
  final String password;
  final String confirmPassword;
  final String firstName;
  final String secondName;
  final String lastName;
  final DateTime birthrate;
  final String gender;
  final String documentNumber;
  final String documentType;
  final int phone;
    factory UserModelRequest.fromJson(Map<String, dynamic> json) =>
      _$UserModelRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelRequestToJson(this);
}
