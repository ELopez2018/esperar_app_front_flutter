import 'package:json_annotation/json_annotation.dart';


part 'user_update_model.g.dart';

@JsonSerializable()
class UserUpdateModel{
  UserUpdateModel({required this.email, required this.username, required this.image, required this.firstName, required this.secondName, required this.lastName, required this.gender, required this.documentNumber, required this.documentType, required this.phone, required this.currentCountry});
    final String? email;
    final String? username;
    final String? image;
    final String? firstName;
    final String? secondName;
    final String? lastName;
    final String? gender;
    final int? documentNumber;
    final String? documentType;
    final int? phone;
    final String? currentCountry;
  factory UserUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserUpdateModelToJson(this);
}