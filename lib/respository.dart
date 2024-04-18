import 'package:dio/dio.dart';

class HomeRepository {
  static Future<String> fetchRandomApi() async {
    try {
      final Response response = await Dio(BaseOptions())
          .get('https://official-joke-api.appspot.com/random_joke');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["setup"];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
