import 'package:json_annotation/json_annotation.dart';


part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  AuthResponseModel({required this.id, required this.accessToken});
  final int id;
  final String accessToken;
    factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}
