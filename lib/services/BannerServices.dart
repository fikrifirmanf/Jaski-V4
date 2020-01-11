import 'package:dio/dio.dart';

class BannerServices {
  static Future fetchBanner() async {
    final String _endpoint = "https://core.jaski.id/api/v1/banner";
    Dio _dio = Dio();
    var response = await _dio.get(_endpoint,
        options: Options(headers: {"Accept": "application/json"}));
    return response.data;
  }
}
