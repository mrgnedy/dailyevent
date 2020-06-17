import 'package:events/Commnwidget.dart';
import 'package:events/loginPage.dart';
import 'package:events/onBording.dart';
import 'package:events/signup/requsterPage.dart';

import 'package:flutter/material.dart';

class SplashPage2 extends StatefulWidget {
  @override
  _SplashPage2State createState() => _SplashPage2State();
}

class _SplashPage2State extends State<SplashPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Container(
             width: MediaQuery.of(context).size.width>=400?400*.6: MediaQuery.of(context).size.width* .6,
              height: MediaQuery.of(context).size.height * .35,
              margin: EdgeInsets.only(bottom: 70),
              child:
            Image.asset("assets/logo.png")),
            
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return LoginPage();
              }));
            },
            child: CommnWidget.commnbtn("تسجيل الدخول", context)),
           InkWell(
              onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return ReqisterPage();
    }));
  },
             
             child: CommnWidget.commnbtn("تسجيل جديد", context)),Spacer(),],
        ),
      ),
      
    );
  }
}
