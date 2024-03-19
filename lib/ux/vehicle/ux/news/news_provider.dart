import 'dart:convert';

import 'package:esperar_app_front_flutter/data/models/news/news_model.dart';
import 'package:esperar_app_front_flutter/data/models/news/news_response_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/services/news_service.dart';
import 'package:esperar_app_front_flutter/data/services/socket_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class NewsProvider extends ChangeNotifier {
  NewsProvider({
    required this.newsService,
    required this.localStorageInterface,
    required this.socketService,
  });

  final NewsService newsService;
  final LocalStorageInterface localStorageInterface;
  NewsResponseModel? pageableNews;
  List<NewsModel?>? news;
  UserModel? user;
  final SocketService socketService;

  Future init() async {
    user = await localStorageInterface.getUser();
    try {
      final response = await newsService.findAllNews();
      if (response != null) {
        pageableNews = response;
        news = response.content.isNotEmpty ? response.content : [];
      } else {
        news = [];
      }
      notifyListeners();
    } on String catch (_) {
      print(_);
    }

    socketService.getStompClient().subscribe(
        destination: '/topic/news',
        callback: (StompFrame stompFrame) {
          final newsJson = jsonDecode(stompFrame.body!);
          if (!news!.any((element) => element!.id == newsJson['id'])) {
            news!.add(NewsModel.fromJson(newsJson));
            notifyListeners();
          }
        });
  }

  void addNews(NewsModel route) {
    news!.add(route);
    notifyListeners();
  }
}
