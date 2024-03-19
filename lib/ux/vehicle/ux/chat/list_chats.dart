import 'dart:convert';

import 'package:esperar_app_front_flutter/core/const/navigate.dart';
import 'package:esperar_app_front_flutter/data/services/chat_service.dart';
import 'package:esperar_app_front_flutter/data/services/socket_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/vehicle/ux/chat/list_chats._provider.dart';
import 'package:esperar_app_front_flutter/ux/widgets/app_bar_custom.dart';
import 'package:esperar_app_front_flutter/ux/widgets/button_back_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListChats extends StatefulWidget {
  const ListChats._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListChatsProvider(
        chatService: Provider.of<ChatService>(context, listen: false),
        localStorageInterface:
            Provider.of<LocalStorageInterface>(context, listen: false),
        socketService: Provider.of<SocketService>(context, listen: false),
      ),
      builder: (context, child) => const ListChats._(),
    );
  }

  @override
  State<ListChats> createState() => _ListChatsState();
}

class _ListChatsState extends State<ListChats> {
  @override
  void initState() {
    final bloc = Provider.of<ListChatsProvider>(context, listen: false);
    bloc.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ListChatsProvider>(context);
    return Scaffold(
      body: bloc.chats != null
          ? bloc.chats!.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    final chat = bloc.chats![index];
                    return Column(
                      children: [
                        const AppBarCustom(
                          action: ButtonBackScreen(),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'CHATS',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text('empresa')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                              onTap: () {
                                bloc.chat = chat;
                                push(context, 'chat', chat);
                              },
                              child: SizedBox(
                                height: 80,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: Text('AC'),
                                      ),
                                    ),
                                    Text(chat.username ?? 'user $index')
                                  ],
                                ),
                              )),
                        ),
                      ],
                    );
                  },
                  itemCount: bloc.chats!.length,
                )
              : Center(
                  child: Text('No hay chats disponibles'),
                )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
