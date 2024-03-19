import 'package:json_annotation/json_annotation.dart';

part 'sing_up_user_request_model.g.dart';

@JsonSerializable()
class SingUpUserRequest {
  SingUpUserRequest({
    required this.email,
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.firstName,
    required this.secondName,
    required this.lastName,
    required this.birthdate,
    required this.gender,
    required this.documentNumber,
    required this.documentType,
    required this.phone,
    required this.termsAndConditions,
    required this.licenseExpirationDate,
  });
  final String email;
  final String username;
  final String password;
  final String confirmPassword;
  final String firstName;
  final String secondName;
  final String lastName;
  final String birthdate;
  final String gender;
  final String documentNumber;
  final String documentType;
  final String phone;
  final bool termsAndConditions;
  final String licenseExpirationDate;

  factory SingUpUserRequest.fromJson(Map<String, dynamic> json) =>
      _$SingUpUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SingUpUserRequestToJson(this);
}
