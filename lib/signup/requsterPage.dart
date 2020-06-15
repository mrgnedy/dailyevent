import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dailyevent/NavgationBotoom/SearchCountry.dart';
import 'package:dailyevent/NavgationBotoom/searchcity.dart';
import 'package:dailyevent/helper/ApiRequests.dart';
import 'package:dailyevent/helper/Models/SearchModel.dart';
import 'package:email_validator/email_validator.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';

import '../Commnwidget.dart';
import '../loginPage.dart';
import 'VerficationPage.dart';

class ReqisterPage extends StatefulWidget {
  @override
  _ReqisterPageState createState() => _ReqisterPageState();
}

class _ReqisterPageState extends State<ReqisterPage> {
  String email;
  String password;
  String name;
  String mobilnumber;
  String location;
  double lat;
  double long;
  bool hide = true;
  bool _isLoading = false;
  Cities cityitem;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool check = false;
  final _formKey = GlobalKey<FormState>();
  String _goodleToken;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  ApiRequests _apiRequests = new ApiRequests();
  Eachcountry searchcontyitem;
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
      //  if (this.mounted) {
      setState(() {
        _goodleToken = token;
      });
      // }
    });
  }

//  @Override
//  void onCreate() {
//     super.onCreate();
//     FirebaseApp.initializeApp(this);
// }
  bool _isLoading2 = true;
  String countryname = "اختر اسم الدولة";
  int countryid;
  int cityid;
  String cityname = "اختر اسم المدينة";
  SearchMModel _data;
  getdata() {
    _apiRequests.getsearchdata().then((value) {
      print(value);
      setState(() {
        _data = value;

        _isLoading2 = false;
      });
    });
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    if (this.mounted) super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    firebaseCloudMessagingListeners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: _isLoading2
              ? Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: CupertinoActivityIndicator(
                      animating: true,
                      radius: 17,
                    ),
                  ),
                )
              : _data == null
                  ? Center(
                      child: Text(
                      "تاكد من الاتصال بالانترنت",
                      style: TextStyle(
                        fontFamily: "black",
                      ),
                    ))
                  : SingleChildScrollView(
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
                                        : MediaQuery.of(context).size.width *
                                            .4,
                                  ),
                                  Text(
                                    " اهلا بك \n تسجيل حساب جديد ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "thin",
                                        fontSize: 14),
                                  ),
                                ],
                              )),

                          Container(
                            width: MediaQuery.of(context).size.width > 400
                                ? 400 * .8
                                : MediaQuery.of(context).size.width * .85,
                            margin: EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "thin",
                                    color: CommnWidget.commonColor,
                                    fontSize: 14),
                                onSaved: (value) {
                                  name = value;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "رجاء ادخل الاسم كامل";
                                  } else {
                                    return null;
                                  }
                                },
                                textAlign: TextAlign.right,
                                decoration: CommnWidget.commnInputDecoration(
                                    "الاسم كامل",
                                    Icon(
                                      Icons.person,
                                      color: Colors.grey[500],
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ))),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width > 400
                                ? 400 * .8
                                : MediaQuery.of(context).size.width * .85,
                            margin: EdgeInsets.only(bottom: 15),
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
                                    return "رجاء ادخل البريد الالكتروني";
                                  }
                                  if (!EmailValidator.validate(
                                      value.trim(), true)) {
                                    return "رجاء ادخل بريد الكتروني صحيح";
                                  }
                                },
                                textAlign: TextAlign.right,
                                decoration: CommnWidget.commnInputDecoration(
                                    "البريد الاكتروني",
                                    Icon(
                                      Icons.alternate_email,
                                      color: Colors.grey[500],
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ))),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width > 400
                                ? 400 * .8
                                : MediaQuery.of(context).size.width * .85,
                            margin: EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                                style: TextStyle(
                                    fontFamily: "thin",
                                    color: CommnWidget.commonColor,
                                    fontSize: 14),
                                onSaved: (value) {
                                  mobilnumber = value;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "رجاء ادخل رقم الهاتف";
                                  }
                                  if (value.length < 9) {
                                    return " رجاء ادخل رقم الهاتف صحيح";
                                  }
                                },
                                textAlign: TextAlign.right,
                                decoration: CommnWidget.commnInputDecoration(
                                    " رقم الموبايل مسبوق بكود الدولة",
                                    Icon(
                                      FontAwesomeIcons.mobileAlt,
                                      color: Colors.grey[500],
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ))),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width > 400
                                ? 400 * .8
                                : MediaQuery.of(context).size.width * .85,
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(bottom: 20),
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
                                    Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    IconButton(
                                      icon: hide
                                          ? Icon(
                                              Icons.visibility_off,
                                              color: Colors.grey,
                                            )
                                          : Icon(Icons.visibility,
                                              color: Colors.grey),
                                      onPressed: () {
                                        setState(() {
                                          hide = !hide;
                                        });
                                      },
                                    ))),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 25, left: 25),
                            padding: EdgeInsets.only(
                                right: 8, left: 8, top: 4, bottom: 4),
                            width: MediaQuery.of(context).size.width > 400
                                ? 400 * .8
                                : MediaQuery.of(context).size.width * .85,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey[500], width: 1),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DoctorSearch(
                                                          data: _data)))
                                          .then((chooseProduct) {
                                        // print("-product in home");
                                        // print(chooseProduct['DoctorName']);
                                        // print(chooseProduct['DoctorId']);
                                        if (chooseProduct != null) {
                                          setState(() {
                                            countryname =
                                                chooseProduct['DoctorName'] ??
                                                    null;
                                            countryid =
                                                chooseProduct['DoctorId'] ??
                                                    null;
                                            searchcontyitem = chooseProduct[
                                                    'searchcontyitem'] ??
                                                null;
                                            cityname = "اختر اسم المدينة";
                                          });
                                        }
                                      });
                                    },
                                    child: Icon(Icons.arrow_back_ios)),
                                Text(
                                  countryname.toString(),
                                  style: TextStyle(fontFamily: "thin"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 25, left: 25),
                            padding: EdgeInsets.only(
                                right: 8, left: 8, top: 4, bottom: 4),
                            width: MediaQuery.of(context).size.width > 400
                                ? 400 * .8
                                : MediaQuery.of(context).size.width * .85,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey[500], width: 1),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                    onTap: () {
                                      if (searchcontyitem != null) {
                                        Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DoctorSearch2(
                                                            data:
                                                                searchcontyitem)))
                                            .then((chooseProduct) {
                                          // print("-product in home");
                                          // print(chooseProduct['DoctorName']);
                                          // print(chooseProduct['DoctorId']);
                                          if (chooseProduct != null) {
                                            setState(() {
                                              cityname =
                                                  chooseProduct['DoctorName'] ??
                                                      null;
                                              cityid =
                                                  chooseProduct['DoctorId'] ??
                                                      null;
                                              cityitem = chooseProduct[
                                                      'searchcontyitem'] ??
                                                  null;
                                            });
                                          }
                                        });
                                      }
                                    },
                                    child: Icon(Icons.arrow_back_ios)),
                                Text(
                                  cityname.toString(),
                                  style: TextStyle(fontFamily: "thin"),
                                ),
                              ],
                            ),
                          ),

                          // Container(
                          //   width: MediaQuery.of(context).size.width > 400
                          //       ? 400 * .8
                          //       : MediaQuery.of(context).size.width * .85,
                          //   margin: EdgeInsets.only(bottom: 15),
                          //   //  padding: EdgeInsets.only(right: 20,left: 20),
                          //   child: InkWell(
                          //     onTap: () async {
                          //       LocationResult result = await showLocationPicker(
                          //           context, "AIzaSyBQFncM9uaq-G4j0fb3nMWTRdbzwODGHzM",
                          //           automaticallyAnimateToCurrentLocation: true,
                          //           myLocationButtonEnabled: true,
                          //           layersButtonEnabled: true,
                          //           requiredGPS: true);
                          //       print(result.address);
                          //       setState(() {
                          //         location = result.address.toString();
                          //         lat = result.latLng.latitude;
                          //         long = result.latLng.longitude;
                          //       });
                          //     },
                          //     child: TextFormField(
                          //         enabled: false,
                          //         style: TextStyle(
                          //             fontFamily: "thin",
                          //             color: CommnWidget.commonColor,
                          //             fontSize: 14),
                          //         // onSaved: (value) {
                          //         //   location = value;
                          //         // },
                          //         // validator: (value){
                          //         //   if(location==null){
                          //         //     return "رجاء ادخل الموقع";
                          //         //   }
                          //         // },
                          //         textAlign: TextAlign.right,
                          //         decoration: CommnWidget.commnInputDecoration(
                          //             location == null ? "الموقع" : location,
                          //             Icon(
                          //               Icons.location_on,
                          //               color: Colors.grey[500],
                          //             ),
                          //             Icon(
                          //               Icons.location_on,
                          //               color: Colors.grey,
                          //             ))),
                          //   ),
                          // ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "أوافق علي الشروط و الأحكام",
                                    style: TextStyle(fontFamily: "thin"),
                                  ),
                                  IconButton(
                                    icon: check
                                        ? Icon(
                                            Icons.check_box,
                                            color: CommnWidget.commonColor,
                                          )
                                        : Icon(Icons.check_box_outline_blank,
                                            color: CommnWidget.commonColor),
                                    onPressed: () {
                                      setState(() {
                                        check = !check;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                valedate();
                              },
                              child: _isLoading
                                  ? Center(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: CupertinoActivityIndicator(
                                          animating: true,
                                          radius: 17,
                                        ),
                                      ),
                                    )
                                  : CommnWidget.commnbtn(
                                      "تسجيل الدخول", context)),

                          //  SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LoginPage();
                                    }));
                                  },
                                  child: Text(
                                    " تسجيل دخول ",
                                    style: TextStyle(fontFamily: "black"),
                                  )),
                              Text(
                                " لديك حساب بالفعل ؟ ",
                                style: TextStyle(fontFamily: "thin"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }

  void valedate() {
    if (_formKey.currentState.validate()) {
      //  print(location);
      _formKey.currentState.save();
      if (cityid == null || cityid.toString().isEmpty) {
        showInSnackBar("رجاء ادخل المدينة");

        return;
      }
      if (countryid == null || countryid.toString().isEmpty) {
        showInSnackBar(" رجاء ادخل الدولة  ");
        return;
      }
      if (check == null || check == false) {
        showInSnackBar("رجاء  الموافقة علي الشروط و الاحكام");

        return;
      }

      setState(() {
        _isLoading = true;
      });
      firebaseCloudMessagingListeners();
      print(_goodleToken);
      //_goodleToken

      _apiRequests
          .signup(name, email, mobilnumber, cityid.toString(),
              countryid.toString(), password, _goodleToken)
          .then((value) {
        if (value != null) {
          if (value) {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return VerviedCodePage3();
            }), (Route<dynamic> route) => false);
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return BottomNavigationsBar();
            // }));
            // Navigator.pushAndRemoveUntil(context,
            //     MaterialPageRoute(builder: (context) {
            //       return VerviedCodePage3();
            //     }), (Route<dynamic> route) => false);
          } else {
            CommnWidget.showErrorDialog("حدث خطأ ما",
                "هذه المعلومات مستخدمة من قبل", DialogType.ERROR, context);
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

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        behavior: SnackBarBehavior.fixed,
        backgroundColor: CommnWidget.commonColor,
        content: new Text(
          value,
          textAlign: TextAlign.right,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "thin"),
        ),
      ),
    );
  }
}
