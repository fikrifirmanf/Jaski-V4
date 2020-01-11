import 'package:dio/dio.dart';
import 'package:jaski_v4/models/ProductDetailModel.dart';

class JaskiDB {
  Dio dio = new Dio(BaseOptions(
    baseUrl: "https://core.jaski.id/api/v1/",
    contentType: "application/json;charset=utf-8",
  ));

  Future<Response> getCategory() async {
    Response _res = await dio.get("/category");
    return _res;
  }

  Future<Response> getProduct({int limit, int filterCat}) async {
    var query = {"limit": limit, "filter_category": filterCat};
    Response _res = await dio.get("/search/product", queryParameters: query);
    return _res;
  }

  Future<ProductDetailModel> getProductDetail({String slug}) async {
    Response _res = await dio.get("product/$slug");
    return ProductDetailModel.fromJson(_res.data);
  }
}
