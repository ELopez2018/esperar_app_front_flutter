import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/core/interceptors/refresh_token.dart';
import 'package:esperar_app_front_flutter/data/models/news/news_model.dart';
import 'package:esperar_app_front_flutter/data/models/news/news_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/news/news_response_model.dart';
import 'package:esperar_app_front_flutter/domain/repository/local_storage_interface.dart';

class NewsService {
  NewsService({required this.localStorageInterface});

  final LocalStorageInterface localStorageInterface;
  late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost))
    ..interceptors.add(
      ValidateTokenInterceptor(
        localStorageInterface: localStorageInterface,
      ),
    );

  Future<NewsModel?> createNews(NewsRequestModel news) async {
    try {
      final response = await _dio.post('/notices', data: news.toJson());
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return NewsModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<NewsResponseModel?> findAllNews() async {
    try {
      final response = await _dio.get('/notices');
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return NewsResponseModel.fromJson(data);
      }
      return null;
    } on DioException catch (_) {
      print(_);
    }
  }
}
