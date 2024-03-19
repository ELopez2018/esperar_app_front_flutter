import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/services/socket_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:esperar_app_front_flutter/ux/vehicle/ux/chat/ux/chat_provider.dart';
import 'package:esperar_app_front_flutter/ux/vehicle/ux/chat/widgets/message_received.dart';
import 'package:esperar_app_front_flutter/ux/vehicle/ux/chat/widgets/message_sent.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen._();

  static Widget init(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserModel;
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(
        localStorageInterface:
            Provider.of<LocalStorageInterface>(context, listen: false),
        socketService: Provider.of<SocketService>(context, listen: false),
      )
        ..setUser(user)
        ..init(),
      builder: (context, child) => const ChatScreen._(),
    );
  }

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    final bloc = Provider.of<ChatProvider>(context, listen: false);
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ChatProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBarCustom(
              action: ButtonBackScreen(),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'CHAT',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(bloc.userRecipient!.username!)
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final message = bloc.messages[index];
                  return message.senderId == bloc.user!.username 
                      ? MessageSend(
                          message: message,
                        )
                      : MessageReceived(
                          message: message,
                        );
                },
                itemCount: bloc.messages.length,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minHeight: 40, maxHeight: 80),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black,
                      )),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Escribe aquí...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 10)),
                        cursorColor: Colors.grey,
                        maxLines: 3,
                        minLines: 1,
                        controller: bloc.message,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    bloc.sendMessage();
                  },
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.send_rounded,
                      size: 30,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
