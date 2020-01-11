import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jaski_v4/style/Color.dart';
import 'package:jaski_v4/widget/ShimmerBannerImage.dart';

final List<String> imgList = [
  "https://instagram.fcgk23-1.fna.fbcdn.net/v/t51.2885-15/e35/65082751_399874487295772_8162240003182633222_n.jpg?_nc_ht=instagram.fcgk23-1.fna.fbcdn.net&_nc_cat=104&oh=ff0e4ca626506aaefcff099f84349153&oe=5E76BA9F",
  "https://instagram.fcgk23-1.fna.fbcdn.net/v/t51.2885-15/e35/65020475_620159865143603_3378957343698280718_n.jpg?_nc_ht=instagram.fcgk23-1.fna.fbcdn.net&_nc_cat=111&oh=e9be80cd03e57d9346c9d4d2af61c616&oe=5E841F4A",
  "https://piktochart.com/wp-content/uploads/2018/04/Visual-blogpost-1000x800-4.jpg",
];

final List child = map<Widget>(
  imgList,
  (index, i) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: CachedNetworkImage(
          imageUrl: i,
          placeholder: (context, url) => ShimmerBannerImage(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
          width: 1000),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselBannerJaski extends StatefulWidget {
  CarouselBannerJaski({Key key}) : super(key: key);

  @override
  _CarouselBannerJaskiState createState() => _CarouselBannerJaskiState();
}

class _CarouselBannerJaskiState extends State<CarouselBannerJaski> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(color: Colors.blue[60]),
      child: Column(
        children: <Widget>[
          CarouselSlider(
              items: child,
              height: 120,
              viewportFraction: 1.0,
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 8),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              //pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                  children: map<Widget>(
                imgList,
                (index, url) {
                  return Container(
                      width: 10.0,
                      height: 4.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 1.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color:
                            _current == index ? primaryColor : Colors.grey[400],
                      ));
                },
              )),
              Text(
                "Lihat Semua",
                style: TextStyle(fontSize: 11.0, color: primaryColor),
              )
            ],
          ),
        ],
      ),
    );
  }
}
