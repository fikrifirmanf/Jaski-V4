import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMenuJaski extends StatelessWidget {
  const ShimmerMenuJaski({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GridView.builder(
        // padding: EdgeInsets.symmetric(
        //   vertical: 8.0,
        //   horizontal: 8.0,
        // ),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 8,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index) {
          return Container(
              color: Colors.red,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                  ),
                ),
              ));
        },
      ),
    );
  }
}
