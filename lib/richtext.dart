import 'dart:ui';

import 'package:flutter/material.dart';
class richtext extends StatelessWidget {
  const richtext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          children: [
           RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children:[
                TextSpan(text: "this is the flutter "),
                TextSpan(text: "RichText ", style: TextStyle(color: Colors.blue)),
                TextSpan(text: "widget From "),
                TextSpan(text: "Flutter ", style: TextStyle(color: Colors.blue)),

              ]
            )
          ),



              //Flex is used fof flexibality of container or eyery thing like this


                 Flexible(
            flex:2,
    child: Container(

decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(50),

        color:Colors.blue),),
             ),


            Flexible(
              flex:5,
              child: Container(


                  color:Colors.pink),
            ),

            Flexible(
              flex:1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(


                    color:Colors.amber),
              ),
            ),

            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>circleAvatar()));
            }, child: Text('Circleavatar')),

          ] ),

      )

    );
  }
}


// for circle Avatar code

class circleAvatar extends StatefulWidget {
  const circleAvatar({Key? key}) : super(key: key);

  @override
  _circleAvatarState createState() => _circleAvatarState();
}

class _circleAvatarState extends State<circleAvatar> {
 bool isVisible=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text('Damo coads'),),
      body:   SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,100,20,20),
          child: Center(
            child: Column(
mainAxisAlignment: MainAxisAlignment.center,
              children: [
               GestureDetector(

                 child: Hero(
                   tag: "hero",
                   child: CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.black26,
                    backgroundImage:  ExactAssetImage('assets/web.jpg'),
              //  child: Image.asset('assets/web.jpg'),
                   ),
                 ),
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
                  child:  InteractiveViewer(
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.black26,
                      backgroundImage:  ExactAssetImage('assets/web.jpg'),
                      //  child: Image.asset('assets/web.jpg'),
                    ),
                  ),
                )


              ]),
            ),


        ),
      ),
    );
  }
}


//warp we used warp for set staq overfloww



