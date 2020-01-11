import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaski_v4/src/screen/Favorite.dart';
import 'package:jaski_v4/src/screen/Home.dart';
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

class TabBarJaski extends StatefulWidget {
  TabBarJaski({Key key}) : super(key: key);

  @override
  _TabBarJaskiState createState() => _TabBarJaskiState();
}

class _TabBarJaskiState extends State<TabBarJaski> {
  int currentTabIndex = 0;

  List<Widget> tabs = [
    Home(),
    FavoritePage(),
    MyOrders(),
    Discount();
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
        backgroundColor: Colors.white,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: primaryColor,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.yellow,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: new TextStyle(
                      color: Colors
                          .white))), // sets the inactive color of the `BottomNavigationBar`
          child: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentTabIndex,
            onTap: onTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text("Favorite"),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.shoppingBasket),
                title: Text("My Order"),
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.tags),
                title: Text("Discount"),
              )
            ],
          ),
        ),
        body: tabs[currentTabIndex]);
  }
}
