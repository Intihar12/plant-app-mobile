import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:getdata/apimodals/Apicalls/products.dart';
import 'package:getdata/Realtimedatabase/inputfield.dart';
import 'package:getdata/localystoreshaerdpreference.dart';
import 'package:getdata/locationfind.dart';
import 'package:getdata/maplocation.dart';
import 'package:getdata/mediaquery.dart';
import 'package:getdata/pricticebasics.dart';
import 'package:getdata/statemnagement/productbox.dart';
import 'package:getdata/richtext.dart';
import 'package:getdata/sharedpreferance.dart';
import 'package:getdata/silivarscroll.dart';
import 'package:getdata/topthirtytips.dart';
import 'package:getdata/Realtimedatabase/updatedata.dart';
import 'package:getdata/uploaddata.dart';
import 'package:getdata/Realtimedatabase/viewdata.dart';
import 'package:getdata/widgets/openbroser.dart';
import 'package:getdata/wordgeneratar.dart';

import 'Appsvg/mainn.dart';
import 'Calculator/calculat.dart';
import 'apimodals/mainclass.dart';
import 'Realtimedatabase/deletedata.dart';
import 'downloaddata.dart';
import 'Sqlite/insertdata.dart';
import 'iosfile.dart';
import 'notifications.dart';
import 'package:device_preview/device_preview.dart';

class readData extends StatefulWidget {
  const readData({Key? key}) : super(key: key);

  @override
  _readDataState createState() => _readDataState();
}

class _readDataState extends State<readData> {

late DatabaseReference database;
String databasejson="";
int countvalue=0;


@override
  void initState() {
    // TODO: implement initState
    super.initState();

    database= FirebaseDatabase.instance.ref();

database.child("jobprofile").child("profile").onValue.listen((event) {
  print("counter value"+ event.snapshot.value.toString());

setState(() {
  // countvalue=int.parse(event.snapshot.value.toString());
});
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Text( countvalue.toString() +  "  " "database - " + databasejson),
         TextButton(onPressed: (){
             _createDB();
         }, child: Text("creat Db")),

                TextButton(onPressed: (){
                  _readrealdata();
                }, child: Text("read Db")),

                TextButton(onPressed: (){
                  _readonechild();
                }, child: Text("read one data")),

                TextButton(onPressed: (){
                  _updatedata();
                }, child: Text("update Db")),

                TextButton(onPressed: (){
                  countvalue++;
                  _updatevalue();
                }, child: Text("update Db value by1")),

                TextButton(onPressed: (){
                  removedata();
                }, child: Text("delete Db")),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>inputfield()));
                }, child: Text("Input Field")),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>viewdata()));
                }, child: Text("Input Field view")),


                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>deletedata()));
                }, child: Text("Delete Email")),



                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>updatedata()));
                }, child: Text("Edit data")),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>uploaddata()));
                }, child: Text("upload files")),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>downloaddata()));
                }, child: Text("download files")),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>notifications()));
                }, child: Text("notifications")),


                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>randomwords()));
                }, child: Text("WordsPairs")),


                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>sharedpreferance()));
                }, child: Text("Shared preferences")),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>sharedpreferancelocaly()));
                }, child: Text('localy store shared preferance')),


                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>locationfind()));
                }, child: Text('location find')),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>maplocation()));
                }, child: Text('maplocation find')),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pageviewmodel()));
                }, child: Text('pageview modal')),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>richtext()));
                }, child: Text('Rich Text')),


                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>silivarscroll()));
                }, child: Text('Silivar Scroll')),


                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>mediaquery()));
                }, child: Text('Mediaquery')),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                }, child: Text('SQLLITE')),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pricticebasics()));
                }, child: Text('Prictice')),


                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppv()));
                }, child: Text('Prictice')),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppbros()));
                }, child: Text('Prictice')),


                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppapi(products: fetchProducts(),)));
                }, child: Text('API PRICTICE')),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppios()));
                }, child: Text('IOS')),


                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CALCulator()));
                }, child: Text('IOS')),

                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppa()));
                }, child: Text('APPTEST')),

              ],
            ),
          ),
        ),
      ),
    );
  }

_createDB(){
  database.child("profile").set("intuu profile");
  database.child("jobprofile").set({"website": "www.jdksjdks.com", "webdsite2":"ww.intuu.com", "name": "usstokeyo"});
}
_readrealdata(){

  //database.once().then((value) => null)
  database.once().then((DatabaseEvent databaseEvent){

  // print("printthis _" +databaseEvent.snapshot.value.toString());
   setState(() {
     databasejson=databaseEvent.snapshot.value.toString();
   });
  });
}

_readonechild(){
  database.child("jobprofile").child("webdsite2").once().then((DatabaseEvent databaseEvent){
    print("second website"+ databaseEvent.snapshot.value.toString());
    setState(() {
      databasejson= databaseEvent.snapshot.value.toString();
    });
  });
}
_updatedata(){

  database.child("jobprofile").update({"webdsite2":"www.ali.comd"});
}

_updatevalue(){

  database.child("jobprofile").update({"profile":countvalue +1});
}

removedata(){
database.child("profile").remove();
}

}

