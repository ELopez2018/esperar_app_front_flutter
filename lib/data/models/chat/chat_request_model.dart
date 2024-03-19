import 'package:json_annotation/json_annotation.dart';

part 'chat_request_model.g.dart';

@JsonSerializable()
class ChatRequestModel{
      final String senderId;
      final String recipientId;
      final String content;
      final DateTime? timestamp;

  ChatRequestModel({required this.senderId, required this.recipientId, required this.content, required this.timestamp});

  
  factory ChatRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRequestModelToJson(this);

}