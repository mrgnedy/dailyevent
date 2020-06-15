import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyevent/helper/ApiRequests.dart';
import 'package:dailyevent/helper/Models/SearchModel.dart';
import 'package:dailyevent/helper/data.dart';
import 'package:dailyevent/helper/dataUser.dart';
import 'package:dailyevent/helper/localNotifcation.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../Commnwidget.dart';
import '../SearchCountry.dart';
import '../searchcity.dart';
import 'changPassword.dart';

class EditeProfile extends StatefulWidget {
  @override
  _EditeProfileState createState() => _EditeProfileState();
}

class _EditeProfileState extends State<EditeProfile> {
  bool hide = true;
  String email;
  // String password;
  String name;
  String phone;
  // String location;
  // String lat;
  // String long;
  TextEditingController nameContrller = new TextEditingController();
  TextEditingController phoneContrller = new TextEditingController();
  // TextEditingController locationContrller = new TextEditingController();
  TextEditingController emailContrller = new TextEditingController();
  DataUser _dataUser = DataUser.instance;
  String image;
  File _image;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ApiRequests _apiRequests = new ApiRequests();
  bool _isLoading = false;
  NotifcationClss _notifcationClss = new NotifcationClss();
  bool _isLoading2 = true;
  String countryname = "اختر اسم الدولة";
  int countryid;
  int cityid;
  String cityname = "اختر اسم المدينة";
  SearchMModel _data;
  getdata() {
    _apiRequests.getsearchdata().then((value) {
      print(value);
      setState(() {
        _data = value;

        _isLoading2 = false;
      });
    });
  }

  Cities cityitem;
  @override
  void setState(fn) {
    // TODO: implement setState
    if (this.mounted) super.setState(fn);
  }

//   @override
//   void initState() {
//     // TODO: implement initState
//  getdata();
//     firebaseCloudMessagingListeners();
//     super.initState();
//   }
  Eachcountry searchcontyitem;
  @override
  void initState() {
    super.initState();
    _notifcationClss.initalvalues(context);
    // TODO: implement initState

    getdata();

    image = _dataUser.getKey(ProfileImage).toString();
    nameContrller.text = _dataUser.getKey(Name).toString();
    // locationContrller.text = _dataUser.getKey(Address).toString();
    emailContrller.text = _dataUser.getKey(Email).toString();
    phoneContrller.text = _dataUser.getKey(MobileNumber).toString();
    countryname = _dataUser.getKey(Countryname).toString();
    countryid = int.parse( _dataUser.getKey(Countryid).toString());
        cityid = int.parse( _dataUser.getKey(CityId).toString());
        cityname =  _dataUser.getKey(CityName).toString();


  
    
 






    // lat = _dataUser.getKey(LAT).toString();
    // long = _dataUser.getKey(LONG).toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: _isLoading2
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
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            color: CommnWidget.commonColor,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.all(15),
                                    child: Text(
                                      "الملف الشخصي",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "black",
                                          fontSize: 15),
                                    )),
                              ],
                            )),
                        Transform.translate(
                          offset: Offset(0, -50),
                          child: Align(
                            alignment: Alignment.center,
                            child: ClipOval(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      child: new SimpleDialog(
                                        backgroundColor: Colors.grey[800],
                                        title: Align(
                                            alignment: Alignment.center,
                                            child: new Text(
                                              "تغيير الصوره الشخصية",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "thin"),
                                            )),
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: 45,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey[200]),
                                                child: new SimpleDialogOption(
                                                  child: new Text("كاميرا",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[800],
                                                          fontFamily: "thin",
                                                          height: 2)),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();

                                                    getImage(
                                                        ImageSource.camera);
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey[200]),
                                                child: new SimpleDialogOption(
                                                  child: new Text("ستوديو",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[800],
                                                          fontFamily: "thin",
                                                          height: 2)),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();

                                                    getImage(
                                                        ImageSource.gallery);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ));
                                },
                                child: _image == null
                                    ? CachedNetworkImage(
                                        imageUrl: IMAGEURL + image,
                                        placeholder: (context, url) => Center(
                                              child: CupertinoActivityIndicator(
                                                radius: 17,
                                                animating: true,
                                              ),
                                            ),
                                        fit: BoxFit.fill,
                                        height: 100,
                                        width: 100,
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error,
                                                color: Colors.black))
                                    : Image.file(
                                        _image,
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: MediaQuery.of(context).size.width > 400
                                ? 400 * .8
                                : MediaQuery.of(context).size.width * .85,
                            // alignment: Alignment.centerRight,

                            child: TextFormField(
                                controller: nameContrller,
                                style: TextStyle(
                                    fontFamily: "thin",
                                    color: CommnWidget.commonColor,
                                    fontSize: 14),
                                onSaved: (value) {
                                  name = value;
                                },
                                textAlign: TextAlign.right,
                                decoration: CommnWidget.commnInputDecoration(
                                    "اسم المستخدم",
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: Container(
                                        // height: 10,
                                        // width: 10,
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                          color: CommnWidget.commonColor,
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(50.0)),
                                          border: new Border.all(
                                            color: CommnWidget.commonColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: CommnWidget.commonColor,
                                    ))),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: MediaQuery.of(context).size.width > 400
                                ? 400 * .8
                                : MediaQuery.of(context).size.width * .85,
                            // alignment: Alignment.centerRight,

                            child: TextFormField(
                                controller: emailContrller,
                                style: TextStyle(
                                    fontFamily: "thin",
                                    color: CommnWidget.commonColor,
                                    fontSize: 14),
                                onSaved: (value) {
                                  phone = value;
                                },
                                textAlign: TextAlign.right,
                                decoration: CommnWidget.commnInputDecoration(
                                    "البريد الاكتروني",
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: Container(
                                        // height: 10,
                                        // width: 10,
                                        child: Icon(
                                          Icons.alternate_email,
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                          color: CommnWidget.commonColor,
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(50.0)),
                                          border: new Border.all(
                                            color: CommnWidget.commonColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: CommnWidget.commonColor,
                                    ))),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: MediaQuery.of(context).size.width > 400
                                ? 400 * .8
                                : MediaQuery.of(context).size.width * .85,
                            // alignment: Alignment.centerRight,

                            child: TextFormField(
                                controller: phoneContrller,
                                style: TextStyle(
                                    fontFamily: "thin",
                                    color: CommnWidget.commonColor,
                                    fontSize: 14),
                                onSaved: (value) {
                                  phone = value;
                                },
                                textAlign: TextAlign.right,
                                decoration: CommnWidget.commnInputDecoration(
                                    " رقم الهاتف مسبوق برقم الدولة",
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: Container(
                                        // height: 10,
                                        // width: 10,
                                        child: Icon(
                                          Icons.phone_android,
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                          color: CommnWidget.commonColor,
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(50.0)),
                                          border: new Border.all(
                                            color: CommnWidget.commonColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: CommnWidget.commonColor,
                                    ))),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 25, left: 25),
                          padding: EdgeInsets.only(
                              right: 8, left: 8, top: 4, bottom: 4),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey[500], width: 1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DoctorSearch(data: _data)))
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
                                              chooseProduct['DoctorId'] ?? null;
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
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 25, left: 25),
                          padding: EdgeInsets.only(
                              right: 8, left: 8, top: 4, bottom: 4),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey[500], width: 1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            cityname =
                                                chooseProduct['DoctorName'] ??
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
                        ),

                        // Align(
                        //   alignment: Alignment.center,
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width > 400
                        //         ? 400 * .8
                        //         : MediaQuery.of(context).size.width * .85,
                        //     margin: EdgeInsets.only(bottom: 15),
                        //                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(width: 1,color: Colors.grey)),

                        //     //  padding: EdgeInsets.only(right: 20,left: 20),
                        //     child: InkWell(
                        //       onTap: () async {
                        //         LocationResult result = await showLocationPicker(
                        //             context, "AIzaSyBQFncM9uaq-G4j0fb3nMWTRdbzwODGHzM",
                        //             automaticallyAnimateToCurrentLocation: true,
                        //             myLocationButtonEnabled: true,
                        //             layersButtonEnabled: true,
                        //             requiredGPS: true);
                        //         print(result.address);
                        //         setState(() {
                        //           location = result.address;
                        //           lat = result.latLng.latitude.toString();
                        //           long = result.latLng.longitude.toString();
                        //         });
                        //       },
                        //       child: TextFormField(
                        //           enabled: false,
                        //               controller:locationContrller,
                        //           style: TextStyle(
                        //               fontFamily: "thin",
                        //               color: CommnWidget.commonColor,
                        //               fontSize: 14),
                        //           onSaved: (value) {
                        //             location = value;
                        //           },
                        //           textAlign: TextAlign.right,
                        //           decoration: CommnWidget.commnInputDecoration(
                        //               location == null ? "الموقع" : location,
                        //               Container(
                        //                 padding: EdgeInsets.all(8),
                        //                 child: Container(
                        //                   // height: 10,
                        //                   // width: 10,
                        //                   child: Icon(
                        //                     Icons.location_on,
                        //                     color: Colors.white,
                        //                   ),
                        //                   decoration: BoxDecoration(
                        //                     color: CommnWidget.commonColor,
                        //                     borderRadius: new BorderRadius.all(
                        //                         new Radius.circular(50.0)),
                        //                     border: new Border.all(
                        //                       color: CommnWidget.commonColor,
                        //                       width: 1,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //               Icon(Icons.edit, color: CommnWidget.commonColor,))),
                        //     ),
                        //   ),
                        // ),

                        SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ChangePasswordPage();
                            }));
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: MediaQuery.of(context).size.width > 400
                                  ? 400 * .8
                                  : MediaQuery.of(context).size.width * .85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                              // alignment: Alignment.centerRight,

                              child: TextFormField(
                                  enabled: false,
                                  style: TextStyle(
                                      fontFamily: "thin",
                                      color: CommnWidget.commonColor,
                                      fontSize: 14),
                                  onSaved: (value) {
                                    phone = value;
                                  },
                                  textAlign: TextAlign.right,
                                  decoration: CommnWidget.commnInputDecoration(
                                      "كلمة المرور",
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: Container(
                                          // height: 10,
                                          // width: 10,
                                          child: Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                          ),
                                          decoration: BoxDecoration(
                                            color: CommnWidget.commonColor,
                                            borderRadius: new BorderRadius.all(
                                                new Radius.circular(50.0)),
                                            border: new Border.all(
                                              color: CommnWidget.commonColor,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.edit,
                                        color: CommnWidget.commonColor,
                                      ))),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .1,
                        ),
                        Align(
                            alignment: Alignment.center,
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
                                : InkWell(
                                    onTap: () {
                                      valdite();
                                    },
                                    child: CommnWidget.commnbtn(
                                        "تعديل", context))),
                      ],
                    ),
                  ),
      ),
    );
  }

  Future getImage(ImageSource imageSource) async {
    //      var image = await ImagePicker.pickVideo(source: ImageSource.camera);
    var image = await ImagePicker.pickImage(
        source: imageSource, maxWidth: 1024, maxHeight: 683, imageQuality: 100);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  void valdite() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      if (nameContrller.text == null || nameContrller.text.isEmpty) {
        CommnWidget.showInSnackBar(
            "رجاء ادخل اسمك", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
      // if (locationContrller.text == null || locationContrller.text.isEmpty) {
      //   CommnWidget.showInSnackBar(
      //       "رجاء ادخل موقعك", CommnWidget.commonColor, _scaffoldKey);
      //   return;
      // }
      if (emailContrller.text == null || emailContrller.text.isEmpty) {
        CommnWidget.showInSnackBar("رجاء ادخل البريد الاكتروني",
            CommnWidget.commonColor, _scaffoldKey);
        return;
      }
      if (phoneContrller.text == null || phoneContrller.text.isEmpty) {
        CommnWidget.showInSnackBar("رجاء ادخل رقم الهاتف ",
            CommnWidget.commonColor, _scaffoldKey);
        return;
      }
      if(countryid ==null){
           CommnWidget.showInSnackBar("رجاء ادخل اسم  الدولة ",
            CommnWidget.commonColor, _scaffoldKey);
        return;
      }
         if(cityid ==null){
           CommnWidget.showInSnackBar("رجاء ادخل اسم  المدينة ",
            CommnWidget.commonColor, _scaffoldKey);
        return;
      }
      setState(() {
        _isLoading = true;
      });

      _apiRequests
          .editeProfile(nameContrller.text, phoneContrller.text, countryid.toString(), cityid.toString(),
              "locationContrller.text", emailContrller.text, _image)
          .then((value) {
        if (value != null) {
          if (value) {
            _apiRequests.getProfile().then((value) {
              if (value == true) {
                CommnWidget.showErrorDialog("حسنا ", "تم تعديل بياناتك بنجاح",
                    DialogType.SUCCES, context);
                setState(() {
                  _isLoading = false;
                });
              } else if (value == false) {
                CommnWidget.showErrorDialog("حدث خطأ ما", "هذه المعلومات خاطئة",
                    DialogType.ERROR, context);
                setState(() {
                  _isLoading = false;
                });
              } else {
                CommnWidget.showErrorDialog("حدث خطأ ما",
                    "تاكد من الاتصال بالانترنت", DialogType.WARNING, context);
                setState(() {
                  _isLoading = false;
                });
              }
            });
            //  setState(() {
            //     _isLoading=false;
            //   });
            // Navigator.pushAndRemoveUntil(context,
            //     MaterialPageRoute(builder: (context) {
            //       return HomePage();
            //     }), (Route<dynamic> route) => false);
          } else {
            CommnWidget.showErrorDialog(
                "حدث خطأ ما", "هذه المعلومات خاطئة", DialogType.ERROR, context);
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
}
