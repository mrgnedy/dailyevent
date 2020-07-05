
import 'package:dailyevent/NavgationBotoom/navgationBottomBar.dart';
import 'package:flutter/material.dart';

import '../Commnwidget.dart';



class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/succes.png"))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/logo.png",
                width: MediaQuery.of(context).size.width >= 400
                    ? 400 * .4
                    : MediaQuery.of(context).size.width * .4,
              ),
              SizedBox(height: 50),
              Text("تهانينا",
                  style: TextStyle(
                      color: Colors.black, fontFamily: "black", fontSize: 20)),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50),
                child: Text(
                    "لقد تم انشاء حسابك بنجاح تستطيع الان اكتشاف كافة الفعاليات والاحداث و مشاركتها مع اصدقائك",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey[700],
                        height: 1.5,
                        fontFamily: "thin",
                        fontSize: 14)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              InkWell(
                
                 onTap: (){
                 
                                        Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
                  return BottomNavigationsBar();
                }), (Route<dynamic> route) => false);
                        },
                child: CommnWidget.commnbtn("الذهاب الي الرئيسية", context)),
            ],
          ),
        ),
      ),
    );
  }
}
