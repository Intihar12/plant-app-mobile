import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
class mediaquery extends StatefulWidget {
  const mediaquery({Key? key}) : super(key: key);

  @override
  State<mediaquery> createState() => _mediaqueryState();
}

class _mediaqueryState extends State<mediaquery> {

  bool pressed=false;

  @override
  Widget build(BuildContext context) {
    double heights = pressed ? 150 : 250;
    Color color= pressed ? Colors.pink : Colors.black87;
    Size size=MediaQuery.of(context).size;
    double height=size.height;
    double width=size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Google fonts in flutter', style: GoogleFonts.aguafinaScript().copyWith(fontSize: 30),),),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
                children: [
                 Text('height: $height, width: $width', style: TextStyle(fontSize: 30),),
             SizedBox(height: 50,),
             SelectableText('google font in flutter madiaquery for find the length of media device',
               style: GoogleFonts.aguafinaScript().copyWith(fontSize: 30),),

                  // ink well
                  InkWell(

            onTap:(){
              setState((){pressed=!pressed;
              });
            },
               child: AnimatedContainer(
                 duration: Duration(seconds: 1),
                 height: heights,
                 width: 100,
                 color:color,
               ),)
    ]
    )
    ),
        ),
      )
    );
  }
}
