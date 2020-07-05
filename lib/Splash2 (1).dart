
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ChoosePage (1).dart';
import 'Commnwidget (1).dart';
import 'helper (1)/dataUser (1).dart';
import 'loginPage (1).dart';
import 'signup%20(1)/requsterPage%20(1).dart';

class SplashPage2 extends StatefulWidget {
  @override
  _SplashPage2State createState() => _SplashPage2State();
}

class _SplashPage2State extends State<SplashPage2>    with TickerProviderStateMixin {
  int select = 0;
  Animation _containerRadiusAnimation,
      _containerSizeAnimation,
      _containerColorAnimation;
  AnimationController _containerAnimationController;
  DataUser _dataUser = DataUser.instance;
   @override
  void initState() {
    super.initState();
    _containerAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3500));

    _containerRadiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(100.0),
            end: BorderRadius.circular(0.0))
        .animate(CurvedAnimation(
            curve: Curves.slowMiddle, parent: _containerAnimationController));

    _containerSizeAnimation = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(
            curve: Curves.ease, parent: _containerAnimationController));

    _containerColorAnimation =
        ColorTween(begin: Colors.white, end: Colors.white).animate(
            CurvedAnimation(
                curve: Curves.ease, parent: _containerAnimationController));

    _containerAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: _containerAnimationController,
            builder: (context, index) {
              return Container(
                width: _containerSizeAnimation.value * height,
                height: _containerSizeAnimation.value * height,
                decoration: BoxDecoration(
                    borderRadius: _containerRadiusAnimation.value,
                    color: _containerColorAnimation.value),
                child:  SingleChildScrollView(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height*.13),
                Container(
                  height: MediaQuery.of(context).size.height-45-MediaQuery.of(context).size.height*.13,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Spacer(),
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
                      // Spacer(),
                      // InkWell(
                      //   onTap: () {
                      //     _dataUser.setKey({'key': "login", 'value': false});
                      //     Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //       return ChoosePage();
                      //     }));
                      //   },
                      //   child: Align(
                      //     alignment: Alignment.bottomCenter,
                      //     child: Container(
                      //       height: 45,
                      //       color: CommnWidget.commonColor,
                      //       width: MediaQuery.of(context).size.width,
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: <Widget>[
                      //           Icon(
                      //             FontAwesomeIcons.arrowAltCircleLeft,
                      //             color: Colors.white,
                      //           ),
                      //           Text(
                      //             " تصفح بدون تسجيل ",
                      //             style:
                      //                 TextStyle(fontFamily: "black", color: Colors.white),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
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
                    )   ],
            ),
          ));}),
        ),
      
    );
  }
}
