import 'package:esperar_app_front_flutter/data/models/pageable_model.dart';
import 'package:esperar_app_front_flutter/data/models/routes/route_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'routes_response_model.g.dart';

@JsonSerializable()
class RoutesResponseModel {
  RoutesResponseModel({required this.content, required this.pageable});
  final List<RouteModel> content;
  final PageableModel pageable;
    factory RoutesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RoutesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoutesResponseModelToJson(this);
}
