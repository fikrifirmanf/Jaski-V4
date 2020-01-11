import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final List<Widget> load = [
    Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey[100],
        child: Container(
          color: Colors.grey,
        )),
    Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey[100],
        child: Container(
          color: Colors.grey,
        )),
    Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey[100],
        child: Container(
          color: Colors.grey,
        )),
    Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey[100],
        child: Container(
          color: Colors.grey,
        )),
    Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey[100],
        child: Container(
          color: Colors.grey,
        ))
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: width,
      child: IgnorePointer(
        child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            primary: true,
            childAspectRatio: 0.65,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: load),
      ),
    );
  }
}
