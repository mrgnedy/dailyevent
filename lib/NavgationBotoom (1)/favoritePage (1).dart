
import 'package:dailyevent/helper%20(1)/ApiRequests%20(1).dart';
import 'package:dailyevent/helper%20(1)/Models%20(1)/FavouriteModel%20(1).dart';
import 'package:dailyevent/helper%20(1)/data%20(1).dart';
import 'package:dailyevent/helper%20(1)/localNotifcation%20(1).dart';
import 'package:dailyevent/widget%20(1)/choosenEventCell%20(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../Commnwidget (1).dart';
import '../loginPage (1).dart';
import '../tasnefatDetails (1).dart';

class FavoritePage extends StatefulWidget {
  
  final bool isloading ;
  FavoritePage({this.isloading});
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool _isLoading = true;
  FavouriteMocel _data;
  ApiRequests _apiRequests = new ApiRequests();

  getdata() {
    _apiRequests.getfavorite().then((value) {
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
 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 NotifcationClss _notifcationClss = new NotifcationClss();
  @override
  void initState() {
    super.initState();
    if(widget.isloading!=false){
  _notifcationClss.initalvalues(context);
    // TODO: implement initState
    getdata();
    }
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "قائمة المفضلة",
            style:
                TextStyle(color: CommnWidget.commonColor, fontFamily: "black"),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: widget.isloading==false?Align(
          alignment: Alignment.center,
          child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


Text("رجاء تسجيل الدخول اولا",style: TextStyle(fontFamily: "black",fontSize: 20),),
InkWell(
  
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LoginPage();
    }));
  },
  child: CommnWidget.commnbtn("تسجيل الدخول", context))

            ],),
                      ),
          )):
        
        
        
        
        _isLoading
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
                    : ListView.builder(
                        itemCount: _data.data.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TasnefatDetails();
                              }));
                            },
                            child: Slidable(
                                actionPane: SlidableDrawerActionPane(),
                                // actionExtentRatio: 0.25,
                                actions: <Widget>[
                                  IconSlideAction(
                                    closeOnTap: true,
                                      
                                          
                                    iconWidget: InkWell(
                                          onTap: (){
                                                       setState(() {
                                        _isLoading=true;
                                      });
                                                                      _apiRequests.geletefavorite (_data.data[i].id.toString()).then((value){
if(value==null){
  CommnWidget.showInSnackBar("تاكد من الاتصال بالانترنت", CommnWidget.commonColor, _scaffoldKey);
}else{
  if(value){
  CommnWidget.showInSnackBar("تم حذف هذه الفعالية من المفضلة", CommnWidget.commonColor, _scaffoldKey);
  
  getdata();
  }else{
     CommnWidget.showInSnackBar("هذه الفعالية محذوفة  سابقا ", CommnWidget.commonColor, _scaffoldKey);
  }
}
                            });
                                      },

                                                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: CommnWidget.commonColor,
                                              borderRadius: new BorderRadius.all(
                                                  new Radius.circular(50.0)),
                                              border: new Border.all(
                                                color: CommnWidget.commonColor,
                                                width: 1,
                                              ),
                                            ),
                                            child:  Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                            ),
                                    ),
                                  )
                                ],
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return TasnefatDetails(
                                        data: _data.data[i],
                                      );
                                    }));
                                  },
                                  child: ChoosenEventCell(
                                    views:_data.data[i].views ,
                                    image: IMAGEURL +
                                        _data.data[i].image.toString(),
                                    day: DateTime.parse(_data.data[i].startDate
                                                .toString())
                                          
                                    ,
                                    name: _data.data[i].name.toString(),
                                    time: DateTime.parse("2020-03-26 " +
                                            _data.data[i].startTime.toString())
                                        .hour
                                        .toString(),
                                    location: _data.data[i].city.toString(),
                                     lastdate:DateTime.parse( _data.data[i].endDate.toString()) 

                                  ),
                                )),
                          );
                        },
                      ),
      ),
    );
  }
}
