import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:events/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommnWidget{
static Color  commonColor = Colors.teal[500];

//GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
static void showInSnackBar(String value,Color color,GlobalKey<ScaffoldState> _scaffoldKey) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        behavior: SnackBarBehavior.fixed,
        backgroundColor:commonColor,
        content: new Text(
          value,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'black',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  static void showInSnackBar2(String value,Color color,GlobalKey<ScaffoldState> _scaffoldKey,BuildContext context) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        behavior: SnackBarBehavior.fixed,
        backgroundColor:commonColor,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
                 InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                       return LoginPage();
                     }));
                   },
                                    child: Card(color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8,left: 8),
                                  child: Text(
                "تسجيل الدخول",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'black',
                    color:CommnWidget.commonColor,
                ),
            ),
                                ),
              ),
                 ),
            new Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: 'black',
                color: Colors.white,
              ),
            ),
         
          ],
        ),
      ),
    );
  }
static Widget commnbtn(String txt,BuildContext context){
  return Container(
       margin: EdgeInsets.all(12),
       padding: EdgeInsets.only(top: 5,bottom: 5),
       width: MediaQuery.of(context).size.width>400?400*.8:MediaQuery.of(context).size.width*.85,
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
       color: CommnWidget.commonColor
       ),
      //  height: MediaQuery.of(context).size.height*.2,
     
       child: Text(txt,textAlign: TextAlign.center,style: TextStyle(fontFamily: "thin",color: Colors.white,fontSize: 15),),
    
     ) ;
}
static Widget cirvleicon(Icon icon,Color color){
  return   Container(
                      padding: EdgeInsets.all(12),
                     
                      decoration: BoxDecoration(
                         color: color,
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(50.0)),
                        border: new Border.all(
                          color: CommnWidget.commonColor,
                          width: 1,
                        ),
                      ),
                      child:icon);
}
  static void showErrorDialog(
      String tittel, String message, DialogType type, BuildContext contextc) {
    AwesomeDialog(
      context: contextc,
      dialogType: type,
      animType: AnimType.BOTTOMSLIDE,
      tittle: tittel,
      body: Column(
        children: <Widget>[
          Text(tittel,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "black",
                  fontSize: 20)),
          Text(message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "thin",
                  fontSize: 16)),
          GestureDetector(
            onTap: () {
              Navigator.of(contextc).pop();
            },
            child: Container(
              width: 120,
              height: 50,
              margin: EdgeInsets.only(top: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Text(
                "ok",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "black",
                    fontSize: 18),
              ),
            ),
          )
        ],
      ),
      desc: message,
    ).show();
  }
static InputDecoration commnInputDecoration(String hint,Widget syffixIcon,Widget prefixxIcon){
  return  InputDecoration(

                            
                              focusedBorder: OutlineInputBorder(
                                
                                borderSide:  BorderSide(
                                    color:CommnWidget.commonColor, width: 2.0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding:  EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: new BorderSide(color: Colors.grey)),
                              hintText: hint,
                              
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 12,height: 1.5),
                             suffixIcon: syffixIcon!=null?syffixIcon:Container(),
                             prefixIcon: prefixxIcon!=null?prefixxIcon:Container()

                                
                         ) ;
}

}