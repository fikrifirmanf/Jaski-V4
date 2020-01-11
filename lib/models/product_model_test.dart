// To parse this JSON data, do
//
//     final productModelTest = productModelTestFromJson(jsonString);

import 'dart:convert';

ProductModelTest productModelTestFromJson(String str) =>
    ProductModelTest.fromJson(json.decode(str));

String productModelTestToJson(ProductModelTest data) =>
    json.encode(data.toJson());

class ProductModelTest {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  String perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  ProductModelTest({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory ProductModelTest.fromJson(Map<String, dynamic> json) =>
      ProductModelTest(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  int id;
  int storeId;
  String slug;
  String name;
  String price;
  String salePrice;
  int percentDiscount;
  String nominalDiscount;
  int rating;
  int reviewCount;
  ImageProduct image;
  DatumCategory category;
  Store store;

  Datum({
    this.id,
    this.storeId,
    this.slug,
    this.name,
    this.price,
    this.salePrice,
    this.percentDiscount,
    this.nominalDiscount,
    this.rating,
    this.reviewCount,
    this.image,
    this.category,
    this.store,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        storeId: json["store_id"],
        slug: json["slug"],
        name: json["name"],
        price: json["price"],
        salePrice: json["sale_price"],
        percentDiscount: json["percent_discount"],
        nominalDiscount: json["nominal_discount"],
        rating: json["rating"],
        reviewCount: json["review_count"],
        image: ImageProduct.fromJson(json["image"]),
        category: DatumCategory.fromJson(json["category"]),
        store: Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "slug": slug,
        "name": name,
        "price": price,
        "sale_price": salePrice,
        "percent_discount": percentDiscount,
        "nominal_discount": nominalDiscount,
        "rating": rating,
        "review_count": reviewCount,
        "image": image.toJson(),
        "category": category.toJson(),
        "store": store.toJson(),
      };
}

class DatumCategory {
  int id;
  int productId;
  int categoryId;
  CategoryCategory category;

  DatumCategory({
    this.id,
    this.productId,
    this.categoryId,
    this.category,
  });

  factory DatumCategory.fromJson(Map<String, dynamic> json) => DatumCategory(
        id: json["id"],
        productId: json["product_id"],
        categoryId: json["category_id"],
        category: CategoryCategory.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "category_id": categoryId,
        "category": category.toJson(),
      };
}

class CategoryCategory {
  int id;
  String slug;
  String name;

  CategoryCategory({
    this.id,
    this.slug,
    this.name,
  });

  factory CategoryCategory.fromJson(Map<String, dynamic> json) =>
      CategoryCategory(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
      };
}

class ImageProduct {
  int id;
  int storeId;
  int userId;
  int productId;
  String thumbnail;
  String original;
  int isMain;

  ImageProduct({
    this.id,
    this.storeId,
    this.userId,
    this.productId,
    this.thumbnail,
    this.original,
    this.isMain,
  });

  factory ImageProduct.fromJson(Map<String, dynamic> json) => ImageProduct(
        id: json["id"],
        storeId: json["store_id"],
        userId: json["user_id"],
        productId: json["product_id"],
        thumbnail: json["thumbnail"],
        original: json["original"],
        isMain: json["is_main"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "user_id": userId,
        "product_id": productId,
        "thumbnail": thumbnail,
        "original": original,
        "is_main": isMain,
      };
}

class Store {
  String slug;
  String name;
  String logo;
  int id;
  int isOfficial;
  dynamic districtId;
  dynamic regencyId;
  dynamic provinceId;
  int countryId;
  int rating;
  Country country;
  dynamic province;
  dynamic regency;
  dynamic district;

  Store({
    this.slug,
    this.name,
    this.logo,
    this.id,
    this.isOfficial,
    this.districtId,
    this.regencyId,
    this.provinceId,
    this.countryId,
    this.rating,
    this.country,
    this.province,
    this.regency,
    this.district,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        slug: json["slug"],
        name: json["name"],
        logo: json["logo"],
        id: json["id"],
        isOfficial: json["is_official"],
        districtId: json["district_id"],
        regencyId: json["regency_id"],
        provinceId: json["province_id"],
        countryId: json["country_id"],
        rating: json["rating"],
        country: Country.fromJson(json["country"]),
        province: json["province"],
        regency: json["regency"],
        district: json["district"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "logo": logo,
        "id": id,
        "is_official": isOfficial,
        "district_id": districtId,
        "regency_id": regencyId,
        "province_id": provinceId,
        "country_id": countryId,
        "rating": rating,
        "country": country.toJson(),
        "province": province,
        "regency": regency,
        "district": district,
      };
}

class Country {
  int id;
  String code;
  String name;
  int isActive;

  Country({
    this.id,
    this.code,
    this.name,
    this.isActive,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "is_active": isActive,
      };
}
