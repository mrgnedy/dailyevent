import 'package:events/Commnwidget.dart';
import 'package:events/helper/ApiRequests.dart';
import 'package:events/helper/Models/NotifcationModel.dart';
import 'package:events/tasnefatDetails.dart';
import 'package:events/widget/NotifcationCell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotifcationPage extends StatefulWidget {
  @override
  _NotifcationPageState createState() => _NotifcationPageState();
}

class _NotifcationPageState extends State<NotifcationPage> {
  ApiRequests _apiRequests = new ApiRequests();
     final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

NotifcatinModel _data;
bool _isLoading =true;
       getdata() {
    _apiRequests.getNotifcation().then((value) {
      print(value);
      setState(() {
        _data = value;
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
                : _data.data.length == 0
                    ? Center(
                        child: Text(
                        "لا يوجد بيانات حتي الان",
                        style: TextStyle(
                          fontFamily: "black",
                        ),
                      ))
                    :  ListView.builder(
            itemCount: _data.data.length,
              itemBuilder: (context, i){
            return Slidable(
               actionPane: SlidableDrawerActionPane(),
  // actionExtentRatio: 0.25,
                actions: <Widget>[
  IconSlideAction(closeOnTap: true,onTap: (){
                                _apiRequests.deletenotifcation(_data.data[i].not.id.toString()).then((value){
if(value==null){
  CommnWidget.showInSnackBar("تاكد من الاتصال بالانترنت", CommnWidget.commonColor, _scaffoldKey);
}else{
  if(value){
  CommnWidget.showInSnackBar("تم مسح الاشعار بنجاح", CommnWidget.commonColor, _scaffoldKey);
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return TasnefatDetails(
                                    data:  _data.data[i].event[i],




                                  );
                                }));
                },
                
                child: NotifcationCell(nottittel: _data.data[i].not.title,notDetails: _data.data[i].not.body,)));
              },
          ),),
    );
  }
}
