import 'package:esperar_app_front_flutter/data/models/companies/company_model.dart';
import 'package:esperar_app_front_flutter/data/models/pageable_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'companies_response_model.g.dart';

@JsonSerializable()
class CompaniesResponseModel {
  CompaniesResponseModel({
    required this.content,
    required this.pageable,
  });
  
  final List<CompanyModel> content;
  final PageableModel pageable;

  factory CompaniesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CompaniesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CompaniesResponseModelToJson(this);
}
