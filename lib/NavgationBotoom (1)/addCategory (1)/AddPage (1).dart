import 'dart:io';

import 'package:dailyevent/helper%20(1)/ApiRequests%20(1).dart';
import 'package:dailyevent/helper%20(1)/Models%20(1)/HomeModel%20(1).dart';
import 'package:dailyevent/helper%20(1)/localNotifcation%20(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../Commnwidget (1).dart';
import '../../loginPage (1).dart';
import 'Addpage2 (1).dart';

class AddPage extends StatefulWidget {
  final bool isloading;
  AddPage({this.isloading});
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  
  File _image;
  bool _isLoading = true;
  HomeModel _data;
  ApiRequests _apiRequests = new ApiRequests();
  TextEditingController categoryaddress = new TextEditingController();
  TextEditingController categoryNots = new TextEditingController();
  int catid;

  List<int> catss = new List<int>();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  getdata() {
    _apiRequests.getHomeData().then((value) {
      print(value);
      setState(() {
        _data = value;
        if (value != null) {
          for (int i = 0; i < value.data.categories.length; i++) {
            catss.add(0);
          }
        }

        _isLoading = false;
      });
    });
  }

  List<Widget> ll = new List<Widget>();
  NotifcationClss _notifcationClss = new NotifcationClss();
  @override
  void initState() {
    super.initState();
    print("addpage");
    print(widget.isloading);
    if( widget.isloading!=false){
    _notifcationClss.initalvalues(context);
    // TODO: implement initState
    getdata();
    }

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    categoryaddress.dispose();
    categoryNots.dispose();
    super.dispose();
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
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(right: 12, left: 12, top: 12),
          child:  widget.isloading==false?Align(
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
          )):_isLoading
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
                              "assets/ONE.png",
                              height: 60,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Center(
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
                                                      BorderRadius.circular(20),
                                                  color: Colors.grey[200]),
                                              child: new SimpleDialogOption(
                                                child: new Text("كاميرا",
                                                    style: TextStyle(
                                                        color: Colors.grey[800],
                                                        fontFamily: "thin",
                                                        height: 2)),
                                                onPressed: () {
                                                  Navigator.of(context).pop();

                                                  getImage(ImageSource.camera);
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
                                                      BorderRadius.circular(20),
                                                  color: Colors.grey[200]),
                                              child: new SimpleDialogOption(
                                                child: new Text("ستوديو",
                                                    style: TextStyle(
                                                        color: Colors.grey[800],
                                                        fontFamily: "thin",
                                                        height: 2)),
                                                onPressed: () {
                                                  Navigator.of(context).pop();

                                                  getImage(ImageSource.gallery);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .9,
                                height: MediaQuery.of(context).size.height * .2,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: CommnWidget.commonColor,
                                        width: 2)),
                                child: Center(
                                  child: _image == null
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              FontAwesomeIcons.image,
                                              size: 50,
                                              color: CommnWidget.commonColor,
                                            ),
                                            Text(
                                              "أضف صورة الفعالية",
                                              style: TextStyle(
                                                  color:
                                                      CommnWidget.commonColor,
                                                  fontFamily: "black"),
                                            )
                                          ],
                                        )
                                      : Image.file(
                                          _image,
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .2,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "اختر نوع الفعالية",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "black",
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: _data.data.categories.length == 0
                                ? Center(
                                    child: Text(
                                    "لا يوجد تصنيفات",
                                    style: TextStyle(
                                        color: CommnWidget.commonColor,
                                        fontFamily: "black",
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ))
                                : Wrap(
                                    // spacing: 12,
                                    runSpacing: 12,
                                    children: List.generate(
                                        _data.data.categories.length,
                                        (i) => InkWell(
                                              onTap: () {
                                                for (int j = 0;
                                                    j < catss.length;
                                                    j++) {
                                                  if (j == i) {
                                                    catss[j] = 1;
                                                  } else {
                                                    catss[j] = 0;
                                                  }
                                                }
                                                setState(() {
                                                  catid = _data
                                                      .data.categories[i].id;
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 8,
                                                    right: 8,
                                                    top: 4,
                                                    bottom: 4),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    border: Border.all(
                                                        color: catss[i] == 0
                                                            ? Colors.grey[200]
                                                            : CommnWidget
                                                                .commonColor)),
                                                margin: EdgeInsets.all(2),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .3,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  _data.data.categories[i].name
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontFamily: "thin"),
                                                ),
                                              ),
                                            )),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "أكتب عنوان الفعالية",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "black",
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: TextFormField(
                                textAlign: TextAlign.right,
                                controller: categoryaddress,
                                style: TextStyle(fontFamily: "thin"),
                                decoration: new InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 12, right: 8),
                                  hintText: "اكتب اسم الفعالية",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "thin",
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey[700], width: 1.0),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey[700], width: 1.0),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.0),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "أكتب نبذة مختصرة",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "black",
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          TextFormField(
                              maxLines: 3,
                              minLines: 1,
                              style: TextStyle(fontFamily: "thin"),
                              textAlign: TextAlign.right,
                              controller: categoryNots,
                              decoration: new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey[700], width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey[700], width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              )),
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
      if (_image == null) {
        CommnWidget.showInSnackBar(
            "رجاء اختار صوره الفعالية", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
      if (catid == null) {
        CommnWidget.showInSnackBar(
            "رجاء اختر نوع الفعالية", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
      if (categoryaddress.text == null || categoryaddress.text.isEmpty) {
        CommnWidget.showInSnackBar(
            "رجاء ادخل اسم الفعالية", CommnWidget.commonColor, _scaffoldKey);
        return;
      }
      if (categoryNots.text == null || categoryaddress.text.isEmpty) {
        CommnWidget.showInSnackBar(
            "رجاء ادخل اسم نبذة مختصرة", CommnWidget.commonColor, _scaffoldKey);
        return;
      }

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AddPage2(
            catid: catid,
            catname: categoryaddress.text,
            catimage: _image,
            catnote: categoryNots.text);
      }));
    }
  }
}
