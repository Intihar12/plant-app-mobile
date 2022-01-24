import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant.dart';
class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      // it will cover 20 percent sereen
      height: size.height * 0.2,
      child:  Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: 36 + kDefaultPadding),

            height: size.height * 0.2 -27,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)
                )
            ),
            child: Row(children: [
              Text("HiUisHopy!",
                style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),

              ),
              Spacer(),
              Image.asset("assets/images/logo.png"),
            ],),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,10),
                        blurRadius:50,
                      )
                    ]
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value){},
                          decoration: InputDecoration(
                            hintText:"Search",
                            hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,

                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/icons/search.svg",color: Colors.teal,)
                    ],
                  ),
                ),
              )

          )
        ],
      ),
    );
  }
}
