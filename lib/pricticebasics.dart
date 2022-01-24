

import 'dart:ui';

import 'package:flutter/material.dart';


void main(){
  runApp(pricticebasics());
}
class pricticebasics extends StatelessWidget {
  const pricticebasics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: prictice(),
    );
  }
}
class prictice extends StatelessWidget {
  const prictice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flutter damo'),),

    body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
         verticalDirection: VerticalDirection.down,
        children: [
          Text("hellow world"),
Divider(height: 15, endIndent: 20, indent: 20, color: Colors.black,),
          SizedBox(height: 20,),
          Icon(Icons.email),
          Divider(height: 15,indent: 20,endIndent: 20, thickness: 5, color: Colors.black,),

          SizedBox(height: 20,),
          Image.asset("assets/web.jpg"),

          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>sdowdilog()));
          }, child: Text('Prictice')),

        ],
      ),
    ),

    );
  }
}


/*class buttoncontainer extends StatelessWidget {
  const buttoncontainer({Key? key, required this.name, required this.description, required this.email, required this.image})
      : super(key: key);
final String name;
final String description;
final String email;
final String image;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
       child: Row(
         children: [
           Image.asset('assets/web.jpg', height: 100, width: 100,),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(this.name, style:  TextStyle(color:Colors.white, fontSize: 10),),
                SizedBox(height: 0,),
                Text(this.email,style: TextStyle(fontSize: 10)),
                SizedBox(height: 0,),

                Text(this.description, style: TextStyle(fontSize: 10),)
              ],
            )
         ]
       ),
      ),
    );


  }
}*/


class sdowdilog extends StatefulWidget {
  const sdowdilog({Key? key}) : super(key: key);

  @override
  State<sdowdilog> createState() => _sdowdilogState();
}

class _sdowdilogState extends State<sdowdilog> {

void _showDilog(BuildContext context){
 showDialog(
  context: context, builder: (BuildContext context){
    return AlertDialog(
    title: Text("Message"),
    content: new Text("Hello world"),
    actions: <Widget>[
      new TextButton(child:  Text('closed'),
  onPressed: (){ Navigator.of(context).pop();  },)
    ]);

  }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            _showDilog(context);

          },
          child: Text("Hello world"),
        ),
      ),
    );
  }
}

