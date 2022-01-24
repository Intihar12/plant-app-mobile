import 'package:flutter/material.dart';
import 'package:getdata/Appsvg/sereens/home/hoom_screen.dart';

import 'constant.dart';
//import 'package:plant_app/constants.dart';
//import 'package:plant_app/screens/home/home_screen.dart';

void main() {
  runApp(MyAppa());
}

class MyAppa extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        backgroundColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}