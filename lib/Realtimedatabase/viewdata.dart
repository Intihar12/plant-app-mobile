
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class viewdata extends StatefulWidget {
  const viewdata({Key? key}) : super(key: key);

  @override
  _viewdataState createState() => _viewdataState();
}

class _viewdataState extends State<viewdata> {
   late Query _ref;
String databasejson="";

Widget _buildshowdata({required Map contact}){
  return Container(
    child: Column(
      children: [
        //Text( contact['name'])
        Text(contact['name'] + ", " + contact['email'] + ", " + contact['password'])
      ],
    ),
  );
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
   _ref=FirebaseDatabase.instance.ref().child('users')
        .orderByChild('name');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('view data'),),

body: Container(
child: FirebaseAnimatedList(
  query: _ref,
  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double>animation ,int index){
    Map data=snapshot.value as Map;
    return _buildshowdata(contact: data);
  },
),
)
    );
  }

}
