import 'package:json_annotation/json_annotation.dart';

part 'sing_up_user_response_model.g.dart';

@JsonSerializable()
class SingUpUserResponse{
  SingUpUserResponse({ required this.id, required this.email, required this.username, required this.firstName, required this.secondName, required this.lastName, required this.birthdate, required this.gender, required this.documentNumber, required this.documentType, required this.phone, required this.termsAndConditions}); 
  final int id;
  final String? email;
  final String? username;
  final String? firstName; 
  final String? secondName;
  final String? lastName;
  final String? birthdate;
  final String? gender;
  final String? documentNumber;
  final String? documentType;
  final String? phone;
  final bool? termsAndConditions;


  factory SingUpUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SingUpUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SingUpUserResponseToJson(this);
}