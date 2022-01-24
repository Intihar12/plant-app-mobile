import 'package:flutter/material.dart';
import 'package:getdata/modals/firebaseApi.dart';
import 'package:gallery_saver/gallery_saver.dart';

class imagepage extends StatelessWidget {
  final FirebaseFile file;
  const imagepage({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(file.name),
      actions: [
        IconButton(onPressed: () async{
          // await FirebaseApi.downloadFile(file.ref);

          String downloadURL = await file.ref.getDownloadURL();
          print("downloadURL = ");
       //   print(downloadURL);

         await GallerySaver.saveImage(downloadURL, albumName: " getdata");

          final snackBar=SnackBar(
            content: Text('Download ${file.name}'),);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

        }, icon: Icon(Icons.file_download)),

      ],),

      body: Image.network(file.url,height: double.infinity,
      fit: BoxFit.cover,),
    );
  }
}
