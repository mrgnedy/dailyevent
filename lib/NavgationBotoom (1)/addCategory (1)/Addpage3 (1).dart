import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dailyevent/helper%20(1)/ApiRequests%20(1).dart';
import 'package:dailyevent/helper%20(1)/Models%20(1)/CountryModel%20(1).dart';
import 'package:dailyevent/helper%20(1)/localNotifcation%20(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';

import '../../Commnwidget (1).dart';
import 'finalpage (1).dart';

class AddPage3 extends StatefulWidget {
  final String catname;
  final int catId;
  final File catImage;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;
  final String phonenumber;
  final String mobileNumber;
  final String organizerId;
  final String catnotes;

  AddPage3(
      {this.catname,
      this.phonenumber,
      this.startDate,
      this.startTime,
      this.catId,
      this.catImage,
      this.endDate,
      this.endTime,
      this.mobileNumber,
      this.organizerId,
      this.catnotes});
  @override
  _AddPage3State createState() => _AddPage3State();
}

class _AddPage3State extends State<AddPage3> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController location = new TextEditingController();
  TextEditingController contry = new TextEditingController();
  TextEditingController cityycontroller = new TextEditingController();
  TextEditingController locationname = new TextEditingController();
  double lat;
  double long;
  bool _isLoading = true;
  CountryModel _data;
  ApiRequests _apiRequests = new ApiRequests();
  List<String> city = new List<String>();
  List<String> citties = new List<String>();
  Cities spicalicity;
  // List<Categories> catss =new List<Categories>();
  Data county;

  getdata() {
    _apiRequests.getCounry().then((value) {
      print(value);
      setState(() {
        _data = value;
        if (value != null)
          for (int i = 0; i < value.data.length; i++) {
            city.add(value.data[i].country.country);
          }
        // catss=value.data.categories;

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
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Image.asset(
                                    "assets/three.png",
                                    height: 60,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "   اسم الموقع   ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "black",
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  margin: EdgeInsets.only(right: 15),
                                  child: TextFormField(
                                      textAlign: TextAlign.right,
                                      controller: locationname,
                                      decoration: new InputDecoration(
                                          hintText: " ادخل اسم الموقع كاملا",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "thin"),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[700],
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[700],
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              top: 14, right: 8))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "   اضف الموقع الجغرافي   ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "black",
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    LocationResult result = await showLocationPicker(
                                        context,
                                        "AIzaSyBQFncM9uaq-G4j0fb3nMWTRdbzwODGHzM",
                                        automaticallyAnimateToCurrentLocation:
                                            true,
                                        myLocationButtonEnabled: true,
                                        layersButtonEnabled: true,
                                        requiredGPS: true);
                                    print(result.address);
                                    setState(() {
                                      location.text = result.address.toString();
                                      lat = result.latLng.latitude;
                                      long = result.latLng.longitude;
                                    });
                                  },
                                  child: Container(
                                    // height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * .85,
                                    margin: EdgeInsets.only(right: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                    child: TextFormField(
                                        textAlign: TextAlign.right,
                                        minLines: 1,
                                        maxLines: 2,
                                        enabled: false,
                                        controller: location,
                                        decoration: new InputDecoration(
                                            hintText: "اضف الموقع الجغرافي",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "thin"),
                                            contentPadding: EdgeInsets.only(
                                                top: 14,
                                                right: 8,
                                                bottom: 14))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "   الدولة المقام فيها الفعالية   ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "black",
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  margin: EdgeInsets.only(right: 15),
                                  child: TextFormField(
                                      controller: contry,
                                      textAlign: TextAlign.right,
                                      readOnly: true,
                                      decoration: new InputDecoration(
                                          prefixIcon: PopupMenuButton<String>(
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.black,
                                            ),
                                            onSelected: (value) {
                                              print(value);
                                              //  user_info.user.data.langauges.add(new Langauges.fromJson({'lang':value}));
                                              setState(() {
                                                //  _items=[..._items,value];
                                                cityycontroller.text = "";
                                                contry.text = value;
                                                //  _data.data[llar.indexOf(value)];

                                                county = _data.data.elementAt(
                                                    city.indexOf(value));
                                              });

                                              // print(_items);
                                              print(value);
                                              print("mahmoud");
                                            },
                                            itemBuilder:
                                                (BuildContext context) {
                                              return _data.data.map((listItem) {
                                                return PopupMenuItem<String>(
                                                    value: listItem
                                                        .country.country
                                                        .toString(),
                                                    child: Text(listItem
                                                        .country.country
                                                        .toString()));
                                              }).toList();
                                            },
                                          ),
                                          hintText: " ادخل اسم الدولة ",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "thin"),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[700],
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[700],
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              top: 14, right: 8))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "   المدينة المقام فيها الفعالية   ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "black",
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  margin: EdgeInsets.only(right: 15),
                                  child: TextFormField(
                                      textAlign: TextAlign.right,
                                      controller: cityycontroller,
                                      readOnly: true,
                                      decoration: new InputDecoration(
                                          prefixIcon: county == null
                                              ? null
                                              : PopupMenuButton<String>(
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Colors.black,
                                                  ),
                                                  onSelected: (value) {
                                                    print(value);
                                                    cityycontroller.text =
                                                        value;
                                                    //  user_info.user.data.langauges.add(new Langauges.fromJson({'lang':value}));
                                                    setState(() {
                                                      //  _items=[..._items,value];
                                                      //  contry.text=value;
                                                      //  _data.data[llar.indexOf(value)];
                                                      citties.clear();
                                                      for (int i = 0;
                                                          i <
                                                              county.cities
                                                                  .length;
                                                          i++) {
                                                        citties.add(county
                                                            .cities[i].city);
                                                      }

                                                      spicalicity = county
                                                          .cities
                                                          .elementAt(citties
                                                              .indexOf(value));
                                                      cityycontroller.text =
                                                          spicalicity.city;

                                                      // county=_data.data.elementAt (city.indexOf(value));
                                                    });

                                                    // print(_items);
                                                    print(value);
                                                    print("mahmoud");
                                                  },
                                                  itemBuilder:
                                                      (BuildContext context) {
                                                    return county.cities
                                                        .map((listItem) {
                                                      return PopupMenuItem<
                                                              String>(
                                                          value: listItem.city
                                                              .toString(),
                                                          child: Text(listItem
                                                              .city
                                                              .toString()));
                                                    }).toList();
                                                  },
                                                ),
                                          hintText: " ادخل اسم المدينة ",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "thin"),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[700],
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[700],
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              top: 14, right: 8))),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                    onTap: () {
                                      valdite();
                                    },
                                    child: CommnWidget.commnbtn(
                                        "نشر الفعالية", context))
                              ])))));
  }

  void valdite() {
    if (locationname.text == null || locationname.text.isEmpty) {
      CommnWidget.showInSnackBar(
          "رجاء ادخل  اسم الموقع", CommnWidget.commonColor, _scaffoldKey);
      return;
    }
    if (location.text == null || location.text.isEmpty) {
      CommnWidget.showInSnackBar(" رجاء ادخل  اسم الموقع الجغرافي",
          CommnWidget.commonColor, _scaffoldKey);
      return;
    }
    if (contry.text == null || contry.text.isEmpty) {
      CommnWidget.showInSnackBar(
          "رجاء ادخل  اسم الدولة", CommnWidget.commonColor, _scaffoldKey);
      return;
    }

    if (cityycontroller.text == null || cityycontroller.text.isEmpty) {
      CommnWidget.showInSnackBar(
          "رجاء ادخل  اسم المدينة", CommnWidget.commonColor, _scaffoldKey);
      return;
    }
setState(() {
  _isLoading=true;
});
    print(widget.catId);
    print(widget.startDate);
    print(widget.catname);
    print(widget.endDate);
    print(widget.endTime);
    print(widget.startTime);
    print(widget.phonenumber);
    print(widget.mobileNumber);
    print(widget.organizerId);
    print(locationname.text);

    print("spical city");
    print(spicalicity.city);
    print(spicalicity.id);
    print(county.country.country);
    print(county.country.id);
    _apiRequests
        .addcatogry(
            widget.catname,
            widget.startDate,
            widget.endDate,
            widget.startTime,
            widget.endTime,
            county.country.id.toString(),
            spicalicity.id.toString(),
            widget.catId.toString(),
            lat.toString(),
            long.toString(),
            widget.mobileNumber,
            widget.phonenumber,
            widget.catnotes,
            widget.organizerId,
            locationname.text,
            widget.catImage)
        .then((value) {
      if (value != null) {
        if (value) {
                     Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
                  return FinalPage();
                }), (Route<dynamic> route) => false);
          // Navigator.pushAndRemoveUntil(context,
          //     MaterialPageRoute(builder: (context) {
          //       return HomePage();
          //     }), (Route<dynamic> route) => false);
        } else {
          CommnWidget.showErrorDialog("حدث خطأ ما",
              "هذه المعلومات مستخدمة من قبل", DialogType.ERROR, context);
          setState(() {
            _isLoading = false;
          });
        }
      } else {
        CommnWidget.showErrorDialog("حدث خطأ ما", "تاكد من الاتصال بالانترنت",
            DialogType.WARNING, context);
        setState(() {
          _isLoading = false;
        });
      }
    });
  }
}
