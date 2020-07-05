import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'Commnwidget (1).dart';
import 'Splash2 (1).dart';
import 'helper (1)/data (1).dart';


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with TickerProviderStateMixin {
  int select = 0;
    Animation _containerRadiusAnimation,
      _containerSizeAnimation,
      _containerColorAnimation;
  AnimationController _containerAnimationController;
  @override
  void initState() {
    // TODO: implement initState
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
    setinstaled();
        super.initState();
      }
        @override
  void dispose() {
    super.dispose();
    _containerAnimationController?.dispose();
  }
    
      @override
      Widget build(BuildContext context) {
            final height = MediaQuery.of(context).size.height;
        return Scaffold(
          body: Center(
            child:AnimatedBuilder(
            animation: _containerAnimationController,
            builder: (context, index) {
              return Container(
                 width: _containerSizeAnimation.value * height,
                height: _containerSizeAnimation.value * height,
                decoration: BoxDecoration(
                    borderRadius: _containerRadiusAnimation.value,
                    color: _containerColorAnimation.value),
              child: SingleChildScrollView(
                              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Spacer(),
                    select == 0
                        ? cell(
                            "assets/bg1.png",
                            "إكتشف أخر الاحداث",
                            "إكتشف جميع الفعاليات و الاحداث العامة و الأنشطة الثقافية و الترفيهية",
                          )
                        : select == 1
                            ? cell(
                                "assets/bg2.png",
                                "تابع لحظة بلحظة",
                                "التطبيق يوحد فيه خاصية إرسال الإشعارات عن موعد و تفاصيل الفعاليات",
                              )
                            : cell(
                                "assets/bg3.png",
                                "شارك التطبيق",
                                "شارك الفعاليات و الاحداث مع اصدقائك في شبكات التواصل الاجتماعي",
                              ),
                    // Spacer(),
         select==2? InkWell(
             onTap: (){
                   Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return SplashPage2();
                            }), (Route<dynamic> route) => false);
             },
             child: CommnWidget.commnbtn("ابدأ الان", context))   :  Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .08,
                        // color: Colors.red,
                        child: select == 0
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.arrow_back,
                                          size: 25,
                                          color: CommnWidget.commonColor,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              select++;
                                            });
                                          },
                                          child: Text(
                                            "التالي",
                                            style: TextStyle(
                                                color: CommnWidget.commonColor,
                                                fontFamily: "thin",
                                                fontSize: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        ClipOval(
                                          child: Container(
                                            width: 8,
                                            height: 8,
                                            color: select == 2
                                                ? CommnWidget.commonColor
                                                : Colors.grey,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          width: 30,
                                          height: 8,
                                          color: select == 1
                                              ? CommnWidget.commonColor
                                              : Colors.grey,
                                        ),
                                        ClipOval(
                                          child: Container(
                                            width: 8,
                                            height: 8,
                                            color: select == 0
                                                ? CommnWidget.commonColor
                                                : Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.arrow_back,
                                          size: 25,
                                          color: CommnWidget.commonColor,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              select++;
                                            });
                                          },
                                          child: Text(
                                            "التالي",
                                            style: TextStyle(
                                                color: CommnWidget.commonColor,
                                                fontFamily: "thin",
                                                fontSize: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      ClipOval(
                                        child: Container(
                                          width: 8,
                                          height: 8,
                                          color: select == 2
                                              ? CommnWidget.commonColor
                                              : Colors.grey,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(8),
                                        width: 30,
                                        height: 8,
                                        color: select == 1
                                            ? CommnWidget.commonColor
                                            : Colors.grey,
                                      ),
                                      ClipOval(
                                        child: Container(
                                          width: 8,
                                          height: 8,
                                          color: select == 0
                                              ? CommnWidget.commonColor
                                              : Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        select--;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "السابق",
                                            style: TextStyle(
                                                color: CommnWidget.commonColor,
                                                fontFamily: "thin",
                                                fontSize: 15),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 25,
                                            color: CommnWidget.commonColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ))
                  ],
                ),
              ),
            );},)
          ),
        );
      }
    
      Widget cell(String image, String lable, String description) {
        return Container(
           height: MediaQuery.of(context).size.height * .9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(

                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .3,
                alignment: Alignment.center,
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                lable,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "thin", fontSize: 23, color: Colors.grey[700]),
              ),

     Center(
              child: PlayAnimation<double>(
                duration: 400.milliseconds,
                tween: 0.0.tweenTo(80.0),
                builder: (context, child, height) {
                  return PlayAnimation<double>(
                    duration: 1200.milliseconds,
                    delay: 500.milliseconds,
                    tween: 2.0.tweenTo(300.0),
                    builder: (context, child, width) {
                      return Center(
                        child: Container(
                          // decoration: boxDecoration,
                          // width: width,
                          // height: height,
                          child: isEnoughRoomForTypewriter(width)
                              ? Padding(
                                       padding: EdgeInsets.all(30),
                                child: TypewriterText(description),
                              )
                              : Container(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
              
              // Container(
              //     padding: EdgeInsets.all(30),
              //     child: Text(
              //       description,
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //           fontFamily: "thin", fontSize: 15, color: Colors.grey[700]),
              //     )),
            ],
          ),
        );
      }
        bool isEnoughRoomForTypewriter(double width) => width > 20;
    
      Future<void> setinstaled() async {

   SharedPreferences pref = await SharedPreferences.getInstance();
   pref.setString(Installed, "1");

      }
}
class TypewriterText extends StatelessWidget {
  static const TEXT_STYLE =  TextStyle(
                      fontFamily: "thin", fontSize: 15,color: Colors.grey);

  final String text;

  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlayAnimation<int>(
          duration: 800.milliseconds,
          delay: 800.milliseconds,
          tween: 0.tweenTo(text.length),
          builder: (context, child, textLength) {
            return Text(text.substring(0, textLength),
                textAlign: TextAlign.center, style: TEXT_STYLE);
          }),
    );
  }
}