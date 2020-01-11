import 'package:flutter/material.dart';

class BeritaJaskiWidget extends StatelessWidget {
  const BeritaJaskiWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Berita Jaski",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Lihat Lainnya",
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              )
            ],
          ),
          Container(
            child: IgnorePointer(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                primary: true,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
