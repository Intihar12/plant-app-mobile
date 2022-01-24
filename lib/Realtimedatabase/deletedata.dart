import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class deletedata extends StatefulWidget {
  const deletedata({Key? key}) : super(key: key);

  @override
  _deletedataState createState() => _deletedataState();
}

class _deletedataState extends State<deletedata> {
  TextEditingController emailController=TextEditingController();
  DatabaseReference database=FirebaseDatabase.instance.ref().child('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('delete'),),

      body: Container(
        child: Column(
          children: [
            Card(
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "email"
                ),
              ),
            ),

            ElevatedButton(onPressed: (){
database.orderByChild("email").equalTo(emailController.text).once().then((DatabaseEvent databaseevent){
  DataSnapshot event = databaseevent.snapshot;

  event.children.forEach((element) {
    element.value ;
    FirebaseDatabase.instance.ref()
        .child('users')
        .child(element.key ?? "")
        .remove();

  });

});

            }, child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}
