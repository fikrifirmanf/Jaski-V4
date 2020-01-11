import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:jaski_v4/models/ProductModel.dart';
import 'package:jaski_v4/models/product_model_test.dart';

class ProductServices {
  Future<ProductModelTest> fetchProductByCategory(
      String limit, String cat) async {
    final String _endPoint =
        "https://core.jaski.id/api/v1/search/product?limit=$limit&filter_category=$cat";
    Dio _dio = Dio();
    var response = await _dio.get(_endPoint,
        options: Options(headers: {"accept": "application/json"}));
    final responseString = jsonDecode(response.data);
    if (response.statusCode == 200) {
      return productModelTestFromJson(responseString);
    } else {
      throw Exception("Error");
    }
  }
}
