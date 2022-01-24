
import 'package:flutter/material.dart';
import 'package:getdata/Appsvg/sereens/details/details_screen.dart';

import '../../../constant.dart';

class RecompondPlants extends StatelessWidget {
  const RecompondPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          recomdPlantCard(
            image: "assets/images/image_1.png",

            title: 'Samanth',
            country: 'Pakistan',
            price: 440,
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen()));
            },
          ),

          recomdPlantCard(
            image: "assets/images/image_2.png",

            title: 'Samanth',
            country: 'Pakistan',
            price: 440,
            press: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen()));},
          ),

          recomdPlantCard(
            image: "assets/images/image_3.png",

            title: 'Samanth',
            country: 'Pakistan',
            price: 440,
            press: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen()));},
          ),
        ],
      ),
    );
  }
}

class recomdPlantCard extends StatelessWidget {
  const recomdPlantCard({
    Key? key, required this.title, required this.image, required this.price, required this.country,
    required this.press
  }) : super(key: key);
  final String image, title, country;
  final int price;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        bottom: kDefaultPadding * 2.5,
        top: kDefaultPadding / 2,
        left: kDefaultPadding,
      ),
      width: size.width  * 0.4,
      child: Column(
        children: [
          Image.asset(this.image,),

          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration:  BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                  ),
                  boxShadow:[
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color:  kPrimaryColor.withOpacity(0.23),
                    )
                  ]
              ),
              child: Expanded(
                child: Row(
                  children: [
                    RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text:("$title\n".toUpperCase()), style: Theme.of(context).textTheme.button, ),

                              TextSpan(
                                text:("$country".toUpperCase()),
                                style: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                              )
                            ]
                        )
                    ),
                    Spacer(),
                    Text('\$$price', style: Theme.of(context).textTheme.button?.copyWith(color: kPrimaryColor),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

