import 'dart:io';
import 'package:dailyevent/helper/localNotifcation.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

import '../../Commnwidget.dart';
import 'Addpage3.dart';

class AddPage2 extends StatefulWidget {
  final String catname;
  final int catid;
  final File catimage;
  final String catnote;
  AddPage2({this.catid, this.catname, this.catimage,this.catnote});

  @override
  _AddPage2State createState() => _AddPage2State();
}

class _AddPage2State extends State<AddPage2> {
  TextEditingController firstdate = new TextEditingController();
  TextEditingController seconddate = new TextEditingController();
  TextEditingController firsttime = new TextEditingController();
  TextEditingController secondtime = new TextEditingController();
  TextEditingController mobilenumber = new TextEditingController();
  TextEditingController phonenumber = new TextEditingController();
  TextEditingController organizername = new TextEditingController();
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    firstdate.dispose();
      seconddate.dispose();
        firsttime.dispose();
          secondtime.dispose();
            mobilenumber.dispose();
              phonenumber.dispose();
                organizername.dispose();
    super.dispose();
  }
  /**
   * 
      DatePicker.showDateTimePicker(context, showTitleActions: true,
                  onChanged: (date) {
                print('change $date in time zone ' +
                    date.timeZoneOffset.inHours.toString());
                setState(() {
                  // selectedTime= date;
                  time = date .year.toString() +
                          "-" +
                          date.month.toString() +
                          "-" +
                          date.day.toString();
              
                });
              }, onConfirm: (date) {
                setState(() {
                  // selectedTime= date;
                  time = time = date .year.toString() +
                          "-" +
                          date.month.toString() +
                          "-" +
                          date.day.toString();
                 
                });
                print('confirm $date');
              },
                  currentTime: DateTime.now(),
                  locale:LocaleType.ar );
   * 
   */
   NotifcationClss _notifcationClss = new NotifcationClss();
  @override
  void initState() {
    super.initState();
    _notifcationClss.initalvalues(context);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CommnWidget.commonColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Center(
          child: Text(
            "إضافة فعالية",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontFamily: "black"),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Image.asset(
                    "assets/TOW.png",
                    height: 60,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "حدد التاريخ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "black",
                          color: Colors.grey[700],
                        ),
                      ),
                      Icon(Icons.date_range),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final List<DateTime> picked =
                        await DateRagePicker.showDatePicker(
                            context: context,
                            initialFirstDate: new DateTime.now(),
                            
                            initialLastDate:
                                (new DateTime.now()).add(new Duration(days: 7)),
                                // initialDatePickerMode: ,
                            firstDate: new DateTime(2015),
                            lastDate: new DateTime(20100));
                    if (picked != null && picked.length == 2) {
                      print(picked);
                      firstdate.text = picked[0].year.toString() +
                          "-" +
                          picked[0].month.toString() +
                          "-" +
                          picked[0].day.toString();
                      seconddate.text = picked[1].year.toString() +
                          "-" +
                          picked[1].month.toString() +
                          "-" +
                          picked[1].day.toString();
                    }
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        height: 40,
                        padding: EdgeInsets.only(top: 14),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        // color: Colors.red,
                        child: TextFormField(
                            textAlign: TextAlign.center,
                            enabled: false,
                            controller: seconddate,
                            decoration: new InputDecoration(
                              hintText: "تاريخ انتهاء الفعالية",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "thin",
                                  fontSize: 12),
                            )),
                      ),
                      Text(
                        "  :  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "black",
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.only(top: 14),
                        // color: Colors.red,
                        child: Center(
                          child: TextFormField(
                              textAlign: TextAlign.center,
                              enabled: false,
                              controller: firstdate,
                              decoration: new InputDecoration(
                                hintText: "تاريخ بداية الفعالية",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "thin",
                                    fontSize: 12),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "حدد الوقت",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "black",
                          color: Colors.grey[700],
                        ),
                      ),
                      Icon(Icons.av_timer),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        DateTime now = DateTime.now();
                        showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay(hour: now.hour, minute: now.minute),
                        ).then<TimeOfDay>((TimeOfDay value) {
                          if (value != null) {
                            print('${value.format(context)}');
                            setState(() {
                              secondtime.text = '${value.hour}:${value.minute}';
                            });
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .4,
                        height: 40,
                        padding: EdgeInsets.only(top: 14),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        // color: Colors.red,
                        child: TextFormField(
                            textAlign: TextAlign.center,
                            enabled: false,
                            controller: secondtime,
                            decoration: new InputDecoration(
                              hintText: "وقت انتهاء الفعالية",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "thin",
                                  fontSize: 12),
                            )),
                      ),
                    ),
                    Text(
                      "  :  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "black",
                          fontWeight: FontWeight.bold),
                    ),
                    Theme(
                       data: Theme.of(context).copyWith(
        primaryColor: CommnWidget.commonColor, //color you want at header
        buttonTheme: ButtonTheme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            
            secondary: Colors
                .cyan, // Color you want for action buttons (CANCEL and OK)
          ),
        ),
      ),
                                          child: Builder(
                                                                                      builder: (context) => InkWell(
                        onTap: () {
                          DateTime now = DateTime.now();
                          showTimePicker(
                            context: context,
                            
                            initialTime:
                                TimeOfDay(hour: now.hour, minute: now.minute),
                          ).then<TimeOfDay>((TimeOfDay value) {
                            if (value != null) {
                              print('${value.format(context)}');
                              setState(() {
                                firsttime.text = '${value.hour}:${value.minute}';
                              });
                            }
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.only(top: 14),
                          // color: Colors.red,
                          child: Center(
                            child: TextFormField(
                                textAlign: TextAlign.center,
                                enabled: false,
                                controller: firsttime,
                                decoration: new InputDecoration(
                                  hintText: "وقت بداية الفعالية",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "thin",
                                      fontSize: 12),
                                )),
                          ),
                        ),
                      ),
                                          ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "   أدخل بيانات التواصل   ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "black",
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .85,
                  margin: EdgeInsets.only(right: 15),
                  child: TextFormField(
                      textAlign: TextAlign.right,
                      style: TextStyle(fontFamily: "thin"),
                      keyboardType: TextInputType.number,
                      controller: mobilenumber,
                      decoration: new InputDecoration(
                          hintText: "رقم الموبايل",
                        
                          hintStyle:
                              TextStyle(color: Colors.grey, fontFamily: "thin"),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[700], width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[700], width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.only(top: 14, right: 8))),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .85,
                  margin: EdgeInsets.only(right: 15, top: 15),
                  child: TextFormField(
                      textAlign: TextAlign.right,
                           style: TextStyle(fontFamily: "thin"),
                      keyboardType: TextInputType.number,
                      controller: phonenumber,
                      decoration: new InputDecoration(
                          hintText: "رقم الهاتف الخلوي",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontFamily: "thin"),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[700], width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[700], width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.only(top: 14, right: 8))),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "منظم الفعالية",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "black",
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .85,
                  margin: EdgeInsets.only(right: 15),
                  child: TextFormField(
                      textAlign: TextAlign.right,
                           style: TextStyle(fontFamily: "thin"),
                      keyboardType: TextInputType.text,
                      controller: organizername,
                      decoration: new InputDecoration(
                          hintText: " ادخل اسم منظم الفعالية",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontFamily: "thin",),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[700], width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[700], width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.only(top: 14, right: 8))),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                    onTap: () {
                      valdite();
                    },
                    child: CommnWidget.commnbtn("التالي", context))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void valdite() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    




           if (firstdate.text == null||firstdate.text.isEmpty) {
        CommnWidget.showInSnackBar(
            "رجاء ادخل تاريخ البداية", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
  if (seconddate.text == null||seconddate.text.isEmpty) {
        CommnWidget.showInSnackBar(
            "رجاء ادخل تاريخ النهاية", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
                 if (firsttime.text == null||firsttime.text.isEmpty) {
        CommnWidget.showInSnackBar(
            "رجاء ادخل وقت البداية", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
  if (secondtime.text == null||secondtime.text.isEmpty) {
        CommnWidget.showInSnackBar(
            "رجاء ادخل وقت النهاية", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
        if (mobilenumber.text == null||mobilenumber.text.isEmpty) {
        CommnWidget.showInSnackBar(
            "رجاء ادخل رقم الموبايل", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
          if (phonenumber.text == null||phonenumber.text.isEmpty) {
        CommnWidget.showInSnackBar(
            "رجاء ادخل رقم الهاتف الخلوي", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
              if (organizername.text == null||organizername.text.isEmpty) {
        CommnWidget.showInSnackBar(
            "رجاء ادخل اسم  منظم الفعالية", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AddPage3(
catname: widget.catname,
startTime: firsttime.text,
endTime: secondtime.text,
startDate: firstdate.text,
endDate: seconddate.text,
catId: widget.catid,
phonenumber: phonenumber.text,
mobileNumber: mobilenumber.text,
organizerId: organizername.text,catImage: widget.catimage,
catnotes: widget.catnote,




        );
      }));
    }
  }
}
