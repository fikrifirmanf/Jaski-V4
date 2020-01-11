import 'package:dio/dio.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indonesia/indonesia.dart';
import 'package:jaski_v4/models/ProductDetailModel.dart';
import 'package:jaski_v4/services/api.dart';
import 'package:jaski_v4/style/Color.dart';

class ProductDetail extends StatefulWidget {
  final String slug;
  ProductDetail({this.slug});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      appBar: AppBar(
//        backgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 0, color: Colors.grey)]),
        child: Container(
          height: 40,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200]),
                  child: Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.black45,
                  )),
              Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200]),
                  child: Icon(
                    FontAwesomeIcons.cartPlus,
                    color: Colors.black45,
                  )),
              Container(
                  height: 50,
                  width: width / 2,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: primaryColor,
                    child: Text(
                      "Booking Sekarang",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ))
            ],
          ),
        ),
      ),
      body: FutureBuilder<ProductDetailModel>(
        future: JaskiDB().getProductDetail(slug: widget.slug),
        builder: (BuildContext context, snap) {
          switch (snap.connectionState) {
            case ConnectionState.done:
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: height / 2,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snap.data.images.length,
                          itemBuilder: (context, int i) {
                            return Container(
                              height: height / 2,
                              width: width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          snap.data.images[i].original),
                                      fit: BoxFit.cover)),
                            );
                          },
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 16.0,
                          ),
                          width: width,
                          color: Colors.white,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  snap.data.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(rupiah(snap.data.price),
                                    style: TextStyle(
                                        fontSize: 16.0, color: primaryColor))
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 14.0,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          width: width,
                          color: Colors.white,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Informasi Produk",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                ExpandablePanel(
                                  collapsed: Text(
                                    snap.data.description,
                                    softWrap: true,
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  expanded: Text(
                                    snap.data.description,
                                    softWrap: true,
                                  ),
                                  tapBodyToCollapse: true,
                                  hasIcon: true,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 14.0,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          width: width,
                          color: Colors.white,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Toko",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: <Widget>[
                                    new Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: new BoxDecoration(
                                        color: primaryColor,
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              snap.data.store.logo),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          snap.data.store.name,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(snap.data.store.address.street)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              );

              break;

            default:
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: primaryColor,
              ));
          }
        },
      ),
    );
  }
}
