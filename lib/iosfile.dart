import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main(){
  runApp(
      DevicePreview(
          enabled: true,
          builder: (context)=>
      MyAppios()));
}

class MyAppios extends StatelessWidget {
  const MyAppios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body:  Center(
          child: Text('hello world'),
        ),
      ),
    );
  }
}
/*class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('Hello world'),
      ),
    );
  }
}*/
