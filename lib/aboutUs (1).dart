
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import 'Commnwidget (1).dart';
import 'helper (1)/ApiRequests (1).dart';
import 'helper (1)/Models (1)/SettingModel (1).dart';

class AboutUsPage extends StatefulWidget {
  final String tittel;
  final int check;
//  final String url;
  AboutUsPage({this.tittel, this.check});
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  bool _isLoading = true;
  SettingModel _data;
  ApiRequests _apiRequests = new ApiRequests();

  getdata() {
    _apiRequests.getsetting().then((value) {
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
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: CommnWidget.commonColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Center(
          child: Text(
            widget.tittel.toString(),
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
      body: Center(
          child: Container(
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
                : Padding(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        widget.check == 1
                            ? _data.data.usage
                            : widget.check == 2
                                ? _data.data.policy
                                : _data.data.about,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Colors.black, fontFamily: "thin"),
                      ),
                    ),
                  ),
      )),
    );
  }
}
