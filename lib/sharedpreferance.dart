import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedpreferance extends StatefulWidget {
  const sharedpreferance({Key? key}) : super(key: key);

  @override
  _sharedpreferanceState createState() => _sharedpreferanceState();
}

class _sharedpreferanceState extends State<sharedpreferance> {
    String haveStarted3times = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _incrementStartup();

  }


  // will get startupnambers fron sared preferance
  //will return 0 if null

  Future<int> _getIntFromSharedPref() async {
    final prefS = await SharedPreferences.getInstance();
    final startupNumber = prefS.getInt('startupNumber');
    if (startupNumber == null) {
      return 0;
    }
    return startupNumber;
  }

  // Reset the counter in shared preferance 0
  Future<void> _restCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('startupNumber', 0);
  }

// will increment startupnumber and store in then
  //use setState to display in ui
  Future<void> _incrementStartup() async {
    final prefs = await SharedPreferences.getInstance();
    int lastStartupNumber = await _getIntFromSharedPref();
    int currentStartupNumber = ++lastStartupNumber;
    await prefs.setInt('startupNumber', currentStartupNumber);
    if (currentStartupNumber == 3) {
      setState(() {
        haveStarted3times = '$currentStartupNumber Times Completed';
      });
      // Reset only if you want to
      await _restCounter();
    } else {
      setState(() {
        haveStarted3times = '$currentStartupNumber Times started the app';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            haveStarted3times,
            style: TextStyle(fontSize: 18),
          ),
        ],
      )),
    );
  }
}
