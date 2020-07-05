import 'dart:async';
import 'package:dailyevent/helper/Models/SearchModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';

import '../Commnwidget.dart';




class DoctorSearch2 extends StatefulWidget {
  final Eachcountry data ;
  DoctorSearch2({this.data});



  @override
  _DoctorSearch2State createState() => _DoctorSearch2State();
}

class _DoctorSearch2State extends State<DoctorSearch2> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){
           Navigator.of(context).pop();
         },),
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
               actions: <Widget>[
        //  new IconButton(
        //     onPressed: () {
        //       _showMaterialSearch(context);
        //     },
        //     tooltip: 'Search',
        //     icon: new Icon(Icons.search,color: Colors.black,),
        //   )
        ],
      ),

      body:SingleChildScrollView(
              primary: true,
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: widget.data.cities.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pop(context, {
                            "DoctorName":  widget.data.cities[index].city,
                            "DoctorId":widget.data.cities[index].id,
                            "searchcontyitem":widget.data.cities[index]
                          });
                          // print(  _data.data[index].doctorName);
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
                                   widget.data.cities[index].city,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
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
  //   _buildMaterialSearchPage(BuildContext context) {
      
  //   return new MaterialPageRoute<String>(
  //     settings: new RouteSettings(
  //       name: 'material_search',
  //       isInitialRoute: false,
  //     ),
  //     builder: (BuildContext context) {
  //       return new Material(
  //         child: new MaterialSearch<String>(
  //           placeholder: 'Search',
  //           results:  widget.data.data.eachcountry.map((Eachcountry v) => new MaterialSearchResult<String>(
  //             icon: Icons.person,
  //             value:v.country.country ,
  //             text: v.country.country ,
  //           )).toList(),
  //           filter: (dynamic value, String criteria) {
  //             print(" filter");
  //             return value.toLowerCase().trim()
  //               .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
  //           },
  //           onSelect: (dynamic value) => Navigator.of(context).pop(value),
  //           onSubmit: (String value) => Navigator.of(context).pop(value),
  //         ),
  //       );
  //     }
  //   );
  // }
  //   _showMaterialSearch(BuildContext context) {
  //   Navigator.of(context)
  //     .push(_buildMaterialSearchPage(context))
  //     .then((dynamic value) {
  //       print("value");
  //       print(value);
  //       // print(ll.indexOf(value));
  //       // print(value);
  //       // print("uuuuuuuuuuuuuuuuu");
  //       // print(_data.data[ll.indexOf(value)].doctorName);
  //       // print(_data.data[ll.indexOf(value)].id);
  //        Navigator.pop(context, {
  //                           "DoctorName":  value,
  //                           "DoctorId":widget.data.data.eachcountry[widget.data.data.eachcountry.indexOf(value)].country.id
  //                         });
  //       //                   print(  _data.data[index].description);
  //     });
  // }


}
