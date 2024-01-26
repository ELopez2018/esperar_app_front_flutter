import 'package:esperar_app_front_flutter/data/models/pageable_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_response_model.g.dart';

@JsonSerializable()
class UsersResponseModel {
  UsersResponseModel({
    required this.content,
    required this.pageable,
  });

  final List<UserModel> content;
  final PageableModel pageable;

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UsersResponseModelToJson(this);
}
