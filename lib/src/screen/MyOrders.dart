import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Center(
          child: Text("My Orders Page"),
        ),
      ),
    );
  }
}
