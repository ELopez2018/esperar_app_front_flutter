import 'package:json_annotation/json_annotation.dart';

part 'rol_model.g.dart';

@JsonSerializable()
class RolModel{
  final int id;
  final String name;

  RolModel({required this.id, required this.name});

  
  factory RolModel.fromJson(Map<String, dynamic> json) =>
      _$RolModelFromJson(json);
  Map<String, dynamic> toJson() => _$RolModelToJson(this);
}