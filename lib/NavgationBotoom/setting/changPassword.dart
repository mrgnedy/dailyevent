import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dailyevent/helper/ApiRequests.dart';
import 'package:dailyevent/helper/localNotifcation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Commnwidget.dart';
import '../navgationBottomBar.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  // String password1;
   String password2;
    String password3;
      bool _isLoading =false;
  final _formKey = GlobalKey<FormState>();
     NotifcationClss _notifcationClss = new NotifcationClss();
     ApiRequests _apiRequests = new ApiRequests();
  @override
  void initState() {
    super.initState();
    _notifcationClss.initalvalues(context);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: CommnWidget.commonColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Center(
          child: Text(
            "تغيير كلمة المرور",
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
                SizedBox(height: 25,),
                // Container(
                //   width: MediaQuery.of(context).size.width > 400
                //       ? 400 * .8
                //       : MediaQuery.of(context).size.width * .85,
                //   alignment: Alignment.centerRight,
                //   margin: EdgeInsets.only(top: 20),
                //   child: TextFormField(
                //       style: TextStyle(
                //           fontFamily: "thin",
                //           color: CommnWidget.commonColor,
                //           fontSize: 14),
                //       onSaved: (value) {
                //         password1 = value;
                //       },
                //       textAlign: TextAlign.right,
                //       // obscureText: hide,
                //       decoration: CommnWidget.commnInputDecoration(
                //           " كلمة المرور الحالية",
                //           Icon(Icons.lock),
                //           Icon(Icons.add,color: Colors.white),
                //           // IconButton(
                //           //   icon: hide
                //           //       ? Icon(
                //           //           Icons.visibility_off,
                //           //           color: Colors.grey[500],
                //           //         )
                //           //       : Icon(
                //           //           Icons.visibility,
                //           //           color: Colors.grey[500],
                //           //         ),
                //           //   onPressed: () {
                //           //     setState(() {
                //           //       hide = !hide;
                //           //     });
                //           //   },
                //           // )
                //           )),
                // ),
                  
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
                        password2 = value;
                      },
                                 validator: (value){
                        if(value.isEmpty){
                          return " رجاء ادخل كلمة المرور الجديدة";

                        }
                        if(value.length<6){
                          return "كلمة المرور قصيره جدا";
                        }
                      },
                      textAlign: TextAlign.right,
                      // obscureText: hide,
                      decoration: CommnWidget.commnInputDecoration(
                          " كلمة المرور الجديدة",
                          Icon(Icons.lock),
                          Icon(Icons.add,color: Colors.white),
                          // IconButton(
                          //   icon: hide
                          //       ? Icon(
                          //           Icons.visibility_off,
                          //           color: Colors.grey[500],
                          //         )
                          //       : Icon(
                          //           Icons.visibility,
                          //           color: Colors.grey[500],
                          //         ),
                          //   onPressed: () {
                          //     setState(() {
                          //       hide = !hide;
                          //     });
                          //   },
                          // )
                          )),
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
                        password3 = value;
                      },
                      textAlign: TextAlign.right,
                                 validator: (value){
                        if(value.isEmpty){
                          return "رجاء اعاده كلمة المرور";

                        }
                        if(value.length<6){
                          return "كلمة المرور قصيره جدا";
                        }
                      },
                      // obscureText: hide,
                      decoration: CommnWidget.commnInputDecoration(
                          " اعادة كلمة المرور الجديدة",
                          Icon(Icons.lock),
                          Icon(Icons.add,color: Colors.white),
                          // IconButton(
                          //   icon: hide
                          //       ? Icon(
                          //           Icons.visibility_off,
                          //           color: Colors.grey[500],
                          //         )
                          //       : Icon(
                          //           Icons.visibility,
                          //           color: Colors.grey[500],
                          //         ),
                          //   onPressed: () {
                          //     setState(() {
                          //       hide = !hide;
                          //     });
                          //   },
                          // )
                          )),
                ),
                SizedBox(height:80,),
             _isLoading?Center(
                         child: Container(
               margin: EdgeInsets.only(top:20),
               child: CupertinoActivityIndicator(
                              animating: true,
                              radius: 17,
                            ),
             ),
                       )   :    InkWell(
                  onTap: (){
valedate();
                  },
                  
                  child: CommnWidget.commnbtn("حفظ التغيير", context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
                    void valedate() {
                  
 if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      if(password2!=password3){
         CommnWidget.showErrorDialog("حدث خطأ ما","كلمة المرور غير متطابقة ", DialogType.ERROR, context);
      return ;
      }

      setState(() {
        _isLoading=true;
      });
        // firebaseCloudMessagingListeners();
        // print(_goodleToken);
  //_goodleToken


      _apiRequests.changepassword(password2).then((value){
     if(value!=null){
if(value){
        Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BottomNavigationsBar();
                            }));
  // Navigator.pushAndRemoveUntil(context,
  //     MaterialPageRoute(builder: (context) {
  //       return HomePage();
  //     }), (Route<dynamic> route) => false);
}else{
    CommnWidget.showErrorDialog("حدث خطأ ما","هذه المعلومات خاطئة", DialogType.ERROR, context);
     setState(() {
        _isLoading=false;
      });
}
     }else{
      CommnWidget.showErrorDialog("حدث خطأ ما", "تاكد من الاتصال بالانترنت", DialogType.WARNING, context);
   setState(() {
        _isLoading=false;
      });
     }
      });

      
      }
      
      }

}
