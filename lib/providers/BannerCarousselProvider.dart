import 'package:flutter/foundation.dart';
import 'package:jaski_v4/models/Banner.dart';
import 'package:jaski_v4/services/BannerServices.dart';

class BannerCaroussel with ChangeNotifier {
  List<BannerJaski> bannerJaski;
  List<BannerJaski> get getBanner => bannerJaski;
  String errorMessage;
  bool loading = false;
  bool isFetching;
  List properties;

  Future<void> getBannerJaski() async {
    //setLoading(true);
    if (bannerJaski == null) {
      bannerJaski = new List<BannerJaski>();
    }
    var data = await BannerServices.fetchBanner();
    if (data != null) {
      print("Banner OK!");
      for (int i = 0; i < data.length; i++) {
        bannerJaski.add(BannerJaski.fromJson(data[i]));
      }
    }
    setFetching(false);
  }

  setFetching(bool value) {
    isFetching = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  bool getFetching() {
    return isFetching;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage(value) {
    return errorMessage;
  }

  // void setLoading(value) {
  //   loading = value;
  //   notifyListeners();
  // }

  // bool isBanner() {
  //   return bannerJaski != null ? true : false;
  // }
}
