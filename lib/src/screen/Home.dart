import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaski_v4/src/screen/Favorite.dart';
import 'package:jaski_v4/src/screen/MyOrders.dart';
import 'package:jaski_v4/style/Color.dart';
import 'package:jaski_v4/widget/BannerPromoJaski.dart';
import 'package:jaski_v4/widget/BeritaJaskiWidget.dart';
import 'package:jaski_v4/widget/CarouselBannerJaski.dart';
import 'package:jaski_v4/widget/JaskiPromoList.dart';
import 'package:jaski_v4/widget/MenuJasPay.dart';
import 'package:jaski_v4/widget/MenuJaski.dart';
import 'package:jaski_v4/widget/MenuJaskiv2.dart';
import 'package:jaski_v4/widget/NotifikasiPromoSekitar.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTabIndex = 0;

  List<Widget> tabs = [
    FavoritePage(),
    MyOrders(),
    null
    // ShimmerMenuJaski()
  ];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding:
                EdgeInsetsDirectional.only(start: 0.0, bottom: 8.0, top: 8.0),
            title: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 245.0,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.search, color: Colors.grey[400]),
                        SizedBox(
                          width: 8.0,
                        ),
                        new Text("butuh jasa ? mudah tanpa tapi",
                            style: new TextStyle(
                                color: Colors.grey[400], fontSize: 12.0)),
                      ],
                    ),
                    decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(5)),
                        color: Colors.grey[200]),
                    padding: new EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Badge(
                        position: BadgePosition.topLeft(top: -12, left: -5),
                        animationType: BadgeAnimationType.scale,
                        shape: BadgeShape.circle,
                        badgeColor: Colors.red,
                        child: Icon(
                          FontAwesomeIcons.tags,
                          color: primaryColor,
                        ),
                        badgeContent: Text(
                          "6",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Badge(
                        position: BadgePosition.topLeft(top: -12, left: 7),
                        animationType: BadgeAnimationType.scale,
                        shape: BadgeShape.circle,
                        badgeColor: Colors.red,
                        child: Icon(
                          Icons.notifications_active,
                          color: primaryColor,
                        ),
                        badgeContent: Text(
                          "2",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          elevation: 0,
          // actions: <Widget>[
          //   Icon(
          //     FontAwesomeIcons.heart,
          //     color: primaryColor,
          //   ),
          //   Icon(
          //     FontAwesomeIcons.bell,
          //     color: primaryColor,
          //   )
          // ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            top: false,
            child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        CarouselBannerJaski(),
                        SizedBox(
                          height: 16.0,
                        ),
                        MenuJasPay(),
                        SizedBox(
                          height: 16.0,
                        ),

                        NotifikasiPromoSekitar(),
                        SizedBox(
                          height: 16.0,
                        ),
                        MenuJaskiv2(),
                        SizedBox(
                          height: 16.0,
                        ),
                        // SizedBox(
                        //   height: 32.0,
                        // ),
                        BannerPromoJaski(),
                      ],
                    )),
                SizedBox(
                  height: 8,
                ),
                JaskiPromoList(),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ));
  }
}
