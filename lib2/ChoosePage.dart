
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Commnwidget.dart';
import 'NavgationBotoom/SearchCountry.dart';
import 'NavgationBotoom/navgationBottomBar.dart';
import 'NavgationBotoom/searchcity.dart';
import 'helper/ApiRequests.dart';
import 'helper/Models/SearchModel.dart';
class ChoosePage extends StatefulWidget {
  @override
  _ChoosePageState createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {

bool  _isLoading2 =true;
  String countryname = "اختر اسم الدولة";
    int countryid;
  int cityid;
  String cityname = "اختر اسم المدينة";
   Cities cityitem;
   SearchMModel _data;
   ApiRequests _apiRequests = new ApiRequests();
     Eachcountry searchcontyitem;
      GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool check = false;
  final _formKey = GlobalKey<FormState>();
  getdata() {
    _apiRequests.getsearchdata().then((value) {
      print(value);
      setState(() {
        _data = value;

         _isLoading2 = false;
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
      key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              "اختار العنوان",
              style: TextStyle(
                  color: CommnWidget.commonColor, fontFamily: "black"),
            ),
          ),
        ),
        body: Form(
          key: _formKey,
                  child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
           child:  _isLoading2
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
                    :SingleChildScrollView(
                      child: Card(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
Column(  crossAxisAlignment: CrossAxisAlignment.end,children: <Widget>[
  Text(
                                    "الدولة",
                                    style: TextStyle(
                                        color: Colors.black, fontFamily: "black"),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DoctorSearch(
                                                                  data: _data)))
                                                  .then((chooseProduct) {
                                                // print("-product in home");
                                                // print(chooseProduct['DoctorName']);
                                                // print(chooseProduct['DoctorId']);
                                                if (chooseProduct != null) {
                                                  setState(() {
                                                    countryname =
                                                        chooseProduct['DoctorName']??null;
                                                    countryid =
                                                        chooseProduct['DoctorId']??null;
                                                    searchcontyitem = chooseProduct[
                                                        'searchcontyitem']??null;
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
                                  Divider(),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "المدينة",
                                    style: TextStyle(
                                        color: Colors.black, fontFamily: "black"),
                                  ),
                                  Row(
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
                                                          chooseProduct['DoctorName']??null;
                                                      cityid =
                                                          chooseProduct['DoctorId']??null;
                                                      cityitem = chooseProduct[
                                                          'searchcontyitem']??null;
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
                                  Divider(),
                                ],
                              ),
                             
SizedBox(height: 30),

InkWell(
  
  onTap: (){
    validate();
      },
      
      child: CommnWidget.commnbtn("استمرار", context))
    
    
                            ],),
                                              ),
                      ),
                        )
               
              ),
        ),
          
        );
      }
    
      void validate() {

    if (_formKey.currentState.validate()) {
      //  print(location);
      _formKey.currentState.save();
         if (countryid == null || countryid.toString().isEmpty) {
        showInSnackBar(" رجاء ادخل الدولة  ");
        return;
      }
      if (cityid == null || cityid.toString().isEmpty) {
        showInSnackBar("رجاء ادخل المدينة");

        return;
      }
      
      Navigator.push(context, MaterialPageRoute(builder: (context){
return BottomNavigationsBar(islogin: false,cityid: cityid.toString(),countryid:countryid.toString() ,);
      }));
      }

   
}
    void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        behavior: SnackBarBehavior.fixed,
        backgroundColor: CommnWidget.commonColor,
        content: new Text(
          value,
          textAlign: TextAlign.right,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "thin"),
        ),
      ),
    );
  }

}