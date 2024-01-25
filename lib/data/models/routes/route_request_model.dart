import 'package:json_annotation/json_annotation.dart';


part 'route_request_model.g.dart';

@JsonSerializable()
class RouteRequestModel {
  RouteRequestModel({required this.name, required this.from, required this.to});
  final String name;
  final String from;
  final String to;
    factory RouteRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RouteRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RouteRequestModelToJson(this);
}
