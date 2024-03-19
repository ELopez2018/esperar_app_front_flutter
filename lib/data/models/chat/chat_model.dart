import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  final String? id;
  final String senderId;
  final String recipientId;
  final String content;

  ChatModel({
     this.id,
    required this.senderId,
    required this.recipientId,
    required this.content,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
