
import 'package:dailyevent/tasnefatDetails%20(1).dart';
import 'package:dailyevent/widget%20(1)/NotifcationCell%20(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'Commnwidget (1).dart';
import 'helper (1)/ApiRequests (1).dart';
import 'helper (1)/Models (1)/NotifcationModel (1).dart';
import 'helper (1)/Models (1)/eventEventModel (1).dart';

class NotifcationPage extends StatefulWidget {
  @override
  _NotifcationPageState createState() => _NotifcationPageState();
}

class _NotifcationPageState extends State<NotifcationPage> {
  ApiRequests _apiRequests = new ApiRequests();
     final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

NotifcatinModel _data;
bool _isLoading =true;

List<dynamic> allNotifications = new List<dynamic>();

       getdata() {
    _apiRequests.getNotifcation().then((value) {
      print(value);
      setState(() {
        //
        _data = value;
        if(_data!=null){
         allNotifications = [...value.data.citynots, ...value.data.countrynots, ...value.data.eventnots,...value.data.usersnots];
    allNotifications.sort((a, b) => DateTime.tryParse(
      
      
  ( b is Eventnots)? b.not.createdAt.toString()  :b.createdAt.toString())
        ?.compareTo(DateTime.tryParse(( a is Eventnots)? a.not.createdAt.toString()  :a.createdAt.toString())));
        }
        _isLoading = false;
      });
    });
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    if (this.mounted) super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: CommnWidget.commonColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Center(
          child: Text(
            "الاشعارات",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontFamily: "black"),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],



      ),


      body: Container(width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: 20),
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
            : _data == null
                ? Center(
                    child: Text(
                    "تاكد من الاتصال بالانترنت",
                    style: TextStyle(
                      fontFamily: "black",
                    ),
                  ))
                : allNotifications.length == 0
                    ? Center(
                        child: Text(
                        "لا يوجد بيانات حتي الان",
                        style: TextStyle(
                          fontFamily: "black",
                        ),
                      ))
                    :  ListView.builder(
            itemCount: allNotifications.length,
              itemBuilder: (context, i){

                if(allNotifications[i] is Eventnots ){
      return _cell(allNotifications[i].not.title,allNotifications[i].not.body,0,allNotifications[i].event,allNotifications[i].not.id);
                }else if(allNotifications[i] is Citynots ){
     return _cell(allNotifications[i].title,allNotifications[i].body,1,null,allNotifications[i].id);
                }else if (allNotifications[i] is Countrynots){
          return _cell(allNotifications[i].title,allNotifications[i].body,1,null,allNotifications[i].id);
                }else if(allNotifications[i] is Usersnots){
     return _cell(allNotifications[i].title,allNotifications[i].body,1,null,allNotifications[i].id);
                }
      
            
              },
          ),),
    );
  }

  _cell(String title, String body, int i, EventModel event, int id){
    return Slidable(
               actionPane: SlidableDrawerActionPane(),
  // actionExtentRatio: 0.25,
                actions: <Widget>[
  IconSlideAction(closeOnTap: true,onTap: (){
                                _apiRequests.deletenotifcation(id.toString()).then((value){
if(value==null){
  CommnWidget.showInSnackBar("تاكد من الاتصال بالانترنت", CommnWidget.commonColor, _scaffoldKey);
}else{
  if(value){
  CommnWidget.showInSnackBar("تم مسح الاشعار بنجاح", CommnWidget.commonColor, _scaffoldKey);
  setState(() {
            _isLoading = true;
  });
   allNotifications.clear();
  getdata();
  }else{
     CommnWidget.showInSnackBar("يوجد خطا ما", CommnWidget.commonColor, _scaffoldKey);
  }
}
                            });
  },
iconWidget: 
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
                        child:Icon(
                  Icons.delete,
                  color:Colors.red,
                  size: 30,
                )),
  )
  ],
              
              child: InkWell(
                
                onTap: (){
                  if(i==0){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return TasnefatDetails(
                                    data:  event,




                                  );
                                }));
                  }
                                
                },
                
                child: NotifcationCell(nottittel: title.toString(),notDetails:body.toString())));
            
            
  }
}
