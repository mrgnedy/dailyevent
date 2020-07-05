import 'package:cached_network_image/cached_network_image.dart';
import 'package:dailyevent/NavgationBotoom%20(1)/setting%20(1)/EditeProfile%20(1).dart';
import 'package:dailyevent/helper%20(1)/ApiRequests%20(1).dart';
import 'package:dailyevent/helper%20(1)/Models%20(1)/HomeModel%20(1).dart';
import 'package:dailyevent/helper%20(1)/data%20(1).dart';
import 'package:dailyevent/helper%20(1)/localNotifcation%20(1).dart';
import 'package:dailyevent/widget%20(1)/EventsWidget%20(1).dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../Commnwidget (1).dart';
import '../NotifcationPage (1).dart';
import '../tasnefatDetails (1).dart';
import '../tasnefatepage (1).dart';
class HomePage extends StatefulWidget {
  final String cityid;
  final String countryid;
  final bool isloading;
  HomePage({this.countryid, this.isloading, this.cityid});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  HomeModel _data;
  ApiRequests _apiRequests = new ApiRequests();
  List<Categories> catss = new List<Categories>();
  String id = "0";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  getdata() {
    _apiRequests.getHomeData().then((value) {
      print(value);
      setState(() {
        _data = value;
        if (value != null) catss = value.data.categories;

        _isLoading = false;
      });
    });
  }

  getdata2() {
    _apiRequests.getHomeData2(widget.countryid, widget.cityid).then((value) {
      print(value);
      setState(() {
        _data = value;
        if (value != null) catss = value.data.categories;

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
    widget.isloading == false ? getdata2() : getdata();
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
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: CommnWidget.commonColor,
              ),
              onPressed: () {
                widget.isloading == false
                    ? CommnWidget.showInSnackBar2(" قم بتسجيل الدخول اولا",
                        CommnWidget.commonColor, _scaffoldKey, context)
                    : Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                        return NotifcationPage();
                      }));
              },
            )
          ],
          leading: IconButton(
            icon: Icon(
              Icons.person,
              color: CommnWidget.commonColor,
              size: 30,
            ),
            onPressed: () {
              widget.isloading == false
                  ? CommnWidget.showInSnackBar2(" قم بتسجيل الدخول اولا",
                      CommnWidget.commonColor, _scaffoldKey, context)
                  : Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                      return EditeProfile(last: "sdkfdhsgkj",);
                    }));
            },
          ),
          title: Center(
              child: Image.asset(
            "assets/logo.png",
            height: 50,
            width: 90,
            fit: BoxFit.fill,
          )),
        ),
        body: _isLoading
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
                          height: MediaQuery.of(context).size.height * .2,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                            right: 8,
                            left: 8,
                          ),
                          child: _data.data.ads.length == 0
                              ? Center(
                                  child: Text(
                                  "لا يوجد بيانات في الوقت الحالي",
                                  style: TextStyle(fontFamily: "thin"),
                                ))
                              : _data.data.ads.length == 1
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return TasnefatDetails(
                                            data: _data.data.ads[0],
                                          );
                                        }));
                                      },
                                      child: annonsment(
                                          _data.data.ads[0].image.toString()))
                                  : Swiper(
                                      autoplay: true,

                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // id = _data.data.ads[index].id.toString();
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return TasnefatDetails(
                                                data: _data.data.ads[index],
                                              );
                                            }));
                                          },
                                          child: annonsment(_data
                                              .data.ads[index].image
                                              .toString()),
                                        );
                                      },
                                      itemCount: _data.data.ads.length,
                                      pagination: new SwiperPagination(),
                                      duration: 7000,
                                      // control: new SwiperControl(),
                                    ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 25, left: 25, top: 5, bottom: 5),
                          child: Text(
                            "فعاليات اليوم",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "thin",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .2,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                            right: 8,
                            left: 8,
                          ),
                          child: _data.data.todayevents.length == 0
                              ? Center(
                                  child: Text(
                                  "لا يوجد بيانات في الوقت الحالي",
                                  style: TextStyle(fontFamily: "thin"),
                                ))
                              : _data.data.todayevents.length == 1
                                  ? annonsment(_data.data.todayevents[0].image
                                      .toString())
                                  : Swiper(
                                      autoplay: true,

                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        id = _data.data.todayevents[index].id
                                            .toString();
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return TasnefatDetails(
                                                data: _data
                                                    .data.todayevents[index],
                                              );
                                            }));
                                          },
                                          child: annonsment(_data
                                              .data.todayevents[index].image
                                              .toString()),
                                        );
                                      },
                                      itemCount: _data.data.todayevents.length,
                                      pagination: new SwiperPagination(),
                                      // duration: 7000,
                                      // control: new SwiperControl(),
                                    ),
                        ),
                        _data.data.todayevents.length == 0
                            ? Container()
                            : Container(
                                child: Transform.translate(
                                  offset: Offset(0, -30),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: 60,
                                        height: 60,

                                        child: InkWell(
                                            onTap: () {
                                              widget.isloading == false
                                                  ? CommnWidget.showInSnackBar2(
                                                      " برجاء تسجيل الدخول اولا",
                                                      CommnWidget.commonColor,
                                                      _scaffoldKey,
                                                      context)
                                                  : _apiRequests
                                                      .setfavorite(id)
                                                      .then((value) {
                                                      if (value == null) {
                                                        CommnWidget.showInSnackBar(
                                                            "تاكد من الاتصال بالانترنت",
                                                            CommnWidget
                                                                .commonColor,
                                                            _scaffoldKey);
                                                      } else {
                                                        if (value) {
                                                          CommnWidget.showInSnackBar(
                                                              "تم اضافة هذه الفعالية الي المفضلة",
                                                              CommnWidget
                                                                  .commonColor,
                                                              _scaffoldKey);
                                                        } else {
                                                          CommnWidget.showInSnackBar(
                                                              "هذه الفعالية مضافة سابقا ",
                                                              CommnWidget
                                                                  .commonColor,
                                                              _scaffoldKey);
                                                        }
                                                      }
                                                    });
                                            },
                                            child:
                                                Image.asset("assets/like.png")),
                                        // color: Colors.red,
                                        margin: EdgeInsets.only(
                                            right: 15, left: 15),
                                      )),
                                ),
                              ),
                        Transform.translate(
                          offset: Offset(0, -30),
                          child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 5, left: 5),
                                    child: Text(
                                      "كافة التصنيفات",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "thin",
                                          fontWeight: FontWeight.bold),
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
                                            spacing: 12,
                                            runSpacing: 12,
                                            children: List.generate(
                                                _data.data.categories.length,
                                                (i) => InkWell(
                                                      onTap: () {
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return TasnefatPage(
                                                            adsimage: IMAGEURL +
                                                                _data
                                                                    .data
                                                                    .categories[
                                                                        i]
                                                                    .ad
                                                                    .toString(),
                                                            image: IMAGEURL +
                                                                _data
                                                                    .data
                                                                    .categories[
                                                                        i]
                                                                    .image
                                                                    .toString(),
                                                            id: _data
                                                                .data
                                                                .categories[i]
                                                                .id
                                                                .toString(),
                                                            name: _data
                                                                .data
                                                                .categories[i]
                                                                .name
                                                                .toString(),
                                                            islgin: widget
                                                                .isloading,
                                                            cityid:
                                                                widget.cityid,
                                                            countryid: widget
                                                                .countryid,
                                                          );
                                                        }));
                                                      },
                                                      child: EcentsWidget(
                                                          image: IMAGEURL +
                                                              _data
                                                                  .data
                                                                  .categories[i]
                                                                  .image
                                                                  .toString(),
                                                          tittel: _data
                                                              .data
                                                              .categories[i]
                                                              .name
                                                              .toString()),
                                                    )),
                                          ),
                                  ),
                                  // Container(
                                  //   margin:
                                  //       EdgeInsets.only(top: 20, bottom: 20),
                                  //   child: Row(
                                  //     children: <Widget>[
                                  //       InkWell(
                                  //         onTap: () {
                                  //           Navigator.push(context,
                                  //               MaterialPageRoute(
                                  //                   builder: (context) {
                                  //             return TasnefatPage2(
                                  //               data:
                                  //                   _data.data.recommendevents,
                                  //             );
                                  //           }));
                                  //         },
                                  //         child: Text(
                                  //           "عرض الجميع",
                                  //           style:
                                  //               TextStyle(fontFamily: "thin"),
                                  //         ),
                                  //       ),
                                  //       Text(
                                  //         "فعاليات اختارناها لك",
                                  //         style: TextStyle(fontFamily: "black"),
                                  //       ),
                                  //     ],
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //   ),
                                  // ),
                                  // Container(
                                  //   // height: MediaQuery.of(context).size.height,
                                  //   child: _data.data.recommendevents.length ==
                                  //           0
                                  //       ? Center(
                                  //           child: Text(
                                  //           "لا يوجد فعاليات",
                                  //           style: TextStyle(
                                  //               color: CommnWidget.commonColor,
                                  //               fontFamily: "black",
                                  //               fontWeight: FontWeight.bold),
                                  //           textAlign: TextAlign.center,
                                  //         ))
                                  //       : ListView.builder(
                                  //           shrinkWrap: true,
                                  //           physics:
                                  //               NeverScrollableScrollPhysics(),
                                  //           itemCount: _data
                                  //                       .data
                                  //                       .recommendevents
                                  //                       .length >
                                  //                   3
                                  //               ? 3
                                  //               : _data.data.recommendevents
                                  //                   .length,
                                  //           itemBuilder: (context, i) {
                                  //             return InkWell(
                                  //               onTap: () {
                                  //                 Navigator.push(context,
                                  //                     MaterialPageRoute(
                                  //                         builder: (context) {
                                  //                   return TasnefatDetails(
                                  //                     data: _data.data
                                  //                         .recommendevents[i],
                                  //                   );
                                  //                 }));
                                  //               },
                                  //               child: ChoosenEventCell(
                                  //                   image: IMAGEURL +
                                  //                       _data
                                  //                           .data
                                  //                           .recommendevents[i]
                                  //                           .image
                                  //                           .toString(),
                                  //                   day: DateTime.parse(_data
                                  //                       .data
                                  //                       .recommendevents[i]
                                  //                       .startDate
                                  //                       .toString()),
                                  //                   name: _data.data
                                  //                       .recommendevents[i].name
                                  //                       .toString(),
                                  //                   time:
                                  //                       DateTime.parse("2020-03-26 " + _data.data.recommendevents[i].startTime.toString())
                                  //                           .hour
                                  //                           .toString(),
                                  //                   location: _data.data
                                  //                       .recommendevents[i].city
                                  //                       .toString(),
                                  //                   lastdate: DateTime.parse(
                                  //                       _data.data.recommendevents[i].endDate.toString())),
                                  //             );
                                  //           },
                                  //         ),
                                  // )
                                ],
                              )),
                        )
                      ],
                    ),
                  ));
  }

  annonsment(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: CachedNetworkImage(
          imageUrl: IMAGEURL + image.toString(),
          placeholder: (context, url) => Center(
                child: CupertinoActivityIndicator(
                  radius: 17,
                  animating: true,
                ),
              ),
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height * .2,
          width: MediaQuery.of(context).size.width,
          errorWidget: (context, url, error) =>
              Icon(Icons.error, color: Colors.black)),
    );
  }
}
