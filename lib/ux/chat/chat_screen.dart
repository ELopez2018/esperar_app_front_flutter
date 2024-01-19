import 'package:esperar_app_front_flutter/ux/chat/widgets/message_sent.dart';
import 'package:esperar_app_front_flutter/ux/chat/widgets/message_received.dart';
import 'package:esperar_app_front_flutter/ux/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarCustom(
          action: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HOLA',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'JUANITO',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'CHAT',
                style:  TextStyle(fontWeight: FontWeight.w500),
              ),
              Text('empresa')
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return index % 2 == 0 ? const MessageReceived() : const MessageSend();
            },
            itemCount: 10,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 40, maxHeight: 80),
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
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.send_rounded,
                size: 30,
              ),
            )
          ],
        )
      ],
    );
  }
}
