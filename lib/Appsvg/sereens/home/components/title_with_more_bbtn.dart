import 'package:flutter/material.dart';
import 'package:getdata/Appsvg/constant.dart';
class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key, required this.title, required this.pressed
  }) : super(key: key);
  final String title;
  final VoidCallback  pressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding ),
      child: Row(
        children: [
          TitleWithCustomUnderLine(text: title,),
          Spacer(),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),

              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: kPrimaryColor,)
                  )
              ),
            ),
            onPressed: pressed,
            child: Text("More", style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderLine extends StatelessWidget {
  const TitleWithCustomUnderLine({
    Key? key, required this.text
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Positioned(bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),)

        ],
      ),
    );
  }
}

