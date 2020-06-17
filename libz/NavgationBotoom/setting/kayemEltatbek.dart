import 'package:events/Commnwidget.dart';
import 'package:events/helper/ApiRequests.dart';
import 'package:events/helper/Models/SettingModel.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

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
        child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: Text(
                        "Comming Soon",                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Colors.black, fontFamily: "thin"),
                      ),
                    ),
                  ),
      )),
    );
  }
}
