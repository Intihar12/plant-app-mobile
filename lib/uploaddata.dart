import 'dart:io';

import 'package:flutter/cupertino.dart';

//import 'package:firebase/firebase.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'modals/firebaseApi.dart';
class uploaddata extends StatefulWidget {
  const uploaddata({Key? key}) : super(key: key);

  @override
  _uploaddataState createState() => _uploaddataState();
}

class _uploaddataState extends State<uploaddata> {
  File? file;
   UploadTask? task;

//BaseName? basename;
//static final String title='Firebase upload';
  @override
  Widget build(BuildContext context) {
   final filename=file!=null ? basename(file!.path) : 'no file selected';
    return Scaffold(
      appBar: AppBar(title: Text("upload file"),),

      body: Center(

        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(onPressed:
                selectfile,

                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                icon:  Icon(Icons.attach_file, color: Colors.white,),
                 label: Text("Select File", style: TextStyle(color: Colors.white),)),
SizedBox(height: 10,),

            Text(filename, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),

              SizedBox(height: 20,),
              TextButton.icon(onPressed: (){
uploadFile();
              },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                  icon:  Icon(Icons.attach_file, color: Colors.white,),
                  label: Text("Upload  File", style: TextStyle(color: Colors.white))),
              SizedBox(height: 10,),
              task!=null ? builduploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future selectfile() async{
    final result= await FilePicker.platform.pickFiles(allowMultiple: false);
    if(result==null)return;
    final path=result.files.single.path;
    setState(() {
      file=File(path!);
    });
  }

  Future uploadFile()async{

    if (file==null)
      return;
      final fileName=basename(file!.path);
    final destination='files/$fileName';
   task= FirebaseApi.uploadFile(destination, file!);
setState(() {

});
  if(task==null)return null;
  final snapshot=await task!.whenComplete(() {});
  final urlDownload= await snapshot.ref.getDownloadURL();
  print('Download link $urlDownload');
  }

Widget builduploadStatus(UploadTask task)=>StreamBuilder<TaskSnapshot>(
         stream: task.snapshotEvents,
        builder: (context, snapshot){
           if (snapshot.hasData){
             final snap=snapshot.data!;
             final progress=snap.bytesTransferred / snap.totalBytes;
final percentage=(progress * 100).toStringAsFixed(2);
             return Text(
               '$percentage %',
               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
             );
           }else{
             return Container();
           }

        },
);
}




