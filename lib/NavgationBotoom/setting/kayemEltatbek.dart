import 'dart:async';

import 'package:dailyevent/helper/ApiRequests.dart';
import 'package:dailyevent/helper/Models/SettingModel.dart';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:webview_flutter/webview_flutter.dart';

import '../../Commnwidget.dart';

class Kayemeltatbek extends StatefulWidget {
  @override
  _KayemeltatbekState createState() => _KayemeltatbekState();
}

class _KayemeltatbekState extends State<Kayemeltatbek> {
  bool _isLoading = true;
  SettingModel _data;
  ApiRequests _apiRequests = new ApiRequests();

  @override
  void setState(fn) {
    // TODO: implement setState
    if (this.mounted) super.setState(fn);
  }
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  num _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }
  @override
  void initState() {
    // TODO: implement initState

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
            " قيم التطبيق",
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
        child:IndexedStack(
          index: _stackToView,
          children: [
            Column(
              children: <Widget>[
                Expanded(
                    child: WebView(
                   
               initialUrl: "https://play.google.com/store/apps/details?id=event.katab.com.events3",
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: _handleLoad,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                )),
              ],
            ),
            Container(
              child: Center(child: CircularProgressIndicator(backgroundColor: Colors.black,),)
            ),
          ],
        )
      )),
    );
  }
}
