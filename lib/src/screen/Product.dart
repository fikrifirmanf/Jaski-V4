import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:indonesia/indonesia.dart';
import 'package:jaski_v4/models/ProductModel.dart';
import 'package:jaski_v4/services/api.dart';
import 'package:jaski_v4/src/screen/ProductDetail.dart';
import 'package:jaski_v4/style/Color.dart';
import 'package:jaski_v4/widget/BannerPromoJaski.dart';
import 'package:jaski_v4/widget/ShimmerLoading.dart';

class Product extends StatelessWidget {
  final String title, idcat;
  Product({this.title, this.idcat});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size(null, 100),
        child: Container(
          // decoration: BoxDecoration(boxShadow: [
          //   BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
          // ]),
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: ClipRRect(
            // borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(15),
            //     bottomRight: Radius.circular(15)),
            child: Container(
              color: primaryColor,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 16, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                      color: Colors.transparent,
                    ),
                    Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(child: BannerPromoJaski()),
            ),
            SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                sliver: FutureBuilder(
                  future: JaskiDB().getProduct(
                    limit: 8,
                    filterCat: int.parse(idcat),
                  ),
                  builder:
                      (BuildContext context, AsyncSnapshot<Response> snap) {
                    switch (snap.connectionState) {
                      case ConnectionState.done:
                        List<Datum> _prod =
                            ProductModel.fromJson(snap.data.data).data;
                        return SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                print(_prod[index].percentDiscount);
                                double persenDiskon =
                                    (int.parse(_prod[index].nominalDiscount) /
                                            int.parse(_prod[index].price)) *
                                        100;
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductDetail(
                                                slug: _prod[index].slug)));
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    elevation: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              height: 200.0,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(5),
                                                          topRight:
                                                              Radius.circular(
                                                                  5)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          _prod[index]
                                                              .image
                                                              .original),
                                                      fit: BoxFit.cover)),
                                            ),
                                            (persenDiskon != 0)
                                                ? Positioned(
                                                    top: 0.0,
                                                    right: 0.0,
                                                    child: Container(
                                                      height: 30,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .black,
                                                                blurRadius: 0)
                                                          ],
                                                          color:
                                                              Colors.pink[700],
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          20))),
                                                      child: Center(
                                                          child: Text(
                                                        persenDiskon
                                                                .toStringAsFixed(
                                                                    0) +
                                                            "%",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                    ),
                                                  )
                                                : SizedBox.shrink()
                                          ],
                                        ),
                                        Flexible(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 8.0,
                                              horizontal: 8.0,
                                            ),
                                            child: Text(
                                              _prod[index].name,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 12.0),
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: (_prod[index]
                                                        .nominalDiscount
                                                        .toString() !=
                                                    "0")
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        rupiah(
                                                            _prod[index].price),
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            fontSize: 11.0,
                                                            color: Colors
                                                                .grey[400]),
                                                      ),
                                                      SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        rupiah(_prod[index]
                                                            .nominalDiscount
                                                            .toString()),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12.0),
                                                      ),
                                                    ],
                                                  )
                                                : Text(
                                                    rupiah(_prod[index].price),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12.0),
                                                  )),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              RatingBar(
                                                // initialRating: _prod[index]
                                                //     .rating
                                                //     .toDouble(),
                                                initialRating: 3.5,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 15,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0.5),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 1,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              Text(
                                                "(" +
                                                    _prod[index]
                                                        .reviewCount
                                                        .toString() +
                                                    ")",
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        SizedBox(
                                          height: 1.0,
                                          width: width,
                                          child: Container(
                                            color: Colors.grey[200],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              children: <Widget>[
                                                CircleAvatar(
                                                  radius: 10,
                                                  backgroundImage: NetworkImage(
                                                      _prod[index].store.logo),
                                                ),
                                                SizedBox(
                                                  width: 4.0,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    _prod[index].store.name,
                                                    style: TextStyle(
                                                        color: Colors.grey[400],
                                                        fontSize: 11.0),
                                                  ),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              },
                              childCount: _prod.length,
                            ));

                        break;
                      default:
                        return SliverToBoxAdapter(
                          child: Center(child: ShimmerLoading()),
                        );
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
