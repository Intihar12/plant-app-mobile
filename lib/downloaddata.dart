import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';

import 'imagepage.dart';
import 'modals/firebaseApi.dart';



class downloaddata extends StatefulWidget {
  const downloaddata({Key? key}) : super(key: key);

  @override
  _downloaddataState createState() => _downloaddataState();
}

class _downloaddataState extends State<downloaddata> {
  late Future <List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureFiles = FirebaseApi.listAll('files/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Firebase Download'),),

        body: FutureBuilder<List<FirebaseFile>>(
            future: futureFiles,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                      child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return Center(child: Text('Some error Occured'),);
                  } else {
                    final files = snapshot.data!;
                    return Column(
                      children: [


                        buildHeader(files.length),


                        SizedBox(height: 15,),
                       Expanded(
                            child: ListView.builder(
                              itemCount: files.length,
                                itemBuilder: (context, index) {
                                  final file = files[index];
                                  return buildFile(context, file);
                                }
                            )
                        )
                      ],
                    );
                  }
              }
            }
        )
    );
  }
    Widget buildFile(BuildContext context, FirebaseFile file) =>
        ListTile(
          leading: ClipOval(
            child: Image.network(
            file.url,
            width: 25,
            height: 25,
            fit: BoxFit.cover,
          ),),

          title: Text(
            file.name,
            style: TextStyle(fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline, color: Colors.blue
            ),
          ),

          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>imagepage(file: file))),
        );


    Widget buildHeader(int length) =>
        ListTile(
          tileColor: Colors.blue,
          leading: Container(

            child: Icon(Icons.file_copy),
            color: Colors.white,
          ),
          title: Text(
            '$length Files',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),

        );
  }

