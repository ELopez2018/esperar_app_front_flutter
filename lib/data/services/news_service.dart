import 'package:dio/dio.dart';
import 'package:esperar_app_front_flutter/config/host.dart';
import 'package:esperar_app_front_flutter/data/models/news/news_model.dart';
import 'package:esperar_app_front_flutter/data/models/news/news_request_model.dart';
import 'package:esperar_app_front_flutter/data/models/news/news_response_model.dart';

class NewsService{
    late final Dio _dio = Dio(BaseOptions(baseUrl: apiHost));


  Future<NewsModel?> createNews(String accessToken, NewsRequestModel news) async {
    try {
      final response = await _dio.post('/notices',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
        }
      ),
       data: news.toJson());
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        return NewsModel.fromJson(data);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future<NewsResponseModel?> findAllNews(String accessToken) async {
    try {
      final response = await _dio.get('/notices',
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          }));
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