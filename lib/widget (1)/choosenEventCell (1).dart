import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyevent/helper%20(1)/data%20(1).dart';
import 'package:dailyevent/helper%20(1)/dataUser%20(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../Commnwidget (1).dart';

class ChoosenEventCell extends StatelessWidget {
  final String name;
  final String image;
  final   DateTime day;
  final String location;
  final String time;
  final int views;
    DataUser _dataUser = DataUser.instance;
  final DateTime lastdate;
  ChoosenEventCell({this.name, this.day, this.image, this.location,this.time,this.lastdate,this.views});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              // margin: EdgeInsets.only(bottom: 8),
              child: GridTile(
                child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(

            children: <Widget>[
              CachedNetworkImage(
                  imageUrl: this.image.toString(),
                  placeholder: (context, url) => Center(
                        child: CupertinoActivityIndicator(
                          radius: 17,
                          animating: true,
                        ),
                      ),
                  fit: BoxFit.fill,
                  // height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width,
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: Colors.black)),
                      Container(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                             Container(
                              color: DateTime.now().isBefore(this.day)?Colors.blue: this.lastdate.isBefore(DateTime.now())?Colors.red:Colors.green,
                              // height: 30,
                              padding: EdgeInsets.only(right: 12,left: 12),
                              child: Text( DateTime.now().isBefore(this.day)?"   لم تبدا بعد   ": this.lastdate.isBefore(DateTime.now())?"   انتهت   ":"   لقد بدات   " ,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontFamily: "black",fontSize: 12))),
                            Container(
                              color: CommnWidget.commonColor,
                              padding: EdgeInsets.only(right: 12,left: 12),
                              child: Text( "   "+this.name+"   ".toString(),style: TextStyle(color: Colors.white,fontFamily: "black"))),
                          ],
                        ),
                      )
            ],
          ),
                ),
                footer: Stack(
          children: <Widget>[
                Opacity(
              opacity: .5,
              child: Container(
                color: Colors.grey[500],
                width:MediaQuery.of(context).size.width ,
                height: 30
            
              )),
            Container(
height: 30,
              child: Row(  
                 mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                  
                    children: <Widget>[
                       Text(
                        this.views==null? "0":""+this.views.toString()+ "",    textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        
                        style: TextStyle(color: Colors.white,fontFamily: "black",fontSize: 12,),
                      ), SizedBox(width:3,),
                       Icon(Icons.visibility,color: Colors.white,size: 15,),
                        SizedBox(width: 9,),
                 InkWell(

                 onTap: (){
                     Share.share(' من ${ _dataUser.getKey(Name)??'زائر'} يتشرف تطبيق دايلي ايفنت بدعوه سيادتك لحضور لحضور فعالية ${this.name} و ذلك ف اليوم ${this.day.day.toString()+"-"+this.day.month.toString()+"-"+this.day.year.toString()} \n https://play.google.com/store/apps/details?id=event.katab.com.events3 ');
                 },
                                  child: Text(
                        "مشاركة",    textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white,fontFamily: "black",fontSize: 12),
                      ),
                 ),
                        InkWell(
                          onTap: (){
                     Share.share(' من ${ _dataUser.getKey(Name)??'زائر'} يتشرف تطبيق دايلي ايفنت بدعوه سيادتك لحضور لحضور فعالية ${this.name} و ذلك ف اليوم ${this.day.day.toString()+"-"+this.day.month.toString()+"-"+this.day.year.toString()} \n https://play.google.com/store/apps/details?id=event.katab.com.events3 ');
                          },
                          child: Icon(Icons.share,color: Colors.white,size: 15,)),
                        SizedBox(width: 9,),
                    Container(
                      width: 60,
                      child: Text(
                       this.location.toString()=="null"?"-":      this.location.toString(),
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white,fontFamily: "black",fontSize: 12),
                      ),
                    ),
                        Icon(Icons.location_on,color: Colors.white,size: 15,),      SizedBox(width: 9,),
                             Text(
                       this.time,    textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white,fontFamily: "black",fontSize: 12),
                      ),
                        Icon(Icons.timer,color: Colors.white,size: 15,),      SizedBox(width: 9,),
                      Text(
                        this.day.day.toString()+"-"+this.day.month.toString()+"-"+this.day.year.toString(),    textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white,fontFamily: "black",fontSize: 12),
                      ),
                        Icon(Icons.calendar_today,color: Colors.white,size: 15,),      SizedBox(width: 9,),
                   
                    ],
                  ),
            ),
          ],
                ),
              ),
            ),
        ),
     
     SizedBox(height: 8), ],
    );
  }
}
