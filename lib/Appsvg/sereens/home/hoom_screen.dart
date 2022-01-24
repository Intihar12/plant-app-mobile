
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getdata/Appsvg/components/my_Button_nav_bar.dart';
import 'package:getdata/Appsvg/constant.dart';
import 'package:getdata/Appsvg/sereens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),body: Body(),
      bottomNavigationBar:
      mybuttonnavbar(),

    );}

      AppBar buildAppBar(){
    return AppBar(
        elevation: 0,
backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: (){},
        ),
    );
  }
}

