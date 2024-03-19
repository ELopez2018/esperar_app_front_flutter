import 'dart:convert';

import 'package:esperar_app_front_flutter/data/models/news/news_model.dart';
import 'package:esperar_app_front_flutter/data/models/news/news_request_model.dart';
import 'package:esperar_app_front_flutter/data/services/news_service.dart';
import 'package:esperar_app_front_flutter/data/services/socket_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class CreateNewsProvider extends ChangeNotifier {
  final NewsService newsService;
  final SocketService socketService;
  final LocalStorageInterface localStorageInterface;

  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();

  CreateNewsProvider({
    required this.newsService,
    required this.localStorageInterface,
    required this.socketService,
  });

  Future createNews() async {
    try {
      socketService.getStompClient().send(
        destination: '/app/createNews',
        body:
            jsonEncode(NewsRequestModel(title: title.text, content: content.text)),
        headers: {},
      );
    } on String catch (_) {
      print(_);
    }
  }
}
