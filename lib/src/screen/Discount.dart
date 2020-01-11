import 'package:flutter/material.dart';

class Discount extends StatelessWidget {
  const Discount({Key key}) : super(key: key);

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
