import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jaski_v4/models/ProductModel.dart';
import 'package:jaski_v4/services/api.dart';

class TestProduct extends StatelessWidget {
  const TestProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: JaskiDB().getProduct(limit: 8, filterCat: 5),
      builder: (BuildContext context, AsyncSnapshot<Response> snap) {
        switch (snap.connectionState) {
          case ConnectionState.done:
            List<Datum> _prod = ProductModel.fromJson(snap.data.data).data;
            //Datum _img = Datum.fromJson(snap.data.data);
            return ListView.builder(
              itemCount: _prod.length,
              itemBuilder: (context, int i) {
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: _prod[i].image.original.toString(),
                    fit: BoxFit.cover,
                  ),
                  title: Text(_prod[i].name),
                );
              },
            );

            break;
          default:
            return CircularProgressIndicator();
        }
      },
    ));
  }
}
