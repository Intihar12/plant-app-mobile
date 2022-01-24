import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:getdata/Appsvg/constant.dart';
import 'package:getdata/Appsvg/sereens/home/components/recomend_plants.dart';

import 'featurred_plants.dart';
import 'header_with_searchbox.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // it will prove us total height and width of over screen
    Size size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recomended", pressed: (){},),

          RecompondPlants(),
          TitleWithMoreBtn(title:" Feature plants", pressed:(){}),
          futureplant(),
          SizedBox(height: kDefaultPadding,)
        ],
      ),
    );
  }
}

