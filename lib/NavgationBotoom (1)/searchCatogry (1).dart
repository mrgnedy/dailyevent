import 'dart:async';

// import 'package:dailyevent/helper%20(1)/Models%20(1)/HomeModel%20(1).dart';
import 'package:dailyevent/helper%20(1)/Models%20(1)/SearchModel%20(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';

import '../Commnwidget (1).dart';

class DoctorSearch23 extends StatefulWidget {
  final List<Categories> data;
  DoctorSearch23({this.data});

  @override
  _DoctorSearch23State createState() => _DoctorSearch23State();
}

class _DoctorSearch23State extends State<DoctorSearch23> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "البحث",
            style:
                TextStyle(color: CommnWidget.commonColor, fontFamily: "black"),
          ),
        ),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context, {
                      "DoctorName": widget.data[index].name,
                      "DoctorId": widget.data[index].id,
                      "searchcontyitem": widget.data[index]
                    });
                  },
                  child: Column(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              widget.data[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
