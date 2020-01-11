import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuJasPay extends StatelessWidget {
  const MenuJasPay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.qrcode,
                    color: Colors.grey[400],
                    size: 35,
                  ),
                  Text(
                    "Scan",
                    style: TextStyle(color: Colors.grey[400], fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Container(
              width: 1,
              height: 50,
              color: Colors.grey[400],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Jas-PAY",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Color(0XFF126e83),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Rp. ",
                          style:
                              TextStyle(fontSize: 8.0, color: Colors.grey[400]),
                        ),
                        Text(
                          "1.000.999",
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.moneyBillWave,
                    color: Colors.grey[400],
                    size: 35,
                  ),
                  Text(
                    "Bayar",
                    style: TextStyle(color: Colors.grey[400], fontSize: 12.0),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.phone_android,
                    color: Colors.grey[400],
                    size: 35,
                  ),
                  Text(
                    "Top Up",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Icon(FontAwesomeIcons.gifts,
                      color: Colors.grey[400], size: 35),
                  Text(
                    "Rewards",
                    style: TextStyle(color: Colors.grey[400], fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
