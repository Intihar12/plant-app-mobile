import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

const AndroidNotificationChannel channel=AndroidNotificationChannel(
  'high_importance_channel',//id
  'High Importance Notifications', //title
    //'This channel is used for important notifications.' ?? "",
 importance: Importance.high,
 playSound: true
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
Future <void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  print('A bg message just show up ${message.messageId}');


}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
await flutterLocalNotificationsPlugin
  .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
    ?.createNotificationChannel(channel);
await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  alert: true,
  badge: true,
  sound: true
);
  runApp(
MaterialApp());
}
class notifications extends StatelessWidget {
  const notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:notificationpage(),
    );
  }
}
class notificationpage extends StatefulWidget {
  const notificationpage({Key? key}) : super(key: key);

  @override
  _notificationpageState createState() => _notificationpageState();
}

class _notificationpageState extends State<notificationpage> {
  int _counter=0;
void showNotification(){
  setState(() {
    _counter++;
  });
  flutterLocalNotificationsPlugin.show(
    0,
    "Testing $_counter",
 "How you did ?",
 NotificationDetails(
   android: AndroidNotificationDetails(
     channel.id, channel.name,
       //channel.description,
     color: Colors.blue,
     playSound: true,
    icon: '@mipmap/ic_launcher'
   )
 )
  );
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification=message.notification ;
      AndroidNotification? android=message.notification?.android;
      if(notification != null && android != null){
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
           NotificationDetails(
            android: AndroidNotificationDetails(
                 channel.id, channel.name,
                //channel.description,
                color: Colors.blue,
             playSound: true,

             icon:'@mipmap/ic_launcher'
            ),
           )
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new message onmessageopened was polushide');
      RemoteNotification? notification= message.notification;
      AndroidNotification? android=message.notification?.android;
      if(notification != null && android != null){
        showDialog(context: context, builder: (_){
          return AlertDialog(
            title: Text(notification.title ?? ""),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.body ?? "")
              ],
            ),
          ),);
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title'),),
body: Center(
  child: Column(
    children: [
  Text('you have push the button many time'),
  Text('$_counter',

  ),
],),),
      floatingActionButton: FloatingActionButton(onPressed: showNotification,
      child: Icon(Icons.add),),

    );
  }
}

/*
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'modals/NotificationApi.dart';


import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

const AndroidNotificationChannel channel=AndroidNotificationChannel(
    'high_importance_channel',//id
    'High Importance Notifications', //title
    //'This channel is used for important notifications.' ?? "",
    importance: Importance.high,
    playSound: true
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
Future <void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  print('A bg message just show up ${message.messageId}');


}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
  );
  runApp(
      MaterialApp());
}


class notifications extends StatefulWidget {
  const notifications({Key? key}) : super(key: key);

  @override
  _notificationsState createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("notification"),),
    body: Center(
      child: Column(
        children: [
          Text('Local Notifications',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),

          TextButton.icon(
        onPressed: (){
          NotificationApi.showNotification(
           title: 'intihar hussain',
            body:'Hey! Do we have every thing we need for launch',
            payload:'intihar.hussain'
           );
        },
        label: Text('Simple Notification'),
         icon:Icon(Icons.notifications),),

          SizedBox(height: 20,),

          TextButton.icon(onPressed: (){},

            icon: Icon(Icons.notifications_active),
            label:Text('Schedule Notification'),
          ),

          SizedBox(height: 20,)

        ],
      ),
    ),
    );
  }
}

*/
