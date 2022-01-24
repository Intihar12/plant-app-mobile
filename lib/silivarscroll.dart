import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/material.dart';


// for circle Avatar code

class silivarscroll extends StatefulWidget {
  const silivarscroll({Key? key}) : super(key: key);

  @override
  _silivarscrollState createState() => _silivarscrollState();
}

class _silivarscrollState extends State<silivarscroll> {
  bool isVisible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,

        body: CustomScrollView(slivers: [
          SliverAppBar( floating:true, title: Text('intuu'),),
          SliverList(delegate: SliverChildListDelegate([

            Container(
              child: Column(
                children: [

                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),

                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),

                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),

                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),
                  SizedBox(width: 20,),
                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),
                  SizedBox(width: 30,),
                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),
                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),

                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),

                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),

                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),
                  SizedBox(width: 20,),
                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),
                  SizedBox(width: 30,),
                  TextButton(

                      onPressed: () {},

                      child: Text('Circleavatar',)),


                  Wrap(
                    children: [
                      TextButton(

                          onPressed: () {},

                          child: Text('Circleavatar',)),

                      TextButton(

                          onPressed: () {},

                          child: Text('Circleavatar',)),

                      TextButton(

                          onPressed: () {},

                          child: Text('Circleavatar',)),

                      TextButton(

                          onPressed: () {},

                          child: Text('Circleavatar',)),
                      SizedBox(width: 20,),
                      TextButton(

                          onPressed: () {},

                          child: Text('Circleavatar',)),
                      SizedBox(width: 30,),
                      TextButton(

                          onPressed: () {},

                          child: Text('Circleavatar',)),


                    ],
                  ),


                ],
              ),
            )
          ]))
        ]
        )
    );
  }}

    /* Padding(
        padding: const EdgeInsets.fromLTRB(20,100,20,20),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 150,
                  backgroundColor: Colors.black26,
                  backgroundImage:  ExactAssetImage('assets/web.jpg'),
                  //  child: Image.asset('assets/web.jpg'),
                ),
                Builder(
                  builder: (context)=>GestureDetector(
                    onTap:() {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("this is the Snackbar"),
                        ),
                      );
                    },

                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.black26,
                      backgroundImage:  ExactAssetImage('assets/web.jpg'),
                      //  child: Image.asset('assets/web.jpg'),
                    ),
                  ),
                ),

                // Check for horizantly row overflow and correct with warp

                Row(
                  children: [
                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),

                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),

                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),

                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),
                    SizedBox(width: 20,),
                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),
                    SizedBox(width: 30,),
                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),


                  ],
                ),




// wwwwwwwaaaaarrrppppp

                Wrap(
                  children: [
                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),

                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),

                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),

                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),
                    SizedBox(width: 20,),
                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),
                    SizedBox(width: 30,),
                    TextButton(

                        onPressed: (){},

                        child: Text('Circleavatar',)),


                  ],
                ),




                // Visibilty   image or every thing

                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      isVisible=!isVisible;
                    });
                  },
                  child: Text('Button 1 '),
                ),
                Visibility(
                  visible: isVisible,
                  child:  CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.black26,
                    backgroundImage:  ExactAssetImage('assets/web.jpg'),
                    //  child: Image.asset('assets/web.jpg'),
                  ),
                )


              ]),
        ),




      ),
    );
  }
}
*/

//warp we used warp for set staq overfloww



