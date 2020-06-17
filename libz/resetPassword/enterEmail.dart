import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:events/Commnwidget.dart';
import 'package:events/helper/ApiRequests.dart';
import 'package:events/resetPassword/verficationcode2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetEmail extends StatefulWidget {
  @override
  _ResetEmailState createState() => _ResetEmailState();
}

class _ResetEmailState extends State<ResetEmail> {
  String email;
  bool _isLoading = false;
  ApiRequests _apiRequests = new ApiRequests();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150,
                ),
                Image.asset(
                  "assets/logo.png",
                  width: MediaQuery.of(context).size.width >= 400
                      ? 400 * .4
                      : MediaQuery.of(context).size.width * .4,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "ادخل   رقم الموبايل الذي استخدمته لانشاء حسابك",
                    style: TextStyle(
                      fontFamily: "black",
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                          return "رجاء ادخل  رقم الموبايل";
                        }
                     
                      },
                      textAlign: TextAlign.right,
                      decoration: CommnWidget.commnInputDecoration(
                          "البريد الاكتروني / رقم الجوال",
                          Icon(
                            Icons.alternate_email,
                            color: Colors.grey[500],
                          ),
                          Text("+966",style: TextStyle(color: CommnWidget.commonColor,fontFamily: "black"),))),
                ),
                SizedBox(
                  height: 20,
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
                        : CommnWidget.commnbtn("ارسال", context)),
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

      //_goodleToken

      print(email);
      _apiRequests.sendEmail("+966"+email).then((value) {
        if (value != null) {
          if (value) {
            // Navigator.push(context,
            //                         MaterialPageRoute(builder: (context) {
            //                       return BottomNavigationsBar();
            //                     }));
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
                  return VerviedCodePage2(email: email,);
                }), (Route<dynamic> route) => false);
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
