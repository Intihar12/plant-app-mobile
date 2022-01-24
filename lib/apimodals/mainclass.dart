import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getdata/apimodals/productboxlist.dart';
import 'package:http/http.dart' as http;
import 'Apicalls/products.dart';
void main(){runApp(MyAppapi(products: fetchProducts()));}


List<product> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<product>((json) => product.fromMap(json)).toList();
}
Future<List<product>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://calltotracksample.usstokyo.com/products.json'));
  if (response.statusCode == 200) {
    print(response.body);
    return parseProducts(response.body);

  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class MyAppapi extends StatelessWidget {
  final Future<List<product>> products;

  MyAppapi({Key? key, required this.products}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product Navigation demo home page',  products:products,),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final String title;
  final Future<List<product>> products;
  MyHomePage({Key? key, required this.title,required this.products}) : super(key: key);

  // final items = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Navigation")),
        body: Center(
          child: FutureBuilder<List<product>>(
            future: products, builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }

            if (snapshot.hasData) {
              return ProductBoxList(items: snapshot.data!);
            }

            // return the ListView widget
            return Center(child: CircularProgressIndicator());
          }
          ),
        )
    );
  }
}