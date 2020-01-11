import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaski_v4/style/Color.dart';

class JaskiPromoList extends StatelessWidget {
  const JaskiPromoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Text(
                "Jaski Promo dan Hemat",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold),
              )),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CardPromo(),
                CardPromo(),
                CardPromo(),
                CardPromo()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardPromo extends StatelessWidget {
  const CardPromo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 8,
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 8,
                  ),
                  //color: Colors.blue,
                  height: 200,
                  width: 180,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[200]),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: Container(
                            width: 180,
                            height: 110,
                            child: Image.asset("assets/img/1.jpg",
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Foto Wedding Outdoordksjdhskjdhskdhskdjhsdkshdkshdksjdhskjdh",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.tags,
                                color: Colors.orange,
                                size: 11,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                  child: Text(
                                "Diskondsdsdsdsd",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 10),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 15,
                    left: 5,
                    child: Container(
                      color: primaryColor,
                      width: 45,
                      height: 15,
                      child: Center(
                          child: Text(
                        "Promo",
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      )),
                    )),
                Positioned(
                    bottom: 95,
                    right: 13,
                    child: Container(
                      color: Colors.white,
                      width: 50,
                      height: 15,
                      child: Center(
                        child: Text(
                          "Property",
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
