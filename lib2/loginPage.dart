import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Commnwidget.dart';
import 'NavgationBotoom/navgationBottomBar.dart';
import 'helper/ApiRequests.dart';
import 'helper/dataUser.dart';
import 'resetPassword/enterEmail.dart';
import 'signup/requsterPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  bool hide = true;
  bool check = false;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
    DataUser _dataUser = DataUser.instance;
        
  ApiRequests _apiRequests = new ApiRequests();
  String _goodleToken;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  void iosPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iosPermission();

    _firebaseMessaging.getToken().then((token) {
      print("--------------gooogle token ------------------");
      print(token);
      if (this.mounted) {
        setState(() {
          _goodleToken = token;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    firebaseCloudMessagingListeners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 45,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .08,
                                bottom: 20),
                            // width: MediaQuery.of(context).size.width >= 400
                            //     ? 400 * .4
                            //     : MediaQuery.of(context).size.width * .4,
                            //   height: MediaQuery.of(context).size.height * .28,
                            alignment: Alignment.center,
                            // color: Colors.red,
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/logo.png",
                                  width: MediaQuery.of(context).size.width >=
                                          400
                                      ? 400 * .4
                                      : MediaQuery.of(context).size.width * .4,
                                ),
                                Text(
                                  " اهلا بك \n الرجاء تسجيل الدخول الي حسابك ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "thin",
                                      fontSize: 14),
                                ),
                                // Text(
                                //   "الرجاء تسجيل الدخول الي حسابك", textAlign: TextAlign.center,
                                //   style: TextStyle(
                                //       color: Colors.black,
                                //       fontFamily: "thin",
                                //       fontSize: 12),
                                // )
                              ],
                            )),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width > 400
                              ? 400 * .8
                              : MediaQuery.of(context).size.width * .85,
                          child: TextFormField(
                              style: TextStyle(
                                  fontFamily: "thin",
                                  color: CommnWidget.commonColor,
                                  fontSize: 14),
                              onSaved: (value) {
                                email = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "البريد الالكتروني او رقم الهاتف مسبوق بكود الدولة";
                                }
                                   if (value.length<8) {
                                  return "البريد الالكتروني او رقم الهاتف مسبوق بكود الدولة";
                                }
                                // if( !EmailValidator.validate(value.trim(), true)){
                                //         return "رجاء ادخل بريد الكتروني صحيح";
                                //   }
                              },
                              textAlign: TextAlign.right,
                              decoration: CommnWidget.commnInputDecoration(
                                  "البريد الالكتروني او رقم الهاتف مسبوق بكود الدولة",
                                  Icon(
                                    Icons.alternate_email,
                                    color: Colors.grey[500],
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 1,
                                  ))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width > 400
                              ? 400 * .8
                              : MediaQuery.of(context).size.width * .85,
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: 20),
                          child: TextFormField(
                              style: TextStyle(
                                  fontFamily: "thin",
                                  color: CommnWidget.commonColor,
                                  fontSize: 14),
                              onSaved: (value) {
                                password = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "رجاء ادخل كلمة المرور";
                                }
                                if (value.length < 6) {
                                  return "كلمة المرور قصيره جدا";
                                }
                              },
                              textAlign: TextAlign.right,
                              obscureText: hide,
                              decoration: CommnWidget.commnInputDecoration(
                                  "كلمة المرور",
                                  Icon(Icons.lock),
                                  IconButton(
                                    icon: hide
                                        ? Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey[500],
                                          )
                                        : Icon(
                                            Icons.visibility,
                                            color: Colors.grey[500],
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        hide = !hide;
                                      });
                                    },
                                  ))),
                        ),
                        SizedBox(height: 50,),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: Container(
                        //     margin: EdgeInsets.only(right: 20),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.end,
                        //       children: <Widget>[
                        //         Text(
                        //           "   تذكرني    ",
                        //           style: TextStyle(fontFamily: "thin"),
                        //         ),
                        //         IconButton(
                        //           icon: check
                        //               ? Icon(
                        //                   Icons.check_box,
                        //                   color: CommnWidget.commonColor,
                        //                 )
                        //               : Icon(Icons.check_box_outline_blank,
                        //                   color: CommnWidget.commonColor),
                        //           onPressed: () {
                        //             setState(() {
                        //               check = !check;
                        //             });
                        //           },
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        _isLoading
                            ? Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: CupertinoActivityIndicator(
                                    animating: true,
                                    radius: 17,
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  valedate();
                                },
                                child: CommnWidget.commnbtn(
                                    "تسجيل الدخول", context)),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ResetEmail();
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "نسيت كلمة المرور؟",
                              style: TextStyle(fontFamily: "thin"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 8, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: Divider(
                                thickness: 1,
                                color: Colors.grey[500],
                              )),
                              // Container(
                              //     margin: EdgeInsets.only(right: 12, left: 12),
                              //     child: Text(
                              //       "أو سجل من خلال  ",
                              //       style: TextStyle(
                              //           fontFamily: "thin", fontSize: 12),
                              //     )),
                              // Expanded(
                              //     child: Divider(
                              //   thickness: 1,
                              //   color: Colors.grey[500],
                              // )),
                            ],
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: <Widget>[
                        //     // Use the FaIcon Widget + FontAwesomeIcons class for the IconData

                        //     CommnWidget.cirvleicon(
                        //         Icon(
                        //           FontAwesomeIcons.facebookF,
                        //           color: CommnWidget.commonColor,
                        //         ),
                        //         Colors.white),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     CommnWidget.cirvleicon(
                        //         Icon(
                        //           FontAwesomeIcons.twitter,
                        //           color: CommnWidget.commonColor,
                        //         ),
                        //         Colors.white),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     CommnWidget.cirvleicon(
                        //         Icon(
                        //           FontAwesomeIcons.google,
                        //           color: CommnWidget.commonColor,
                        //         ),
                        //         Colors.white),
                        //   ],
                        // ),

                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ReqisterPage();
                                  }));
                                },
                                child: Text(
                                  " سجل الان ",
                                  style: TextStyle(fontFamily: "black"),
                                )),
                            Text(
                              " لا يوجد لديك حساب ؟ ",
                              style: TextStyle(fontFamily: "thin"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Spacer(),
  //               InkWell(
  //                 onTap: (){
  //                     _dataUser.setKey(
  //             {'key': "login", 'value': false});
  // Navigator.push(context, MaterialPageRoute(builder: (context) {
  //             return ChoosePage();
  //           }));

  //                 },
  //                                 child: Align(
  //                   alignment: Alignment.bottomCenter,
  //                   child: Container(
  //                     height: 45,
  //                     color: CommnWidget.commonColor,
  //                     width: MediaQuery.of(context).size.width,
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: <Widget>[
  //                         Icon(
  //                           FontAwesomeIcons.arrowAltCircleLeft,
  //                           color: Colors.white,
  //                         ),
  //                         Text(
  //                           " تصفح بدون تسجيل ",
  //                           style:
  //                               TextStyle(fontFamily: "black", color: Colors.white),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void valedate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _isLoading = true;
      });
      firebaseCloudMessagingListeners();
      print('THis GOOGLE TOKEN $_goodleToken');
      //_goodleToken

      _apiRequests.login(email, password, _goodleToken).then((value) {
        if (value != null) {
          if (value) {
              _dataUser.setKey(
              {'key': "login", 'value': true});
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BottomNavigationsBar();
            }));
            // Navigator.pushAndRemoveUntil(context,
            //     MaterialPageRoute(builder: (context) {
            //       return HomePage();
            //     }), (Route<dynamic> route) => false);
          } else {
            CommnWidget.showErrorDialog(
                "حدث خطأ ما", "هذه المعلومات خاطئة", DialogType.ERROR, context);
            setState(() {
              _isLoading = false;
            });
          }
        } else {
          CommnWidget.showErrorDialog("حدث خطأ ما", "تاكد من الاتصال بالانترنت",
              DialogType.WARNING, context);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
