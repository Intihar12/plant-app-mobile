import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getdata/Realtimedatabase/viewdata.dart';


class inputfield extends StatefulWidget {
  const inputfield({Key? key}) : super(key: key);

  @override
  _inputfieldState createState() => _inputfieldState();
}

class _inputfieldState extends State<inputfield> {

  final database= FirebaseDatabase.instance.ref().child('users');

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("input field"),),

      body: Card(
        child: Column(
          children: [


                 TextField(
controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(

                prefixIcon:   Icon(Icons.person),
                  hintText: "user name",
                ),
                    ),



                     TextField(
                      controller:  emailController,
                      keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
    prefixIcon:   Icon(Icons.email),
    hintText: "Email",
    ),
    ),


     TextField(
  controller: passwordController,
    decoration: InputDecoration(
    prefixIcon:   Icon(Icons.password),
    hintText: "Password",
    ),
    ),


          TextButton(onPressed: (){
savedata();

Navigator.push(context, MaterialPageRoute(builder: (context)=>viewdata()));
          }, child: Text("Submit")),
          ],
        ),
      ),

    );
  }

  savedata(){
    String name=nameController.text;
    String email=emailController.text;
    String password=passwordController.text;

    Map<String,String> user ={
      'name':name,
      'email':email,
      'password':password,
    };
    database.push().set(user);
  }
}
