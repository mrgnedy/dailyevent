import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/Commnwidget.dart';
import 'package:events/NavgationBotoom/ContactUs.dart';
import 'package:events/NavgationBotoom/SearchPage.dart';
import 'package:events/NavgationBotoom/setting/EditeProfile.dart';
import 'package:events/NavgationBotoom/setting/kayemEltatbek.dart';
import 'package:events/aboutUs.dart';
import 'package:events/helper/ApiRequests.dart';
import 'package:events/helper/data.dart';
import 'package:events/helper/dataUser.dart';
import 'package:events/helper/localNotifcation.dart';
import 'package:events/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  final bool isloading ;
  SettingPage({this.isloading});
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  DataUser _dataUser = DataUser.instance;
  bool _isLoading = false;
  ApiRequests _apiRequests = new ApiRequests();
   NotifcationClss _notifcationClss = new NotifcationClss();
  @override
  void initState() {
    super.initState();
    _notifcationClss.initalvalues(context);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: CommnWidget.commonColor,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("الاعدادت",
                      style: TextStyle(
                          fontFamily: "black",
                          color: Colors.white,
                          fontSize: 18)),
          widget.isloading==false?Container():        Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            _dataUser.getKey(Name).toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "thin",
                                height: 1.5),
                          ),
                          // Text(
                          //   "المهنة",
                          //   style: TextStyle(
                          //       color: Colors.white,
                          //       fontFamily: "thin",
                          //       height: 1.5),
                          // ),
                        
                        
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ClipOval(
                        child: CachedNetworkImage(
                            imageUrl:
                              IMAGEURL+_dataUser.getKey(ProfileImage).toString(), // "https://mzjewel.com/wp-content/uploads/2019/11/2c1d5578da20ceabc4a28343769a5c91.jpg",
                            placeholder: (context, url) => Center(
                                  child: CupertinoActivityIndicator(
                                    radius: 17,
                                    animating: true,
                                  ),
                                ),
                            fit: BoxFit.fill,
                            height: 60,
                            width: 60,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error, color: Colors.black)),
                      ),
                    ],
                  )
                ],
              )),
          widget.isloading==false?Container():  Container(
            margin: EdgeInsets.only(right: 40, left: 40, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Colors.grey[500]),
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: CommnWidget.commonColor,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EditeProfile();
                          }));
                        },
                      ),
                    )),
                Text(
                  "تعديل الملف الشخصي ",
                  style: TextStyle(
                      fontFamily: "thin", fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
        widget.isloading==false?Container():    Container(
            margin: EdgeInsets.only(right: 40, left: 28, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Switch(
                    value: _dataUser.getKey(NOTIFY).toString() == "1"
                        ? true
                        : false,
                    onChanged: (value) {
                      if (value == true) {
                        changenotifcation("1");

                        //                         SharedPreferences pref = await SharedPreferences.getInstance();
                        // pref.setString(Utility.BackGroundColor,Utility.BlackColor);
                        // pref.setString(Utility.FontColor,Utility.WhiteColor);
                        //  _dataUser.setKey({'key': Utility.BackGroundColor, 'value': Utility.BlackColor});
                        //  _dataUser.setKey({'key': Utility.FontColor, 'value': Utility.WhiteColor});
                        //  pref.setString(Utility.DarkMode,"true");
                        //   _dataUser.setKey({'key': Utility.DarkMode, 'value': "true"});

                        // setState(() {

                        // });

                      } else {
                        changenotifcation("0");
                      }
                    },
                    activeColor: CommnWidget.commonColor),
                Text(
                  "تفعيل التنبيهات",
                  style: TextStyle(
                      fontFamily: "thin", fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[500],
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
          ),
          Container(
              margin: EdgeInsets.only(right: 25),
              child: Text(
                " الاعدادت العامة",
                style: TextStyle(
                    color: Colors.black, fontFamily: "black", fontSize: 15),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              commnRow(
                  "شروط الاستخدام",
                  AboutUsPage(
                    tittel: "شروط الاستخدام",
                    check: 1,
                  )),
              commnRow(
                  "سياسة الخصوصية",
                  AboutUsPage(
                    tittel: "سياسة الخصوصية",
                    check: 2,
                  )),
              InkWell(
                onTap: () {
                 Share.share("https://play.google.com/store/apps/details?id=event.katab.com.events");
                },
                child: Container(
                  margin: EdgeInsets.only(right: 40, left: 28),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 18,
                          ),
                          onPressed: () {
      Share.share("https://play.google.com/store/apps/details?id=event.katab.com.events");


                          }),
                      Text(
                        "شارك التطبيق",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: "thin",
                            fontSize: 13,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              //  commnRow("شارك التطبيق",SearchPage()),
              commnRow("قيم التطبيق", Kayemeltatbek()),
              commnRow(
                  "حول التطبيق",
                  AboutUsPage(
                    tittel: "حول التطبيق",
                    check: 3,
                  )),
            widget.isloading==false?Container():       commnRow("اتصل بنا", ContactUsPage()),
          widget.isloading==false?Container():      InkWell(
      onTap: () async {
  SharedPreferences pref = await SharedPreferences.getInstance();
         pref.clear();
         Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) {
        return LoginPage();
      }), (Route<dynamic> route) => false);
      },
      child: Container(
        margin: EdgeInsets.only(right: 40, left: 28),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
                onPressed: () {}),
            Text(
              "تسجيل الخروج",
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontFamily: "thin", fontSize: 13, color: Colors.black),
            ),
          ],
        ),
      ),
    )
           
            ],
          )
        ],
      ),
    ));
  }

  Widget commnRow(String txt, Widget destination) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return destination;
        }));
      },
      child: Container(
        margin: EdgeInsets.only(right: 40, left: 28),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
                onPressed: () {}),
            Text(
              txt,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontFamily: "thin", fontSize: 13, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  void changenotifcation(String s) {
    setState(() {
      _isLoading = true;
    });

    //_goodleToken

    _apiRequests.changenotify(s).then((value) {
      if (value != null) {
        if (value) {
          CommnWidget.showErrorDialog(
              "حسنا", "تم تغيير حالة الاشعاراات الخاصة بك", DialogType.SUCCES, context);
          setState(() {
            _isLoading = false;
          });
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
