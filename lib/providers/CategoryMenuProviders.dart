import 'package:flutter/foundation.dart';
import 'package:jaski_v4/models/CategoryModel.dart';
import 'package:jaski_v4/services/CategoryServices.dart';

class CategoryMenuProviders with ChangeNotifier {
  List<CategoryModel> categoryModel;
  List<CategoryModel> get getCategory => categoryModel;
  bool isFetching;
  bool loading = false;

  Future<void> getCategoryJaski() async {
    // setLoading(true);
    if (categoryModel == null) {
      categoryModel = new List<CategoryModel>();
    }
    var data = await CategoryServices.fetchCategory();
    if (data != null) {
      print("Category Menu OK!");
      for (int i = 0; i < data.length; i++) {
        categoryModel.add(CategoryModel.fromJson(data[i]));
      }
    }
    setFetching(false);
  }

  bool isLoading() {
    return loading;
  }

  // void setLoading(value) {
  //   loading = value;
  //   notifyListeners();
  // }

  setFetching(bool value) {
    isFetching = value;
    notifyListeners();
  }

  bool getFetching() {
    return isFetching;
  }
}
