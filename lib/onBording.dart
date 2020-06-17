import 'package:events/Commnwidget.dart';
import 'package:events/Splash2.dart';
import 'package:events/helper/data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int select = 0;
  @override
  void initState() {
    // TODO: implement initState
    setinstaled();
        super.initState();
      }
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(),
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
                Spacer(),
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
                              //     InkWell(
                              //           onTap: (){
                              //                   setState(() {
                              //                     select--;
                              //                   });
                              //                 },
                              //                     child: Padding(
                              //               padding: const EdgeInsets.all(8.0),
                              //               child: Row(
                              //                 children: <Widget>[
                              //                   Text(
                              //                     "السابق",
                              //                     style: TextStyle(
                              //         color: CommnWidget.commonColor,
                              //         fontFamily: "thin",
                              //         fontSize: 15),
                              //                   ),
                              //                   Icon(
                              //                     Icons.arrow_forward,
                              //                     size: 25,
                              //                     color: CommnWidget.commonColor,
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //     )
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
        );
      }
    
      Widget cell(String image, String lable, String description) {
        return Column(
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
            Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "thin", fontSize: 15, color: Colors.grey[700]),
                )),
          ],
        );
      }
    
      Future<void> setinstaled() async {

   SharedPreferences pref = await SharedPreferences.getInstance();
   pref.setString(Installed, "1");

      }
}
