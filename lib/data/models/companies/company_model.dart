import 'package:esperar_app_front_flutter/data/models/vehicles/vehicle_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  CompanyModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.website,
    required this.vehicles,
  });

  final int id;
  final String name;
  final String address;
  final int phoneNumber;
  final String email;
  final String website;
  final List<VehicleModel> vehicles;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
