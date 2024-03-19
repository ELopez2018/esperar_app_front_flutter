import 'dart:convert';

import 'package:esperar_app_front_flutter/data/models/chat/chat_model.dart';
import 'package:esperar_app_front_flutter/data/models/chat/chat_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/services/socket_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class ChatProvider extends ChangeNotifier {
  final LocalStorageInterface localStorageInterface;
  final SocketService socketService;
  UserModel? userRecipient;
  UserModel? user;
  List<ChatModel> messages = [];

  final TextEditingController message = TextEditingController();

  ChatProvider({
    required this.localStorageInterface,
    required this.socketService,
  });

  init() async {
     user = await localStorageInterface.getUser();
    socketService.getStompClient().subscribe(
        destination: '/user/${user!.username}/queue/messages',
        callback: (StompFrame stom) {
          final data = jsonDecode(stom.body!);
          if (!messages.any((element) => element.id == data['id'])) {
            messages.add(ChatModel.fromJson(data));
            notifyListeners();
          }
        });
    socketService.getStompClient().subscribe(
        destination: '/user/public',
        callback: (StompFrame stom) {
        });
  }

  sendMessage() async {
    final user = await localStorageInterface.getUser();
    socketService.getStompClient().send(
        destination: '/app/chat',
        body: jsonEncode(
          ChatRequestModel(
            senderId: user!.username!,
            recipientId: userRecipient!.username!,
            content: message.text,
            timestamp: DateTime.now(),
          ),
        ),
        headers: {});
    messages.add(
      ChatModel(
        senderId: user.username!,
        recipientId: userRecipient!.username!,
        content: message.text,
      ),
    );
    message.text = '';
    notifyListeners();
  }

  void setUser(UserModel user) {
    userRecipient = user;
    notifyListeners();
  }
}


    // const chatMessage = {
    //   senderId: username,
    //   recipientId: selectedUserId,
    //   content: messageInput.value.trim(),
    //   timestamp: new Date(),
    // };