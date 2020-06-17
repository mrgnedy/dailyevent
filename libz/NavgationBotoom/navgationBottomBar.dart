import 'dart:async';

import 'package:events/Commnwidget.dart';
// import 'package:events/NavgationBotoom/AddPage.dart';
import 'package:events/NavgationBotoom/HomePage.dart';
import 'package:events/NavgationBotoom/SearchPage.dart';
import 'package:events/NavgationBotoom/addCategory/AddPage.dart';

import 'package:events/NavgationBotoom/favoritePage.dart';
import 'package:events/NavgationBotoom/setting/SettingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomNavigationsBar extends StatefulWidget {
  final bool islogin;
  final String countryid;
  final String cityid;
  BottomNavigationsBar({this.islogin,this.cityid,this.countryid});
  @override
  _BottomNavigationsBarState createState() => _BottomNavigationsBarState();
}

class _BottomNavigationsBarState extends State<BottomNavigationsBar> {
  PageController _myPage = PageController(initialPage: 4);
  bool _homeClicked = true;
  bool _searchClick = false;
  bool _settingClicked = false;
  bool _favoriteClicked = false;
  bool _addClicked = false;
  Future<bool> _onBackPressed() {
    return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: new Text(
              "هل تريد اغلاق التطبيق؟ ",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Cairo',
                  color: CommnWidget.commonColor),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  "لا",
                  style: TextStyle(color: CommnWidget.commonColor),
                ),
              ),
              new FlatButton(
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                child: new Text(
                  "نعم",
                  style: TextStyle(color: CommnWidget.commonColor),
                ),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    print("sssssssssssssssssssssssssssssssss");
    print(widget.countryid);
    print(widget.cityid);
    print(widget.islogin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
  
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: CommnWidget.commonColor),
          backgroundColor: Colors.white,
          onPressed: () {
            setState(() {
              print('22222222222222222');
              _homeClicked = false;
              _searchClick = false;
              _settingClicked = false;
              _favoriteClicked = false;
              _addClicked = true;
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return AddPage(isloading:widget.islogin ,);
              })).then((value){
                 setState(() {
                      _homeClicked = true;
                      _searchClick = false;
                      _settingClicked = false;
                      _favoriteClicked = false;
                      _addClicked = false;
                      _myPage.jumpToPage(4);
                    });
              });
              // _myPage.jumpToPage(2);
            });
          },
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(4),
            //height: MediaQuery.of(context).size.height * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: !_settingClicked
                        ? Colors.grey
                        : CommnWidget.commonColor,
                  ),
                  onPressed: () {
                    setState(() {
                      print('22222222222222222');
                      _homeClicked = false;
                      _searchClick = false;
                      _settingClicked = true;
                      _favoriteClicked = false;
                      _addClicked = false;
                      _myPage.jumpToPage(0);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite_border, //:_homeClicked,
                    color: !_favoriteClicked
                        ? Colors.grey
                        : CommnWidget.commonColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _homeClicked = false;
                      _searchClick = false;
                      _settingClicked = false;
                      _favoriteClicked = true;
                      _addClicked = false;
                      _myPage.jumpToPage(1);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color:
                        !_searchClick ? Colors.grey : CommnWidget.commonColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _homeClicked = false;
                      _searchClick = true;
                      _settingClicked = false;
                      _favoriteClicked = false;
                      _addClicked = false;
                      _myPage.jumpToPage(3);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color:
                        !_homeClicked ? Colors.grey : CommnWidget.commonColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _homeClicked = true;
                      _searchClick = false;
                      _settingClicked = false;
                      _favoriteClicked = false;
                      _addClicked = false;
                      _myPage.jumpToPage(4);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          controller: _myPage,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            if (index == 0) {
              setState(() {
                _homeClicked = false;
                _searchClick = false;
                _settingClicked = true;
                _favoriteClicked = false;
                _addClicked = false;
              });
            } else if (index == 1) {
              setState(() {
                _homeClicked = false;
                _searchClick = false;
                _settingClicked = false;
                _favoriteClicked = true;
                _addClicked = false;
              });
            } else if (index == 2) {
              setState(() {
                _homeClicked = false;
                _searchClick = false;
                _settingClicked = false;
                _favoriteClicked = false;
                _addClicked = true;
              });
            }else if (index == 3) {
              setState(() {
                _homeClicked = false;
                _searchClick = true;
                _settingClicked = false;
                _favoriteClicked = false;
                _addClicked = false;
              });
            }else if (index == 4) {
              setState(() {
                _homeClicked = true;
                _searchClick = false;
                _settingClicked = false;
                _favoriteClicked = false;
                _addClicked = false;
              });
            }

            print('Page Changes to index $index');
          },
          children: <Widget>[
          
       
         
         
            SettingPage(isloading: widget.islogin,),   FavoritePage(isloading:widget.islogin ,),   AddPage(isloading:widget.islogin ,),     SearchPage(),  HomePage(isloading: widget.islogin,cityid: widget.cityid,countryid: widget.countryid,),
          ],
        ),
      ),
    );
  }
}
