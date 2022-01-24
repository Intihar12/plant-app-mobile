import 'package:flutter/material.dart';
import 'package:getdata/statemnagement/Productpage.dart';
import 'package:getdata/statemnagement/statemodals/productitems.dart';

import 'boxproduct.dart';

void main(){runApp(MyAppv());}



class MyAppv extends StatelessWidget {
  const MyAppv({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Myhomepage(),
    );
  }
}

class Myhomepage extends StatelessWidget {

   Myhomepage({Key? key, }) : super(key: key);
  final items = Product.getProducts();
  //final items = [];

  @override
  Widget build(BuildContext context) {
//final String items;
    return Scaffold(
      appBar: AppBar(title: Text('products'),),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
           child: ProductBox(item: items[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(item: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

