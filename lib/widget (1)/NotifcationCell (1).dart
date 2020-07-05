import 'package:flutter/material.dart';

import '../Commnwidget (1).dart';

class NotifcationCell extends StatelessWidget {
  final String nottittel;
  final String notDetails;
  NotifcationCell({this.notDetails,this.nottittel});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 10),
      margin: EdgeInsets.only(right: 20,left: 20,bottom: 8),
      // height: MediaQuery.of(context).size.height*.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: CommnWidget.commonColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * .55,
                  child: Text(
                    this.nottittel,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontFamily: "black",height: 1.5),
                  )),
                  Container(
                  width: MediaQuery.of(context).size.width * .55,
                  child: Text(
                    this.notDetails,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontFamily: "thin",height: 1.5),
                  )),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Container(
                      padding: EdgeInsets.all(8),
                     
                      decoration: BoxDecoration(
                         color:  Colors.white,
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(50.0)),
                        border: new Border.all(
                          color: CommnWidget.commonColor,
                          width: 1,
                        ),
                      ),
                      child: Icon(
                Icons.notifications,
                color: CommnWidget.commonColor,
                size: 30,
              ))
    
        ],
      ),
    );
  }
}
