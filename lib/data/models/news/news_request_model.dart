import 'package:json_annotation/json_annotation.dart';

part 'news_request_model.g.dart';

@JsonSerializable()
class NewsRequestModel {
  NewsRequestModel({
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

    factory NewsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$NewsRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsRequestModelToJson(this);
}
