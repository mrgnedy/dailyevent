import 'package:events/NavgationBotoom/navgationBottomBar.dart';
import 'package:events/Splash.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_map_location_picker/generated/i18n.dart' as location_picker;
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    @override
  void initState() {
    // TODO: implement initState
       WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
     // title: 'Flutter Demo',
  
 
     debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

