import 'package:flutter/material.dart';
import 'package:getdata/Appsvg/sereens/details/details_screen.dart';

import '../../../constant.dart';

class futureplant extends StatelessWidget {
  const futureplant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FeaturPlantcard(
            image: "assets/images/bottom_img_1.png",
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen()));

            },),
          FeaturPlantcard(
            image: "assets/images/bottom_img_2.png",
            press: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen()));},),
          FeaturPlantcard(
            image: "assets/images/image_3.png",
            press: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen()));},),
        ],
      ),
    );
  }
}

class FeaturPlantcard extends StatelessWidget {
  const FeaturPlantcard({
    Key? key,
    required this.image, required this.press
  }) : super(key: key);
  final VoidCallback press;
  final String image;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2
        ),
        width: size.width * 0.8,
        height: 180,
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover,
                image:AssetImage(this.image)
            )
        ),
      ),
    );
  }
}

