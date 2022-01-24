import 'package:flutter/material.dart';
import 'package:getdata/apimodals/Productbox.dart';
import 'package:getdata/apimodals/productpage.dart';

//import '../boxproduct.dart';
import 'Apicalls/products.dart';

import '../statemnagement/Productpage.dart';
class ProductBoxList extends StatelessWidget {
  final List<product> items;
  ProductBoxList({Key? key,required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: productBox(item: items[index]),
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => productPage(item: items[index]),
            ),
            );
          },
        );
      },
    );
  }
}