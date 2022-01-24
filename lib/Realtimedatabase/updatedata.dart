import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class updatedata extends StatefulWidget {
  const updatedata({Key? key}) : super(key: key);

  @override
  _updatedataState createState() => _updatedataState();
}

class _updatedataState extends State<updatedata> {
  DatabaseReference database=FirebaseDatabase.instance.ref().child('users');

  TextEditingController NameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController searchController=TextEditingController();
  //late Query database;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('update'),),

      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [


              TextField(
                controller: searchController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "email"
                ),
              ),


              ElevatedButton(onPressed: (){
                database.orderByChild("email").equalTo(searchController.text).once().then((DatabaseEvent databaseevent)  {
                  DataSnapshot event=databaseevent.snapshot;
                  event.children.forEach((element) {

                    Map map = element.value as Map;
                    // print(map["name"]);
                    NameController.text = map["name"];
                    emailController.text=map["email"];
                    passwordController.text=map["password"];

                  });
                  //  print("update data  $event");
                });
              }, child: Text("Search"),),


                TextField(
                    controller: NameController,
                decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),

           labelText: ""

                    ),
                  ),

                   TextFormField(

                     controller: emailController,

                    decoration: InputDecoration(

                      prefixIcon: Icon(Icons.email),

                      labelText: "email"
                    ),
                  ),

                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "password"
                  ),
                ),

                ElevatedButton(onPressed: (){
    database.orderByChild("email").equalTo(searchController.text).once().then((DatabaseEvent databaseevent) {
    DataSnapshot event=databaseevent.snapshot;
    event.children.forEach((element) {

    FirebaseDatabase.instance.ref().child("users/" + (element.key ?? ""))
        .update({"name": NameController.text, "email": emailController.text, "password": passwordController.text});
    }
    ); }
    );   },
    child: Text("Update"),
    ),
     ]
          )


        ),
      )
    );
  }
}






