/*
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
                          onChanged:(value){},
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



*/



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.onItemChange,
    required this.size,
  }) : super(key: key);

  final Size size;
final Function onItemChange;
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
                          onChanged:onItemChange(),
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





class HeaderWithSearchBoxnm extends StatefulWidget {
  const HeaderWithSearchBoxnm({
    Key? key,

  }) : super(key: key);
  @override
  State<HeaderWithSearchBoxnm> createState() => _HeaderWithSearchBoxnmState();
}

class _HeaderWithSearchBoxnmState extends State<HeaderWithSearchBoxnm> {
 // List<String> newDataList = List.from(HeaderWithSearchBox.mainDataList);
  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [
    "Apple",
    "Apricot",
    "Banana",
    "Blackberry",
    "Coconut",
    "Date",
    "Fig",
    "Gooseberry",
    "Grapes",
    "Lemon",
    "Litchi",
    "Mango",
    "Orange",
    "Papaya",
    "Peach",
    "Pineapple",
    "Pomegranate",
    "Starfruit"
  ];
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      // it will cover 20 percent sereen
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),


     ListView(

     children: newDataList.map((data) {
    return ListTile(
    title: Text(data),
    onTap: ()=> print(data),);
    }).toList(),
    ),
    ])
    );
  }
}




