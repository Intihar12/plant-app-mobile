import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedpreferancelocaly extends StatefulWidget {
  const sharedpreferancelocaly({Key? key}) : super(key: key);

  @override
  _sharedpreferancelocalyState createState() => _sharedpreferancelocalyState();
}

class _sharedpreferancelocalyState extends State<sharedpreferancelocaly> {

  TextEditingController nameController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _incrementStartup();
    getdata();

  }

void getdata()async{
    final prefs= await SharedPreferences.getInstance();
    String userinput= prefs.getString("inputuser") ?? "";
    nameController.text=userinput;
}

void removedata()async{
    final prefs= await SharedPreferences.getInstance();
    String userinput= prefs.getString("inputuser") ?? "";
    nameController.text=userinput;
    prefs.remove("inputuser");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(

                  prefixIcon:   Icon(Icons.person),
                  hintText: "user name",
                ),
              ),
              TextButton(onPressed: () async{
                final prefs= await SharedPreferences.getInstance();
               await prefs.setString('inputuser',  nameController.text);

              }, child: Text("Submit")),

              TextButton(onPressed: () async{
               removedata();
              }, child: Text("Delete")),
            ],
          )


      ),
    );
  }
}
