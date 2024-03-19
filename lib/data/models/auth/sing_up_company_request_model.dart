import 'package:json_annotation/json_annotation.dart';

part 'sing_up_company_request_model.g.dart';

@JsonSerializable()
class SingUpCompanyRequest{
  SingUpCompanyRequest({required this.name, required this.nit, required this.legalRepresentativeId, required this.address, required this.email, required this.neighborhood, required this.city, required this.department, required this.country, required this.phone, required this.cellPhone, required this.whatsapp, required this.username, required this.password, required this.confirmPassword, required this.termsAndConditions});
  final String name;
  final String nit;
  final int legalRepresentativeId;
  final String address;
  final String email;
  final String neighborhood;
  final String city;
  final String department;
  final String country;
  final String phone;
  final String cellPhone;
  final String whatsapp;
  final String username;
  final String password;
  final String confirmPassword;
  final bool termsAndConditions;

  factory SingUpCompanyRequest.fromJson(Map<String, dynamic> json) =>
      _$SingUpCompanyRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SingUpCompanyRequestToJson(this);
}