import 'dart:async';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'NavgationBotoom (1)/navgationBottomBar (1).dart';
import 'Splash2 (1).dart';
import 'helper (1)/data (1).dart';
import 'helper (1)/dataUser (1).dart';
import 'onBording (1).dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  DataUser _dataUser = DataUser.instance;
    Animation<double> animation;
  AnimationController controller;
  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
      controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end:250) .animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
    goToHomePage();
    super.initState();
  }

  void goToHomePage() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        Timer(Duration(seconds: 1), () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          String token = pref.getString(Token);
          String verfied = pref.getString("verfied");
          print(token);
          print(token.toString() != "null");
          if (token != null && token.toString() != "null"&&pref.getString(Confirmed)=="1") {
            print("======================in ===================");
            print(pref.getString("country_id").toString());
            print(pref.getString("city_id").toString());
            _dataUser.setKey(
                {'key': Name, 'value': pref.getString(Name).toString()});
            _dataUser.setKey({
              'key': Countryname,
              'value': pref.getString(Countryname).toString()
            });
            _dataUser.setKey({
              'key': Countryid,
              'value': pref.getString(Countryid).toString()
            });
            _dataUser.setKey({
              'key': MobileNumber,
              'value': pref.getString(MobileNumber).toString()
            });
            _dataUser.setKey({
              'key': CityName,
              'value': pref.getString(CityName).toString()
            });
            _dataUser.setKey(
                {'key': CityId, 'value': pref.getString(CityId).toString()});
            

            //
            _dataUser.setKey({
              'key': ProfileImage,
              'value': pref.getString(ProfileImage).toString()
            });
            _dataUser.setKey(
                {'key': NOTIFY, 'value': pref.getString(NOTIFY).toString()});

            _dataUser.setKey(
                {'key': Token, 'value': pref.getString(Token).toString()});
            _dataUser
                .setKey({'key': Id, 'value': pref.getString(Id).toString()});
            _dataUser.setKey(
                {'key': Email, 'value': pref.getString(Email).toString()});

            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) {
                  return BottomNavigationsBar();
                },
              ),
            );
          } else if(pref.getString(Installed)=="1"){
 Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) {
                  return SplashPage2();
                },
              ),
            );
          } else{
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                pageBuilder: (_, __, ___) {
                  return OnBoardingPage();
                },
              ),
            );
          }
        });
      }
    } on SocketException catch (_) {
      print('not connected');
      showNetworkErrorDialog(context);
    }
  }

  void showNetworkErrorDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            "تنبيه",
            style: TextStyle(
              fontFamily: "Neo sans",
              fontSize: 15,
            ),
          ),
          content: Text(
            "برجاء التاكد من الاتصال بالانترنت",
            style: TextStyle(
              fontFamily: "Neo sans",
              fontSize: 15,
            ),
          ),
          actions: <Widget>[
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) {
                      return SplashPage();
                    },
                  ),
                );
              },
              child: Text(
                "حاول مرة اخرى",
                style: TextStyle(
                  fontFamily: "Neo sans",
                  fontSize: 15,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: animation.value,
            width: animation.value,
            child: Image.asset("assets/logo.png")),
      ),
    );
  }
}
