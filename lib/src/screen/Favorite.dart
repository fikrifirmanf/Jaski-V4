import 'package:flutter/material.dart';
import 'package:jaski_v4/providers/BannerCarousselProvider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Center(
          child: Text("Favorite Page"),
        ),
      ),
    );
  }
}
