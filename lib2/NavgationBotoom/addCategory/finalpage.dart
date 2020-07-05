import 'package:dailyevent/helper/localNotifcation.dart';
import 'package:flutter/material.dart';

import '../../Commnwidget.dart';
import '../navgationBottomBar.dart';

class FinalPage extends StatefulWidget {
  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
   NotifcationClss _notifcationClss = new NotifcationClss();
  @override
  void initState() {
    super.initState();
    _notifcationClss.initalvalues(context);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/check.png",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              Text(
                "تهانينا",
                style: TextStyle(fontFamily: "black", fontSize: 20),
              ),
              Text(
                "لقد تم تسجيل فعاليتك بنجاح",
                style: TextStyle(fontFamily: "thin", fontSize: 15, height: 1.5),
              ),
              Text(
                "ملاحظة : لا يتم نشر الفعالية الا بعد موافقة المسئول",
                style: TextStyle(fontFamily: "thin", fontSize: 15),
              ),
              SizedBox(height: 50,),
              InkWell(
                
                onTap: (){
                        Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
                  return BottomNavigationsBar();
                }), (Route<dynamic> route) => false);
                },
                
                
                
                child: CommnWidget.commnbtn("العودة الي الصفحة الرئيسية", context))
            ],
          ),
        ),
      ),
    );
  }
}
