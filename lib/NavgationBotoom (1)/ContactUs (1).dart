import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dailyevent/helper%20(1)/ApiRequests%20(1).dart';
import 'package:dailyevent/helper%20(1)/localNotifcation%20(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Commnwidget (1).dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  GlobalKey<ScaffoldState> _scaffoldKeycontactUs = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String message;
  bool _isLoading = false;
  ApiRequests _apiRequests = new ApiRequests();
  NotifcationClss _notifcationClss = new NotifcationClss();
  @override
  void initState() {
    super.initState();
    _notifcationClss.initalvalues(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeycontactUs,
      backgroundColor: Colors.white,
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: CommnWidget.commonColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Center(
          child: Text(
            "اتصل بنا",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontFamily: "black"),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 12, left: 12, top: 30),
                  child: TextFormField(
                      maxLines: 10,
                      // minLines: 1,
                      maxLength: 150,
                      textAlign: TextAlign.right,
                      onSaved: (value) {
                        setState(() {
                          message = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "رجاء ادخل رسالتك";
                        }
                      },
                      decoration: new InputDecoration(
                        hintText: "اكتب رسالتك هنا ",
                        hintStyle: TextStyle(
                          fontFamily: "thin",
                          color: Colors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: CommnWidget.commonColor, width: 1.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: CommnWidget.commonColor, width: 1.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      )),
                ),
                SizedBox(
                  height: 40,
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
                        : CommnWidget.commnbtn("إرسال", context)),
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
      print(message);
      setState(() {
        _isLoading = true;
      });

      //_goodleToken

      _apiRequests.contactus(message).then((value) {
        if (value != null) {
          if (value) {
            CommnWidget.showErrorDialog(
                "حسنا", "تم ارسال رسالتك بنجاح", DialogType.SUCCES, context);
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
} /** */
