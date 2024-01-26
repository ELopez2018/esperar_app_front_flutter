import 'package:json_annotation/json_annotation.dart';

part 'company_request_model.g.dart';

@JsonSerializable()
class CompanyRequestModel {
  CompanyRequestModel({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.website,
  });

  final String name;
  final String address;
  final int phoneNumber;
  final String email;
  final String website;

  factory CompanyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyRequestModelToJson(this);
}
