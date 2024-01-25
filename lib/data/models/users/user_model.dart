import 'package:json_annotation/json_annotation.dart';


part 'user_model.g.dart';

@JsonSerializable()
class UserModel{
  UserModel({required this.id, required this.email, required this.username, required this.fullName, required this.image, required this.firstName, required this.secondName, required this.lastName, required this.birthdate, required this.gender, required this.documentNumber, required this.documentType, required this.phone, required this.currentCountry, required this.createdAt, required this.updatedAt, required this.deletedAt});
    final int id;
    final String email;
    final String username;
    final String fullName;
    final String? image;
    final String firstName;
    final String? secondName;
    final String lastName;
    final DateTime birthdate;
    final String gender;
    final int documentNumber;
    final String documentType;
    final int phone;
    final String? currentCountry;
    final String createdAt;
    final String? updatedAt;
    final String? deletedAt;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}