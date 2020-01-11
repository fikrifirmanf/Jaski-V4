import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jaski_v4/providers/CategoryMenuProviders.dart';
import 'package:jaski_v4/src/screen/Product.dart';
import 'package:provider/provider.dart';

class MenuJaski extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catprov = Provider.of<CategoryMenuProviders>(context);
    if (catprov.getCategory == null) {
      catprov.getCategoryJaski();
    }
    return Consumer<CategoryMenuProviders>(
      builder: (context, catprov, child) {
        return Container(
          height: 200.0,
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: catprov.getCategory.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              var data = catprov.getCategory[index];
              return GestureDetector(
                onTap: () {
                  print(data.id);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Product(
                          title: data.name,
                          idcat: data.id.toString(),
                        ),
                      ));
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: CachedNetworkImage(
                        imageUrl: data.icon,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.name,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
