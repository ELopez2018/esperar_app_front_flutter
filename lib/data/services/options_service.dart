import 'package:dio/dio.dart';

class OptionServices {
  late final Dio _dio =
      Dio(BaseOptions(baseUrl: 'https://www.universal-tutorial.com'));

  Future getToken() async {
    try {
      final response = await _dio.get(
        '/api/getaccesstoken',
        options: Options(
          headers: {
            "Accept": "application/json",
            "api-token": "b8VLSuxiVuJgaRDLmikvoWISPzYaSrI86rM0HLmpxl3jglUYbsgkvllrQF7KQ3MghQ4",
            "user-email": "bclavijogomez99f@gmail.com"
          },
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  Future getCountries() async {
    final token = await getToken();
    try {
      final response = await _dio.get(
        '/countries/',
        options: Options(
          headers: {
            "Authorization":
                "Bearer $token",
            "Accept": "application/json"
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

  getStates(String country) async {
     final token = await getToken();
    try {
      final response = await _dio.get(
        '/states/$country',
        options: Options(
          headers: {
            "Authorization":
                "Bearer $token",
            "Accept": "application/json"
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response);
      }
    } on DioException catch (_) {
      print(_);
    }
  }

    getCities(String state) async {
     final token = await getToken();
    try {
      final response = await _dio.get(
        '/cities/$state',
        options: Options(
          headers: {
            "Authorization":
                "Bearer $token",
            "Accept": "application/json"
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response);
      }
    } on DioException catch (_) {
      print(_);
    }
  }
}
