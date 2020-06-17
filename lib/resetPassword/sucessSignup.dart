// import 'package:events/Commnwidget.dart';
// import 'package:events/NavgationBotoom/navgationBottomBar.dart';
// import 'package:flutter/material.dart';
// class SeccesSignup extends StatefulWidget {
//   @override
//   _SeccesSignupState createState() => _SeccesSignupState();
// }

// class _SeccesSignupState extends State<SeccesSignup> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
// width: MediaQuery.of(context).size.width,
// height: MediaQuery.of(context).size.height,
// decoration: BoxDecoration(
//   image: DecorationImage(image: AssetImage("assets/sucess.png"))
// ),
// child: SingleChildScrollView(
//   child:   Column(children: <Widget>[
  
//    Text("تهانينا",
  
//                     style: TextStyle(
  
//                         color: Colors.black, fontFamily: "black", fontSize: 20)),
  
//                               Padding(
  
//                   padding: const EdgeInsets.only(right: 50, left: 50),
  
//                   child: Text(
  
//                       "لقد تم انشاء حسابك بنجاح تستطيع الان اكتشاف كافة الفاعليات والاحداث و مشاركتها مع اصدقائك",
  
//                       textAlign: TextAlign.center,
  
//                       style: TextStyle(
  
//                           color: Colors.grey[700],
  
//                           height: 1.5,
  
//                           fontFamily: "thin",
  
//                           fontSize: 14)),
  
//                 ),
  
//                 SizedBox(
  
//                   height: MediaQuery.of(context).size.height * .2,
  
//                 ),
  
//                 InkWell(
  
                  
  
//                    onTap: (){
  
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) {
//                               return BottomNavigationsBar();
//                             }));
  
//                           },
  
//                   child: CommnWidget.commnbtn("الذهاب الي الرئيسية", context)),
  
  
  
//   ],),
// ),

//       ),
      
//     );
//   }
// }