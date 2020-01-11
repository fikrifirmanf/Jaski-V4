import 'package:jaski_v4/models/product_model_test.dart';
import 'package:jaski_v4/services/ProductServices.dart';

class ProductRepository {
  ProductServices _productServices = ProductServices();
  Future<ProductModelTest> fetchProductByCategory(String limit, String cat) =>
      _productServices.fetchProductByCategory(limit, cat);
}
