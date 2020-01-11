import 'package:flutter/material.dart';

class NotifikasiPromoSekitar extends StatelessWidget {
  const NotifikasiPromoSekitar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 8.0,
          ),
          Icon(
            Icons.place,
            size: 30.0,
            color: Colors.red,
          ),
          SizedBox(
            width: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Dapatkan kesempatan promo di sekitarmu!",
                style: TextStyle(
                    letterSpacing: 0.5,
                    color: Colors.grey[600],
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Mulai dengan aktifkan lokasi.",
                    style: TextStyle(fontSize: 11.0, color: Colors.grey[600]),
                  ),
                  Text(" Cek Sekarang",
                      style: TextStyle(fontSize: 11.0, color: Colors.blue[800]))
                ],
              )
            ],
          ),
          SizedBox(
            width: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.clear,
                  color: Colors.grey,
                  size: 12.0,
                )),
          )
        ],
      ),
    );
  }
}
