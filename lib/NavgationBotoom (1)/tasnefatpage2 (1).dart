import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyevent/helper%20(1)/Models%20(1)/eventEventModel%20(1).dart';
import 'package:dailyevent/helper%20(1)/data%20(1).dart';
import 'package:dailyevent/helper%20(1)/localNotifcation%20(1).dart';
import 'package:dailyevent/widget%20(1)/choosenEventCell%20(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Commnwidget (1).dart';
import '../tasnefatDetails (1).dart';



class TasnefatPage2 extends StatefulWidget {

  final List<EventModel> data;
  TasnefatPage2({this.data});
  

  @override
  _TasnefatPage2State createState() => _TasnefatPage2State();
}
class _TasnefatPage2State extends State<TasnefatPage2> {



 


 NotifcationClss _notifcationClss = new NotifcationClss();
  @override
  void initState() {
    super.initState();
    _notifcationClss.initalvalues(context);
    // TODO: implement initState
 
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
             automaticallyImplyLeading: false,
          actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color:CommnWidget.commonColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              "المزيد من الفعاليات",
              style: TextStyle(
                  color: CommnWidget.commonColor, fontFamily: "black"),
            ),
          ),
        ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 200,
              //   child: Stack(
              //     children: <Widget>[
              //       Opacity(
              //         opacity: .7,
              //         child: CachedNetworkImage(
              //             imageUrl:
              //               widget.image.toString(),
              //             placeholder: (context, url) => Center(
              //                   child: CupertinoActivityIndicator(
              //                     radius: 17,
              //                     animating: true,
              //                   ),
              //                 ),
              //             fit: BoxFit.fill,
              //             width: MediaQuery.of(context).size.width,
              //             height: 200,
              //             // height: MediaQuery.of(context).size.height * .2,
              //             // width: MediaQuery.of(context).size.width,
              //             errorWidget: (context, url, error) =>
              //                 Icon(Icons.error, color: Colors.black)),
              //       ),
              //       Align(
              //           alignment: Alignment.topRight,
              //           child: Container(
              //             margin: EdgeInsets.only(top: 25, right: 15),
              //             child: IconButton(
              //               icon: Icon(
              //                 Icons.arrow_forward_ios,
              //                 color: Colors.white,
              //               ),
              //               onPressed: () {
              //                 Navigator.of(context).pop();
              //               },
              //             ),
              //           )),
              //     ],
              //   ),
              // ),
            
              // Container(
              //   margin: EdgeInsets.only(left: 20, right: 20),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.end,
                  
              //     children: <Widget>[
              //       Container(
              //         margin: EdgeInsets.only(right: 5, left: 5, top: 10),
              //         child: Text(
              //           "كافة ${widget.name} المتوفرة",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               fontFamily: "thin", fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //    _isLoading
              // ? Center(
              //     child: Container(
              //       margin: EdgeInsets.only(top: 20),
              //       child: CupertinoActivityIndicator(
              //         animating: true,
              //         radius: 17,
              //       ),
              //     ),
              //   )
              // : _data == null
              //     ? Center(
              //         child: Text(
              //         "تاكد من الاتصال بالانترنت",
              //         style: TextStyle(
              //           fontFamily: "black",
              //         ),
              //       ))
              //     :  
                  
                  // _data.data.length==0?Center(
                  //                           child: Text(
                  //                           "لا يوجد فعاليات",
                  //                           style: TextStyle(
                  //                               color: CommnWidget.commonColor,
                  //                               fontFamily: "black",
                  //                               fontWeight: FontWeight.bold),
                  //                           textAlign: TextAlign.center,
                  //                         )):  
                                          
                                          Container(
                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: widget.data.length,
shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                          
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return TasnefatDetails(
                                    data: widget.data[i],




                                  );
                                }));
                              },
                                                          child:ChoosenEventCell(
                                                            views:widget.data[i].views ,
                                image:
                                   IMAGEURL+widget.data[i].image.toString(),
                                   day:DateTime.parse( widget.data[i].startDate.toString())
                         ,    name:   widget.data[i].name.toString() ,
                         time:DateTime.parse("2020-03-26 "+ widget.data[i].startTime.toString()) .hour .toString() ,
                         location: widget.data[i].address.toString(),
                         lastdate:DateTime.parse( widget.data[i].endDate.toString()) ,
                              )
                            );
                          }),
                    )
                  ],
                ),
          
          
          ),),
        
      
    );
  }
}
