import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  NewsModel({
    required this.id,
    required this.title,
    required this.content,
   // required this.createdAt,
  });

  final int id;
  final String title;
  final String content;
  //final DateTime createdAt;


  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
