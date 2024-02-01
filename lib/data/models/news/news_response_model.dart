import 'package:esperar_app_front_flutter/data/models/news/news_model.dart';
import 'package:esperar_app_front_flutter/data/models/pageable_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_response_model.g.dart';

@JsonSerializable()
class NewsResponseModel {
  NewsResponseModel({
    required this.content,
    required this.pageable,
  });

  final List<NewsModel?> content;
  final PageableModel? pageable;

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponseModelToJson(this);
}
