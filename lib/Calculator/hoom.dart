import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var num1 = 0.0, num2 = 0.0, sum = 0.0;

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();

  void doAddition() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void doSub() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void doMul() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doDiv() {
    setState(() {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      sum = (num1 / num2).toDouble();
     print(sum);


    });
  }

  void doClear() {
    setState(() {
      t1.text = "0";
      t2.text = "0";
    });
  }

  String str = "";

  void sin1(){

    setState(() {
      // print("sin =");
      print(sin(double.parse(t1.text)));

      sum = sin(int.parse(t1.text));
    });
  }
  void tan1(){
    setState(() {
      print(tan(double.parse(t1.text)).toInt());
      sum = tan(int.parse(t1.text));
    });
  }

  void Cos2(){
    setState(() {
      print(cos(double.parse(t1.text)));

      sum = cos(int.parse(t1.text));
    });
  }

  void power1() {


setState(() {
  double x= double.parse(t1.text);
  int y= int.parse(t2.text);
  double power = 1;
  for (double i = 0; i < y; i++) {
    power *= x;

    sum=power.toDouble();

    print(power);
}}
); }



    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Output : $sum",
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),


              new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(hintText:( "0")),
                controller: t1,
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(hintText: "0"),
                controller: t2,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    child: new Text("+"),
                    color: Colors.greenAccent,
                    onPressed: doAddition,
                  ),
                  new MaterialButton(
                    child: new Text("-"),
                    color: Colors.greenAccent,
                    onPressed: doSub,
                  ),
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    child: new Text("*"),
                    color: Colors.greenAccent,
                    onPressed: doMul,
                  ),
                  new MaterialButton(
                    child: new Text("/"),
                    color: Colors.greenAccent,
                    onPressed: doDiv,
                  ),
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
                  new MaterialButton(
                    child: new Text("Clear"),
                    color: Colors.greenAccent,
                    onPressed: doClear,
                  ),

                  new MaterialButton(
                    child: new Text("Sin"),
                    color: Colors.greenAccent,
                    onPressed: sin1,
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[
                  new MaterialButton(
                    child: new Text("Cos"),
                    color: Colors.greenAccent,
                    onPressed: Cos2,
                  ),

                  new MaterialButton(
                    child: new Text("Tan"),
                    color: Colors.greenAccent,
                    onPressed: tan1,
                  ),
                ],


              ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              new MaterialButton(
                child: new Text("power"),
                color: Colors.greenAccent,
                onPressed: power1,
              ),


            ],)
            ],
          ),
        ),
      ),
    );
  }
}