import 'package:flutter/material.dart';

import 'hoom.dart';
void main() => runApp(new CALCulator());

class CALCulator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator App",
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new HomePage(),
    );
  }
}