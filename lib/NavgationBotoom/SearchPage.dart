import 'package:events/Commnwidget.dart';
import 'package:events/NavgationBotoom/SearchCountry.dart';
import 'package:events/NavgationBotoom/searchCatogry.dart';
import 'package:events/NavgationBotoom/searchcity.dart';
import 'package:events/NavgationBotoom/tasnefatpage2.dart';
import 'package:events/helper/ApiRequests.dart';
import 'package:events/helper/Models/SearchModel.dart';
import 'package:events/helper/localNotifcation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart' as formDateTime;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isLoading = true;

  ApiRequests _apiRequests = new ApiRequests();
  String time = "اختر تاريخ البداية";
    String time2 = "اختر تاريخ النهاية";
    bool loading = false;

  String id;

  Eachcountry searchcontyitem;
  String countryname = "اختر اسم الدولة";
  int countryid;
  int cityid;
  String cityname = "اختر اسم المدينة";
  Cities cityitem;
  DateTime start;
  DateTime end;

  int categoryid;
  String categoryname = "اختر التصنيف";
  Categories categoryitem;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SearchMModel _data;
  getdata() {
    _apiRequests.getsearchdata().then((value) {
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
    getdata();
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
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              "البحث",
              style: TextStyle(
                  color: CommnWidget.commonColor, fontFamily: "black"),
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(15),
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
                  : SingleChildScrollView(
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "الدولة",
                                style: TextStyle(
                                    color: Colors.black, fontFamily: "black"),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DoctorSearch(
                                                            data: _data)))
                                            .then((chooseProduct) {
                                          // print("-product in home");
                                          // print(chooseProduct['DoctorName']);
                                          // print(chooseProduct['DoctorId']);
                                          if (chooseProduct != null) {
                                            setState(() {
                                              countryname =
                                                  chooseProduct['DoctorName'] ??
                                                      null;
                                              countryid =
                                                  chooseProduct['DoctorId'] ??
                                                      null;
                                              searchcontyitem = chooseProduct[
                                                      'searchcontyitem'] ??
                                                  null;
                                              cityname = "اختر اسم المدينة";
                                            });
                                          }
                                        });
                                      },
                                      child: Icon(Icons.arrow_back_ios)),
                                  Text(
                                    countryname.toString(),
                                    style: TextStyle(fontFamily: "thin"),
                                  ),
                                ],
                              ),
                              Divider(),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "المدينة",
                                style: TextStyle(
                                    color: Colors.black, fontFamily: "black"),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        if (searchcontyitem != null) {
                                          Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DoctorSearch2(
                                                              data:
                                                                  searchcontyitem)))
                                              .then((chooseProduct) {
                                            // print("-product in home");
                                            // print(chooseProduct['DoctorName']);
                                            // print(chooseProduct['DoctorId']);
                                            if (chooseProduct != null) {
                                              setState(() {
                                                cityname = chooseProduct[
                                                        'DoctorName'] ??
                                                    null;
                                                cityid =
                                                    chooseProduct['DoctorId'] ??
                                                        null;
                                                cityitem = chooseProduct[
                                                        'searchcontyitem'] ??
                                                    null;
                                              });
                                            }
                                          });
                                        }
                                      },
                                      child: Icon(Icons.arrow_back_ios)),
                                  Text(
                                    cityname.toString(),
                                    style: TextStyle(fontFamily: "thin"),
                                  ),
                                ],
                              ),
                              Divider(),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "التاريخ",
                                style: TextStyle(
                                    color: Colors.black, fontFamily: "black"),
                              ),
                               Text(
                                "من",
                                style: TextStyle(
                                    color: Colors.black, fontFamily: "black"),
                              ),
                              
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        DatePicker.showDateTimePicker(context,
                                            showTitleActions: true,
                                            theme: DatePickerTheme(
                                                backgroundColor:
                                                    CommnWidget.commonColor,cancelStyle: TextStyle(color: CommnWidget.commonColor,fontFamily: "thin") ,
                                                itemStyle: TextStyle(
                                                    color: Colors.white),doneStyle: TextStyle(color: CommnWidget.commonColor,fontFamily: "thin"),headerColor: Colors.white),
                                            onChanged: (date) {
                                              start=date;
                                          print('change $date in time zone ' +
                                              date.timeZoneOffset.inHours
                                                  .toString());
                                          setState(() {
                                            // selectedTime= date;
                                            time = date.year.toString() +
                                                "-" +
                                                date.month.toString() +
                                                "-" +
                                                date.day.toString();
                                          });
                                        }, onConfirm: (date) {       start=date;
                                          setState(() {
                                            // selectedTime= date;
                                            time = time = date.year.toString() +
                                                "-" +
                                                date.month.toString() +
                                                "-" +
                                                date.day.toString();
                                          });
                                          print('confirm $date');
                                        },
                                            currentTime: DateTime.now(),
                                            locale: LocaleType.ar);
                                      },
                                      child: Icon(Icons.arrow_back_ios)),
                                  Text(
                                    time.toString() == "null"
                                        ? "اختر تاريخ البداية"
                                        : time.toString(),
                                    style: TextStyle(fontFamily: "thin"),
                                  ),
                                ],
                              ),
                            
                              Divider(),
                                Text(
                                "الي",
                                style: TextStyle(
                                    color: Colors.black, fontFamily: "black"),
                              ),
                              
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        DatePicker.showDateTimePicker(context,
                                            showTitleActions: true,
                                            theme: DatePickerTheme(
                                                backgroundColor:
                                                    CommnWidget.commonColor,cancelStyle: TextStyle(color: CommnWidget.commonColor,fontFamily: "thin") ,
                                                itemStyle: TextStyle(
                                                    color: Colors.white),doneStyle: TextStyle(color: CommnWidget.commonColor,fontFamily: "thin"),headerColor: Colors.white),
                                            onChanged: (date) {       
                                          print('change $date in time zone ' +
                                              date.timeZoneOffset.inHours
                                                  .toString());
                                          setState(() {
                                            // selectedTime= date;
                                     end=date;
                                            time2 = date.year.toString() +
                                                "-" +
                                                date.month.toString() +
                                                "-" +
                                                date.day.toString();
                                          });
                                        }, onConfirm: (date) {
                                          setState(() {end=date;
                                            // selectedTime= date;
                                            time2 = date.year.toString() +
                                                "-" +
                                                date.month.toString() +
                                                "-" +
                                                date.day.toString();
                                          });
                                          print('confirm $date');
                                        },
                                            currentTime: DateTime.now(),
                                            locale: LocaleType.ar);
                                      },
                                      child: Icon(Icons.arrow_back_ios)),
                                  Text(
                                    time2.toString() == "null"
                                        ? "اختر تاريخ النهاية"
                                        : time2.toString(),
                                    style: TextStyle(fontFamily: "thin"),
                                  ),
                                ],
                              ),
                            
                              Divider(),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "التصنيفات",
                                style: TextStyle(
                                    color: Colors.black, fontFamily: "black"),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DoctorSearch23(
                                                            data: _data.data
                                                                .categories)))
                                            .then((chooseProduct) {
                                          // print("-product in home");
                                          // print(chooseProduct['DoctorName']);
                                          // print(chooseProduct['DoctorId']);
                                          if (chooseProduct.toString() !=
                                              "null") {
                                            setState(() {
                                              categoryname =
                                                  chooseProduct['DoctorName']
                                                          .toString() ??
                                                      null;
                                              categoryid =
                                                  chooseProduct['DoctorId'] ??
                                                      null;
                                              categoryitem = chooseProduct[
                                                      'searchcontyitem'] ??
                                                  null;
                                            });
                                          }
                                        });
                                      },
                                      child: Icon(Icons.arrow_back_ios)),
                                  Text(
                                    categoryname.toString() == "null"
                                        ? "اختر التصنيف"
                                        : categoryname.toString(),
                                    style: TextStyle(fontFamily: "thin"),
                                  ),
                                ],
                              ),
                              Divider(),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          loading
                            ? Center(
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: CupertinoActivityIndicator(
                                    animating: true,
                                    radius: 17,
                                  ),
                                ),
                              )
                            : InkWell(
                              onTap: () {
                                validate();
                              },
                              child: CommnWidget.commnbtn("البحث", context))
                        ],
                      ),
                    )),
        ));
  }

  void validate() {
    if ((countryname == null || countryname == "اختر اسم الدولة") &&
        (cityname == null || cityname == "اختر اسم المدينة") &&
        (categoryname == null || categoryname == "اختر التصنيف") &&
        (time == null || time == "اختر التاريخ")) {
      CommnWidget.showInSnackBar(
          "رجاء ادخال عنصر علي الاقل", CommnWidget.commonColor, _scaffoldKey);
      return;
    }
    print("mahmoud");
    if (countryname == null || countryname == "اختر اسم الدولة") {
      countryname = null;
    }
    if (cityname == null || cityname == "اختر اسم المدينة") {
      cityname = null;
      //  CommnWidget.showInSnackBar(
      //           "رجاء اختار اسم المدينة", CommnWidget.commonColor, _scaffoldKey);
      //           return ;

    }
    if (categoryname == null || categoryname == "اختر التصنيف") {
      //  CommnWidget.showInSnackBar(
      //           "رجاء اختار اسم التصنيف", CommnWidget.commonColor, _scaffoldKey);
      //           return ;
      categoryname = null;
    }
    if (time == null || time == "اختر تاريخ البداية") {
      //  CommnWidget.showInSnackBar(
      //           "رجاء اختار  التاريخ", CommnWidget.commonColor, _scaffoldKey);
      //           return ;
      time = null;
    }
  if (time2 == null || time2 == "اختر تاريخ النهاية") {
      //  CommnWidget.showInSnackBar(
      //           "رجاء اختار  التاريخ", CommnWidget.commonColor, _scaffoldKey);
      //           return ;
      time2 = null;
    }
   print("------------------");
  print(start.toString());
  print(end.toString());
   print(time.toString());
  print(time2.toString());
    if((!(time == null || time == "اختر تاريخ البداية"))&& (!(time2 == null || time2 == "اختر تاريخ النهاية"))){
print("mahmoud");
      if(end.isBefore(start)){
          CommnWidget.showInSnackBar(
            "ادخل تاريخ البداية و النهاية بطريقة صحيحة", CommnWidget.commonColor, _scaffoldKey);
 return;
      }
    }
    //  String data =DateTime.parse(time) .year.toString() +
    //                     "-" +
    //                     DateTime.parse(time).month.toString() +
    //                     "-" +
    //                     DateTime.parse(time).day.toString();
setState(() {
  loading = true;
});
    _apiRequests
        .getsearch(categoryid.toString(), countryid.toString(),
            cityid.toString(), time.toString(),time2.toString())
        .then((value) {
          setState(() {
  loading = false;
});
      if (value == null) {
        CommnWidget.showInSnackBar(
            "تاكد بالاتصال بالانترنت", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
      if (value.data.length == 0) {
        CommnWidget.showInSnackBar(
            "لا يوجد فاعليات", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TasnefatPage2(
          data: value.data,
        );
      }));
    });
  }
}
