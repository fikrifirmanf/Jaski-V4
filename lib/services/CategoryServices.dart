import 'package:dio/dio.dart';

class CategoryServices {
  static Future fetchCategory() async {
    final String _endpoint = "https://core.jaski.id/api/v1/category";
    Dio _dio = Dio();
    var response = await _dio.get(_endpoint,
        options: Options(headers: {"Accept": "applicationjson"}));
    return response.data;
  }
}
