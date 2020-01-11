// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

class ProductDetailModel {
  int id;
  int userId;
  int storeId;
  String slug;
  String name;
  String description;
  String price;
  int percentDiscount;
  String nominalDiscount;
  String salePrice;
  int dailyStock;
  int isActive;
  int rating;
  int reviewCount;
  List<Image> images;
  Store store;
  Category category;

  ProductDetailModel({
    this.id,
    this.userId,
    this.storeId,
    this.slug,
    this.name,
    this.description,
    this.price,
    this.percentDiscount,
    this.nominalDiscount,
    this.salePrice,
    this.dailyStock,
    this.isActive,
    this.rating,
    this.reviewCount,
    this.images,
    this.store,
    this.category,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json["id"],
        userId: json["user_id"],
        storeId: json["store_id"],
        slug: json["slug"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        percentDiscount: json["percent_discount"],
        nominalDiscount: json["nominal_discount"],
        salePrice: json["sale_price"],
        dailyStock: json["daily_stock"],
        isActive: json["is_active"],
        rating: json["rating"],
        reviewCount: json["review_count"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        store: Store.fromJson(json["store"]),
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "store_id": storeId,
        "slug": slug,
        "name": name,
        "description": description,
        "price": price,
        "percent_discount": percentDiscount,
        "nominal_discount": nominalDiscount,
        "sale_price": salePrice,
        "daily_stock": dailyStock,
        "is_active": isActive,
        "rating": rating,
        "review_count": reviewCount,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "store": store.toJson(),
        "category": category.toJson(),
      };
}

class Category {
  int id;
  int productId;
  int categoryId;

  Category({
    this.id,
    this.productId,
    this.categoryId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        productId: json["product_id"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "category_id": categoryId,
      };
}

class Image {
  int id;
  int storeId;
  int userId;
  int productId;
  String thumbnail;
  String original;
  int isMain;

  Image({
    this.id,
    this.storeId,
    this.userId,
    this.productId,
    this.thumbnail,
    this.original,
    this.isMain,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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
  int rating;
  Address address;

  Store({
    this.slug,
    this.name,
    this.logo,
    this.id,
    this.rating,
    this.address,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        slug: json["slug"],
        name: json["name"],
        logo: json["logo"],
        id: json["id"],
        rating: json["rating"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "logo": logo,
        "id": id,
        "rating": rating,
        "address": address.toJson(),
      };
}

class Address {
  int id;
  int storeId;
  int userId;
  String street;
  String zipCode;
  String districtId;
  String regencyId;
  String provinceId;
  int countryId;
  District province;
  District regency;
  District district;

  Address({
    this.id,
    this.storeId,
    this.userId,
    this.street,
    this.zipCode,
    this.districtId,
    this.regencyId,
    this.provinceId,
    this.countryId,
    this.province,
    this.regency,
    this.district,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        storeId: json["store_id"],
        userId: json["user_id"],
        street: json["street"],
        zipCode: json["zip_code"],
        districtId: json["district_id"],
        regencyId: json["regency_id"],
        provinceId: json["province_id"],
        countryId: json["country_id"],
        province: District.fromJson(json["province"]),
        regency: District.fromJson(json["regency"]),
        district: District.fromJson(json["district"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "user_id": userId,
        "street": street,
        "zip_code": zipCode,
        "district_id": districtId,
        "regency_id": regencyId,
        "province_id": provinceId,
        "country_id": countryId,
        "province": province.toJson(),
        "regency": regency.toJson(),
        "district": district.toJson(),
      };
}

class District {
  int id;
  int regencyId;
  String name;
  int isActive;
  int countryId;
  int provinceId;

  District({
    this.id,
    this.regencyId,
    this.name,
    this.isActive,
    this.countryId,
    this.provinceId,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        regencyId: json["regency_id"] == null ? null : json["regency_id"],
        name: json["name"],
        isActive: json["is_active"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        provinceId: json["province_id"] == null ? null : json["province_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regency_id": regencyId == null ? null : regencyId,
        "name": name,
        "is_active": isActive,
        "country_id": countryId == null ? null : countryId,
        "province_id": provinceId == null ? null : provinceId,
      };
}
