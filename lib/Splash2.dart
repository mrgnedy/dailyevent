import 'package:events/ChoosePage.dart';
import 'package:events/Commnwidget.dart';
import 'package:events/helper/dataUser.dart';
import 'package:events/loginPage.dart';
import 'package:events/onBording.dart';
import 'package:events/signup/requsterPage.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashPage2 extends StatefulWidget {
  @override
  _SplashPage2State createState() => _SplashPage2State();
}

class _SplashPage2State extends State<SplashPage2> {
  DataUser _dataUser = DataUser.instance;
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
                width: MediaQuery.of(context).size.width >= 400
                    ? 400 * .6
                    : MediaQuery.of(context).size.width * .6,
                height: MediaQuery.of(context).size.height * .35,
                margin: EdgeInsets.only(bottom: 70),
                child: Image.asset("assets/logo.png")),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: CommnWidget.commnbtn("تسجيل الدخول", context)),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ReqisterPage();
                  }));
                },
                child: CommnWidget.commnbtn("تسجيل جديد", context)),
            Spacer(),
            InkWell(
              onTap: () {
                _dataUser.setKey({'key': "login", 'value': false});
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChoosePage();
                }));
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 45,
                  color: CommnWidget.commonColor,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.arrowAltCircleLeft,
                        color: Colors.white,
                      ),
                      Text(
                        " تصفح بدون تسجيل ",
                        style:
                            TextStyle(fontFamily: "black", color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
