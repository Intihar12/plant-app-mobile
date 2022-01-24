import 'package:flutter/material.dart';
import 'package:getdata/Sqlite/sqlfuture.dart';
import 'package:getdata/Sqlite/sqlmodalss/sqlitems.dart';

//import 'modals/sqlitems.dart';
import 'notes_page.dart';
class editSql extends StatefulWidget {
  const editSql({Key? key , required this.name, required this.email}) : super(key: key);
  final  String name;
  final String email;

  @override
  _editSqlState createState() => _editSqlState();
}

class _editSqlState extends State<editSql> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  DatabaseHandler? handler;


  @override
  void initState() {

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
      appBar: AppBar(title: Text('edit data'),),

      body: FutureBuilder(
        future: handler!.retrieveUser(widget.name, widget.email),
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
                        snapshot.data![index].name,
                        //style: Theme.of(context).textTheme.headline3,
                      ),

                        Text(
                          snapshot.data![index].email,
                          //style: Theme.of(context).textTheme.headline3,
                        ),
                      ]
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Text(""),
                        TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'ITEM',
                            suffixStyle: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          controller: nameController,
                        ),


                        TextField(
                          keyboardType: TextInputType.emailAddress,

                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'email',
                            suffixStyle: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          controller: emailController,
                        ),


                        TextButton(
                          onPressed: () {
                            handler!.updateData( nameController.text, emailController.text,  snapshot.data![index].id! );
                           // print(snapshot.data![index].id.toString());
print("updatevv + ${nameController.text}");
print(emailController.text);
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),

                      ],
                    )
                  )
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
