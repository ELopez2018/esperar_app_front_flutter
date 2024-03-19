import 'package:esperar_app_front_flutter/data/models/chat/chat_model.dart';
import 'package:flutter/material.dart';

class MessageSend extends StatelessWidget {
  const MessageSend({
    super.key, required this.message,
  });

  final ChatModel message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                //  Text(message.),
                  const SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Text(
                        message.content,
                      ))
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
