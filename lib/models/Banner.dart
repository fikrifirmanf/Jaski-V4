// To parse this JSON data, do
//
//     final bannerJaski = bannerJaskiFromJson(jsonString);

import 'dart:convert';

List<BannerJaski> bannerJaskiFromJson(String str) => List<BannerJaski>.from(
    json.decode(str).map((x) => BannerJaski.fromJson(x)));

String bannerJaskiToJson(List<BannerJaski> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerJaski {
  int id;
  String slug;
  String name;
  dynamic url;
  String image;
  int isActive;

  BannerJaski({
    this.id,
    this.slug,
    this.name,
    this.url,
    this.image,
    this.isActive,
  });

  factory BannerJaski.fromJson(Map<String, dynamic> json) => BannerJaski(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        url: json["url"],
        image: json["image"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "url": url,
        "image": image,
        "is_active": isActive,
      };
}
