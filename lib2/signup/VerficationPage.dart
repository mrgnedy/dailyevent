import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dailyevent/helper/ApiRequests.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../Commnwidget.dart';
import 'SuccesPage.dart';

class VerviedCodePage3 extends StatefulWidget {
  // final String email;
  // VerviedCodePage2();

  @override
  _VerviedCodePage3State createState() => _VerviedCodePage3State();
}

class _VerviedCodePage3State extends State<VerviedCodePage3> {

  bool _isLoading = false;
  ApiRequests _apiRequests = new ApiRequests();
  final _formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    _pinEditingController.addListener(() {
      debugPrint('changed pin:${_pinEditingController.text}');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        key: _scaffoldKey,
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
                    "التخقق من رقمك",
                    style: TextStyle(
                      fontFamily: "black",
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "تم ادخال كود من 4 خانات علي رقم هاتفك المحمول الرجاء ادخل رمز التحقق",
                    style: TextStyle(
                      fontFamily: "black",
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                // codeTextField(),
                  Container(
                    margin: const EdgeInsets.only(right: 50, left: 50),
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                    child: PinInputTextField(
                      pinLength: _pinLength,
                      decoration: _pinDecoration,
                      pinEditingController: _pinEditingController,
                      autoFocus: true,
                      textInputAction: TextInputAction.go,
                      enabled: _enable,
                      
                      onSubmit: (pin) {
                        debugPrint('submit pin:$pin');
                        print("hhhhh" + pin);
                      },
                    ),
                  ), 
                // Container(
                //   width: MediaQuery.of(context).size.width > 400
                //       ? 400 * .8
                //       : MediaQuery.of(context).size.width * .85,
                //   child: TextFormField(
                //       style: TextStyle(
                //           fontFamily: "thin",
                //           color: CommnWidget.commonColor,
                //           fontSize: 14),
                //       onSaved: (value) {
                //         email = value;
                //       },
                //       validator: (value) {
                //         if (value.isEmpty) {
                //           return "رجاء ادخل  رقم الموبايل";
                //         }
                     
                //       },
                //       textAlign: TextAlign.right,
                //       decoration: CommnWidget.commnInputDecoration(
                //           "البريد الاكتروني / رقم الجوال",
                //           Icon(
                //             Icons.alternate_email,
                //             color: Colors.grey[500],
                //           ),
                //           Icon(
                //             Icons.add,
                //             color: Colors.white,
                //           ))),
                // ),
                
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   _isLoading?Center(
                         child: Container(
               margin: EdgeInsets.only(top:20),
               child: CupertinoActivityIndicator(
                              animating: true,
                              radius: 17,
                            ),
             ),
                       )   :     InkWell(

                    onTap: (){
                           valdate2();
                    },
                                      child: Container(
       margin: EdgeInsets.all(12),
       padding: EdgeInsets.only(top: 5,bottom: 5),
       width: MediaQuery.of(context).size.width*.4,
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
       color: Colors.white,
       border: Border.all(color:CommnWidget.commonColor,width: 1 )
       
       ),
      //  height: MediaQuery.of(context).size.height*.2,
     
       child: Text("إعادة ارسال",textAlign: TextAlign.center,style: TextStyle(fontFamily: "thin",color: CommnWidget.commonColor,fontSize: 15),),
    
     ),
                  ) 
 ,
 
 
    _isLoading?Center(
                         child: Container(
               margin: EdgeInsets.only(top:20),
               child: CupertinoActivityIndicator(
                              animating: true,
                              radius: 17,
                            ),
             ),
                       )   :   InkWell(
   onTap: (){
     valdate();
   },
    child: Container(
         margin: EdgeInsets.all(12),
         padding: EdgeInsets.only(top: 5,bottom: 5),
         width: MediaQuery.of(context).size.width*.4,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
         color: CommnWidget.commonColor
         
         ),
        //  height: MediaQuery.of(context).size.height*.2,
       
         child: Text(" ارسال",textAlign: TextAlign.center,style: TextStyle(fontFamily: "thin",color: Colors.white,fontSize: 15),),
      
       ),
 ) 



                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


 void valdate2() {
         setState(() {
        _isloading=true;
      });
      _apiRequests.resendverfiyedCode().then((value){
     if(value!=null){
if(value){

   CommnWidget.showInSnackBar(
            "  تم اعاده ارسال الرقم  ", CommnWidget.commonColor, _scaffoldKey);
               setState(() {
        _isloading=false;
      });
        return;
                
  // Navigator.pushAndRemoveUntil(context,
  //     MaterialPageRoute(builder: (context) {
  //       return NewPassword(email:widget.email);
  //     }), (Route<dynamic> route) => false);
}else{
    CommnWidget.showInSnackBar(
            "  الكود الذي ادخلته غير صحيح ", CommnWidget.commonColor, _scaffoldKey);
               setState(() {
        _isloading=false;
      });
        return;
}
     }else{
      CommnWidget.showInSnackBar(
            "  تاكد من الاتصال بالانترنت", CommnWidget.commonColor, _scaffoldKey);
      
   setState(() {
        _isloading=false;
      });  return;
     }
      });


  }

 void valdate() {
if(_pinEditingController.text.length!=4)
{
   CommnWidget.showInSnackBar(
            "رجاء ادخل  كود التحقيق", CommnWidget.commonColor, _scaffoldKey);
        return;
}
      setState(() {
        _isloading=true;
      });
      _apiRequests.sendverfiyedCode( _pinEditingController.text).then((value){
     if(value!=null){
if(value){


                               Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
                  return SuccessPage();
                }), (Route<dynamic> route) => false);
  // Navigator.pushAndRemoveUntil(context,
  //     MaterialPageRoute(builder: (context) {
  //       return NewPassword(email:widget.email);
  //     }), (Route<dynamic> route) => false);
}else{
    CommnWidget.showInSnackBar(
            "  الكود الذي ادخلته غير صحيح ", CommnWidget.commonColor, _scaffoldKey);
               setState(() {
        _isloading=false;
      });
        return;
}
     }else{
      CommnWidget.showInSnackBar(
            "  تاكد من الاتصال بالانترنت", CommnWidget.commonColor, _scaffoldKey);
      
   setState(() {
        _isloading=false;
      });  return;
     }
      });


  }
 
  static final int _pinLength = 4;
    PinEditingController _pinEditingController =
      PinEditingController(pinLength: _pinLength, autoDispose: false);
        bool _enable = true;
        bool _isloading = false;
          static final TextStyle _textStyle = TextStyle(
    color: CommnWidget.commonColor,
    fontSize: 20,
  );
    PinDecoration _pinDecoration = UnderlineDecoration(
      textStyle: _textStyle,
      enteredColor:  CommnWidget.commonColor,
      color:  CommnWidget.commonColor);


  
}
