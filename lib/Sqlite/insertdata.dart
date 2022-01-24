import 'package:flutter/material.dart';
import 'package:getdata/Sqlite/sqlfuture.dart';
import 'package:getdata/Sqlite/sqlmodalss/sqlitems.dart';

import 'notes_page.dart';

void main() {
  runApp(const MyApp());
}

/// we're now in branch six
///
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'data',
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  const MyAppHome({Key? key}) : super(key: key);

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
 // final List<User> usersList = [];
  DatabaseHandler? handler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    handler = DatabaseHandler();
    handler!.initializeDB().whenComplete(() async {
      setState(() {});
    });
  }

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  /* void addName(String name) {
    final user = User(
      name: name,
    );
    setState(() {
      usersList.add(user);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserting Data'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('A SnackBar'),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search_outlined),
            tooltip: 'Search',
            onPressed: () {
              // our code
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
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
                        onPressed: () async {

                          User myUser = User(name: nameController.text, email: emailController.text);
                          await handler!.insertSingleUser(myUser);

                          /*addName(
                            nameController.text,
                          );*/
                        },
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FutureDark(
                                name: nameController.text, email: emailController.text
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Navigate',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
             // NavigationWidget(usersList: usersList),
            ],
          ),
        ),
      ),
    );
  }
}
/*

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({
    Key? key,
    required this.usersList,
  }) : super(key: key);

  final List<User> usersList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 150,
        width: 350,
        child: Column(
          children: usersList.map((e) {
            return Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FutureDark(
                          name: e.name,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Navigate',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}*/
