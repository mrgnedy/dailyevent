import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Commnwidget (1).dart';
import 'MapPage (1).dart';
import 'helper (1)/ApiRequests (1).dart';
import 'helper (1)/Models (1)/eventEventModel (1).dart';
import 'helper (1)/data (1).dart';
import 'helper (1)/dataUser (1).dart';
import 'helper (1)/localNotifcation (1).dart';


class TasnefatDetails extends StatefulWidget {
  final EventModel data;
  TasnefatDetails({this.data});
  @override
  _TasnefatDetailsState createState() => _TasnefatDetailsState();
}

class _TasnefatDetailsState extends State<TasnefatDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ApiRequests _apiRequests = new ApiRequests();  DataUser _dataUser = DataUser.instance;
  NotifcationClss _notifcationClss = new NotifcationClss();
  void showSnackDialog(BuildContext context, String text) {
    final snackBar =
        SnackBar(content: Text(text), behavior: SnackBarBehavior.floating);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    _apiRequests.viewEvent(widget.data.id.toString()).then((value){});
    _notifcationClss.initalvalues(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Center(
          child: Text(
            widget.data.name.toString(),
            textAlign: TextAlign.center,
            style:
                TextStyle(color: CommnWidget.commonColor, fontFamily: "black"),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: CommnWidget.commonColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: CachedNetworkImage(
                        imageUrl: IMAGEURL + widget.data.image.toString(),
                        placeholder: (context, url) => Center(
                              child: CupertinoActivityIndicator(
                                radius: 17,
                                animating: true,
                              ),
                            ),
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        // height: MediaQuery.of(context).size.height * .2,
                        // width: MediaQuery.of(context).size.width,
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error, color: Colors.black)),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          margin: EdgeInsets.only(top: 25, right: 15),
                          child: Text(
                            widget.data.name.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "thin",
                                fontWeight: FontWeight.bold),
                          ))),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 12, right: 15),
                child: Text(
                  " : نبذة",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "thin",
                  ),
                )),
            Container(
                margin: EdgeInsets.only(right: 15),
                child: Text(
                  widget.data.about,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.2,
                    color: Colors.grey[700],
                    fontFamily: "thin",
                  ),
                )),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[500],
              margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            ),
            Container(
                margin: EdgeInsets.only(right: 15),
                child: Text(
                  " : مواعيد الفعالية",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "thin",
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                      Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 20,left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "تاريخ النهاية",
                            // textAlign: TextAlign.right,
                            style: TextStyle(
                                color: CommnWidget.commonColor, fontFamily: "black"),
                          ),
                          Icon(
                            Icons.calendar_today,
                            color: CommnWidget.commonColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                
                  Container(
                margin: EdgeInsets.only(right: 30,left: 30),
                child: Text(
                  widget.data.endDate.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.2,
                    color: Colors.grey[700],
                    fontFamily: "thin",
                  ),
                )),
            Container(
                                   margin: EdgeInsets.only(right: 20,left: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "  وقت النهاية  ",
                    // textAlign: TextAlign.right,
                    style: TextStyle(
                        color: CommnWidget.commonColor, fontFamily: "black"),
                  ),
                  Icon(
                    Icons.access_time,
                    color: CommnWidget.commonColor,
                    size: 20,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 30,left: 30),
                child: Text(
                  widget.data.endTime.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.2,
                    color: Colors.grey[700],
                    fontFamily: "thin",
                  ),
                )),
              ],
                ),
          
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            " تايخ البداية ",
                            // textAlign: TextAlign.right,
                            style: TextStyle(
                                color: CommnWidget.commonColor, fontFamily: "black"),
                          ),
                          Icon(
                            Icons.calendar_today,
                            color: CommnWidget.commonColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                
                  Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  widget.data.startDate.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.2,
                    color: Colors.grey[700],
                    fontFamily: "thin",
                  ),
                )),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "  وقت البداية  ",
                    // textAlign: TextAlign.right,
                    style: TextStyle(
                        color: CommnWidget.commonColor, fontFamily: "black"),
                  ),
                  Icon(
                    Icons.access_time,
                    color: CommnWidget.commonColor,
                    size: 20,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  widget.data.startTime.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.2,
                    color: Colors.grey[700],
                    fontFamily: "thin",
                  ),
                )),
              ],
                ),
          
          
          
           ],
            ),
           
          
          
          
          
          
          
          
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[500],
              margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            ),
            Container(
                margin: EdgeInsets.only(right: 25),
                child: Text(
                  " : بيانات التواصل",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "thin",
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () async {
                    var telephoneUrl =
                        "tel://${widget.data.telephone.toString()}";
                    if (await canLaunch(telephoneUrl)) {
                      launch(telephoneUrl);
                    } else {
                      showSnackDialog(context, "error");
                    }
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "    رقم الهاتف الارضي   ",
                              style: TextStyle(
                                  color: CommnWidget.commonColor,
                                  fontFamily: "black"),
                            ),
                            Icon(
                              Icons.local_phone,
                              color: CommnWidget.commonColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Text(
                            widget.data.telephone.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.2,
                              color: Colors.grey[700],
                              fontFamily: "thin",
                            ),
                          )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var telephoneUrl = "tel://${widget.data.phone.toString()}";
                    if (await canLaunch(telephoneUrl)) {
                      launch(telephoneUrl);
                    } else {
                      showSnackDialog(context, "error");
                    }
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "    رقم التواصل   ",
                              style: TextStyle(
                                  color: CommnWidget.commonColor,
                                  fontFamily: "black"),
                            ),
                            Icon(
                              Icons.phone_android,
                              color: CommnWidget.commonColor,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Text(
                            widget.data.phone.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.2,
                              color: Colors.grey[700],
                              fontFamily: "thin",
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[500],
              margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            ),
            Container(
                margin: EdgeInsets.only(right: 25),
                child: Text(
                  " :  منظم الفعالية",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "thin",
                  ),
                )),
            Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  widget.data.ownerName.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.2,
                    color: CommnWidget.commonColor,
                    fontFamily: "thin",
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MapScreeen(lat: double.parse(widget.data.lat.toString()=="null"?"0":widget.data.lat.toString()), long:double.parse(widget.data.lng.toString()=="null"?"0":widget.data.lng.toString()),name: widget.data.name.toString(),);
                    }));
                  },
                                  child: Column(
                    children: <Widget>[
                      CommnWidget.cirvleicon(
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          CommnWidget.commonColor),
                      Text(
                        "الخريطة",
                        style: TextStyle(
                          color: CommnWidget.commonColor,
                          fontFamily: "thin",
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if(_dataUser.getKey("login")==false){
    CommnWidget.showInSnackBar2(" قم بتسجيل الدخول اولا", CommnWidget.commonColor, _scaffoldKey,context);    
                        }
                        else{
                              _apiRequests
                            .setfavorite(widget.data.id.toString())
                            .then((value) {
                          if (value == null) {
                            CommnWidget.showInSnackBar(
                                "تاكد من الاتصال بالانترنت",
                                CommnWidget.commonColor,
                                _scaffoldKey);
                          } else {
                            if (value) {
                              CommnWidget.showInSnackBar(
                                  "تم اضافة هذه الفعالية الي المفضلة",
                                  CommnWidget.commonColor,
                                  _scaffoldKey);
                            } else {
                              CommnWidget.showInSnackBar(
                                  "هذه الفعالية مضافة سابقا ",
                                  CommnWidget.commonColor,
                                  _scaffoldKey);
                            }
                          }
                        });
                   
                        }
                       },
                      child: CommnWidget.cirvleicon(
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          CommnWidget.commonColor),
                    ),
                    Text(
                      "المفضلة",
                      style: TextStyle(
                        color: CommnWidget.commonColor,
                        fontFamily: "thin",
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
