import 'package:esperar_app_front_flutter/data/models/news/news_model.dart';
import 'package:esperar_app_front_flutter/data/models/news/news_request_model.dart';
import 'package:esperar_app_front_flutter/data/services/news_service.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';
import 'package:flutter/material.dart';

class CreateNewsProvider extends ChangeNotifier {
  final NewsService newsService;
  final LocalStorageInterface localStorageInterface;

  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();

  CreateNewsProvider(
      {required this.newsService, required this.localStorageInterface});

  Future<NewsModel?> createNews() async {
    final String? accessToken = await localStorageInterface.getAccessToken();
    try {
      final response = await newsService.createNews(accessToken!,
          NewsRequestModel(title: title.text, content: content.text));
      if (response != null) {
        return response;
      }
    } on String catch (_) {}
  }
}
