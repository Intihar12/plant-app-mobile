import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main(){runApp(pageviewmodel());}


class pageviewmodel extends StatelessWidget {
  const pageviewmodel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: pagedesign(),
    );
  }
}
class pagedesign extends StatefulWidget {
  const pagedesign({Key? key}) : super(key: key);

  @override
  _pagedesignState createState() => _pagedesignState();
}

class _pagedesignState extends State<pagedesign> {

  // List<PageViewModel>  add thy ya nathy jak ga masla nush
  List<PageViewModel>getpage(){
    return[
      PageViewModel(
          image: Image.asset("assets/web.jpg"),
          title: "Live Demo page 1",
          body: "Welcome to Proto Coders Point",
          footer: Text("Footer Text here "),
          decoration: const PageDecoration(
            pageColor: Colors.blue,
          )),

      PageViewModel(
          image: Image.asset("assets/web1.jpg"),
          title: "Live Demo page 2",
          body: "Welcome to Proto Coders Point",
          footer: Text("Footer Text here "),
          decoration: const PageDecoration(
            pageColor: Colors.blue,
          )),
      PageViewModel(
          image: Image.asset("assets/web3.jpg"),
          title: "Live Demo page 3",
          body: "Welcome to Proto Coders Point",
          footer: Text("Footer Text here "),
          decoration: const PageDecoration(
            pageColor: Colors.blue,
          )),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('page views'),),


      body: IntroductionScreen(
            globalBackgroundColor: Colors.white,
            pages: getpage(),
            showNextButton: false,
            showSkipButton: true,
            skip: Text("Skip"),
            done: Text("Got it "),
            onDone: () {},
      ),
    );
  }
}
