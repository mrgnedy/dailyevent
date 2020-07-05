import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifcationClss{
  BuildContext contexts;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var initializationSettingsAndroid;
  var initializationSettingsIOS;
  var initializationSettings;
  void initalvalues(BuildContext context){
    contexts = context;
initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon'); 
        initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
         flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
         flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: 
          onSelectNotification);
           _firebaseMessaging.configure(
       onMessage: (Map<String, dynamic> message) async {
         print("onMessage tabs: $message");
           showNotificationWithDefaultSound(
                message["notification"]["title"].toString(), message["notification"]["body"].toString(),context);
        // _showItemDialog(message);
       },
    //   onBackgroundMessage: myBackgroundMessageHandler,
       onLaunch: (Map<String, dynamic> message) async {
         print("onLaunch: $message");
        // _navigateToItemDetail(message);
       },
       onResume: (Map<String, dynamic> message) async {
         print("onResume: $message");
         
        // _navigateToItemDetail(message);
       },
     );
  }

   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

Future showNotificationWithDefaultSound(String tittel,String body , BuildContext context) async {
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.Max, priority: Priority.High);
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    DateTime.now().millisecond,
    tittel,
    body,
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}



  Future onSelectNotification(String sd) async {
//     Navigator.push(contexts,MaterialPageRoute(builder: (contxet){
// return NotifcationPage(); 
//     }));
    // Navigator.of(context).s
    // showDialog(
    //   context: context,
    //   builder: (_) {
    //     return new AlertDialog(
    //       title: Text("PayLoad"),
    //       content: Text("Payload : $payload"),
    //     );
    //   },
    // );
  }
    
    // // var initializationSettingsIOS = new IOSInitializationSettings();
    // // var initializationSettings = new InitializationSettings(
    // //     initializationSettingsAndroid, initializationSettingsIOS);
    // // flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    // flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: 
    //     onSelectNotification);

}

