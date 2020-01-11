import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBannerImage extends StatelessWidget {
  const ShimmerBannerImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.white,
        child: Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}
