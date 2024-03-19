import 'dart:convert';

import 'package:esperar_app_front_flutter/data/models/chat/chat_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/services/chat_service.dart';
import 'package:esperar_app_front_flutter/data/services/socket_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class ListChatsProvider extends ChangeNotifier {
  final ChatService chatService;
  final LocalStorageInterface localStorageInterface;
  UserModel? user;
  final SocketService socketService;
  List<UserModel>? chats;
  UserModel? chat;

  ListChatsProvider(
      {required this.chatService,
      required this.localStorageInterface,
      required this.socketService});

  void init() async {
    final user = await localStorageInterface.getUser();
    
    
    socketService.getStompClient().send(
        destination: '/app/user.addUser',
        body: jsonEncode({'username': user!.username}));

    final response = await chatService.getChats();
    if (response != null) {
      if (response.isNotEmpty) {
        chats = response.where((element) => element.id != user.id).toList() ?? [];
      }
    }
    notifyListeners();
  }

  sendMessage() async {
    final user = await localStorageInterface.getUser();
    //socketService.getStompClient().send(destination: '', body: ChatRequestModel(senderId: user!.id, recipientId: , content: content, timestamp: timestamp) )
  }
}

//  stompClient.subscribe(`/user/public`, onMessageReceived);
