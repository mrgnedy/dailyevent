import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Commnwidget.dart';
import 'helper/ApiRequests.dart';
import 'helper/Models/CategoriesModel.dart';
import 'helper/data.dart';
import 'helper/localNotifcation.dart';
import 'tasnefatDetails.dart';
import 'widget/choosenEventCell.dart';

class TasnefatPage extends StatefulWidget {
  final String id;
  final String image;
  final String name;
  final bool islgin;
    final String cityid;
  final String countryid;
  
  
  TasnefatPage({this.id,this.image,this.name,this.islgin,this.cityid,this.countryid});
  @override
  _TasnefatPageState createState() => _TasnefatPageState();
}
class _TasnefatPageState extends State<TasnefatPage> {



  bool _isLoading =true;
  CategoryModel _data;
  ApiRequests _apiRequests =new ApiRequests();




 getdata() {
    _apiRequests.getCatergory(widget.id).then((value) {
      print(value);
      setState(() {
        _data = value;
        _isLoading = false;
      });
    });
  }
 getdata2() {
    _apiRequests.getCatergory2(widget.id,widget.cityid,widget.countryid).then((value) {
      print(value);
      setState(() {
        _data = value;
        _isLoading = false;
      });
    });
  }


 NotifcationClss _notifcationClss = new NotifcationClss();
   @override
  void initState() {
    super.initState();
    _notifcationClss.initalvalues(context);
    // TODO: implement initState
    widget.islgin == false ? getdata2() : getdata();
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    if (this.mounted) super.setState(fn);
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: .7,
                      child: CachedNetworkImage(
                          imageUrl:
                            widget.image.toString(),
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
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(top: 25, right: 15),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 5, left: 5, top: 10),
                      child: Text(
                        "كافة ${widget.name} المتوفرة",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "thin", fontWeight: FontWeight.bold),
                      ),
                    ),
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
                  :  _data.data.length==0?Center(
                                            child: Text(
                                            "لا يوجد فعاليات",
                                            style: TextStyle(
                                                color: CommnWidget.commonColor,
                                                fontFamily: "black",
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          )):  Container(
                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: _data.data.length,
shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            var recommendevents;
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return TasnefatDetails(
                                    data: _data.data[i],




                                  );
                                }));
                              },
                                                          child:ChoosenEventCell(
                                image:
                                   IMAGEURL+_data.data[i].image.toString(),
                                   day:DateTime.parse( _data.data[i].startDate.toString())
                         ,    name:   _data.data[i].name.toString() ,
                         time:DateTime.parse("2020-03-26 "+ _data.data[i].startTime.toString()) .hour .toString() ,
                         location: _data.data[i].city.toString(),
                         lastdate:DateTime.parse( _data.data[i].endDate.toString()) ,
                              )
                            );
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
