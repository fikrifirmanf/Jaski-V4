import 'package:flutter/material.dart';

class MenuJaskiv2 extends StatelessWidget {
  const MenuJaskiv2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  DataMenu(
                      imageUrl: "assets/img/ic_Jas-Event.png",
                      titleMenu: "Jas-Event"),
                  SizedBox(
                    width: 24,
                  ),
                  DataMenu(
                      imageUrl: "assets/img/ic_Jas-Learn.png",
                      titleMenu: "Jas-Learn"),
                  SizedBox(
                    width: 24,
                  ),
                  DataMenu(
                      imageUrl: "assets/img/ic_Jas-Property.png",
                      titleMenu: "Jas-Property"),
                  SizedBox(
                    width: 24,
                  ),
                  DataMenu(
                      imageUrl: "assets/img/ic_Jas-Clean.png",
                      titleMenu: "Jas-Clean"),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey[400],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class DataMenu extends StatelessWidget {
  final String imageUrl, titleMenu;
  DataMenu({this.imageUrl, this.titleMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: Image.asset(imageUrl, fit: BoxFit.fill),
          ),
          SizedBox(
            height: 4,
          ),
          Flexible(
            child: Text(
              titleMenu,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          )
        ],
      ),
    );
  }
}
