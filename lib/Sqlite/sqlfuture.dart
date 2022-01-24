import 'package:flutter/material.dart';
import 'package:getdata/Sqlite/sqlmodalss/sqlitems.dart';

import 'editSql.dart';
import 'notes_page.dart';


class FutureDark extends StatefulWidget {
  const FutureDark({
    Key? key,
    required this.name, required this.email
  }) : super(key: key);

  final String name;
  final String email;

  @override
  State<FutureDark> createState() => _FutureDarkState();
}

class _FutureDarkState extends State<FutureDark> {
  DatabaseHandler? handler;



  @override
  void initState() {
   /* List<User> users = [
      User(name: widget.name.toString()),
    ];*/
   /* Future<int?> addUsers() async {
      return await handler!.insertUser(users);
    }*/


    super.initState();
    handler = DatabaseHandler();
    handler!.initializeDB().whenComplete(() async {
      // await addUsers();
      // await deleteUsers();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showing Data'),
      ),
      body: FutureBuilder(
        future: handler!.retrieveUsers(widget.name, widget.email),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    key: ValueKey<int>(snapshot.data![index].id!),
                    contentPadding: const EdgeInsets.all(8.0),

                    title: Column(
                      children: [
                       Text(
                      snapshot.data![index].name ,
                  //    snapshot.data![index].email ,

                      ),
                        Text(
                        //  snapshot.data![index].name ,
                            snapshot.data![index].email ,

                        ),
                      ]
                    ),

                    subtitle: Column(
                      children: <Widget>[
                        Text(""),
                        TextButton(
                          onPressed: () {
                            handler!.deleteitems(snapshot.data![index].id ?? 0);
                            print(snapshot.data![index].id.toString());

                          },
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),


                        TextButton(
                          onPressed: () {;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => editSql( name: snapshot.data![index].id.toString(),
                                    email: snapshot.data![index].id.toString()),

                            ),);
                          },
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}