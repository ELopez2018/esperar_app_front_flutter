import 'package:esperar_app_front_flutter/data/models/news/news_model.dart';
import 'package:esperar_app_front_flutter/data/models/news/news_response_model.dart';
import 'package:esperar_app_front_flutter/data/models/users/user_model.dart';
import 'package:esperar_app_front_flutter/data/services/news_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier{

  NewsProvider({
    required this.newsService,
    required this.localStorageInterface,
  });

  final NewsService newsService;
  final LocalStorageInterface localStorageInterface;
  NewsResponseModel? pageableNews;
   List<NewsModel?>? news;
   UserModel? user;

  Future init() async {
    final String? accessToken = await localStorageInterface.getAccessToken();
    user = await localStorageInterface.getUser();
    try {
      final response = await newsService.findAllNews(accessToken!);
      if (response != null) {
        pageableNews = response;
        news = response.content.isNotEmpty ? response.content : [];
      }else{
        news = [];
      }
      notifyListeners();
    } on String catch (_) {
      print(_);
    }
  }

  void addNews(NewsModel route){
    news!.add(route);
    notifyListeners();
  }
}
