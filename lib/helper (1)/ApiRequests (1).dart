import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Models (1)/CategoriesModel (1).dart';
import 'Models (1)/CountryModel (1).dart';
import 'Models (1)/FavouriteModel (1).dart';
import 'Models (1)/HomeModel (1).dart';
import 'Models (1)/NotifcationModel (1).dart';
import 'Models (1)/RegesterModel (1).dart';
import 'Models (1)/SearchModel (1).dart';
import 'Models (1)/SettingModel (1).dart';
import 'Models (1)/searchResult (1).dart';
import 'data (1).dart';
import 'dataUser (1).dart';



class ApiRequests {
  DataUser _dataUser = DataUser.instance;
  Future<bool> signup(String name, String email, String phone, String lat,
      String long, String password, String googletoken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(email);
    print(password);

    final url = 'http://daillyevent.net/api/register';
    try {
      final response = await http.post(
        url,
        body: {
          'full_name': name,
          'email': email,
          'phone': phone,
          'city_id': lat,
          'country_id': long,
          // 'address': address,
          'password': password,
          'google_token': googletoken,
        },
      );
      print("--------------------------------");
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData["msg"] == "success") {
          var upaderesponse = RegesterModel.fromJson(responseData);

          pref.setString(Token, upaderesponse.apiToken.toString());
          pref.setString(Id, upaderesponse.data.id.toString());
          pref.setString(Email, upaderesponse.data.email.toString());
          pref.setString(NOTIFY, upaderesponse.data.notify.toString());
          pref.setString(ProfileImage, upaderesponse.data.image.toString());
          // pref.setString ("verfied",upaderesponse.data.confirmed.toString()=="1"?"1":"0");
          //
          pref.setString(Name, upaderesponse.data.fullName.toString());
          pref.setString(CityId, upaderesponse.data.cityId.toString());
          pref.setString(CityName, upaderesponse.data.city.toString());
          pref.setString(Countryid, upaderesponse.data.countryId.toString());
          _dataUser.setKey({
            'key': MobileNumber,
            'value': upaderesponse.data.phone.toString()
          });
          pref.setString(MobileNumber, upaderesponse.data.phone.toString());
          pref.setString(Countryname, upaderesponse.data.country.toString());
          // _dataUser.setKey(
          //     {'key': Name, 'value': upaderesponse.data.fullName.toString()});
          _dataUser.setKey(
              {'key': CityId, 'value': upaderesponse.data.cityId.toString()});
          _dataUser.setKey(
              {'key': CityName, 'value': upaderesponse.data.city.toString()});
          _dataUser.setKey({
            'key': Countryid,
            'value': upaderesponse.data.countryId.toString()
          });
          _dataUser.setKey({
            'key': Countryname,
            'value': upaderesponse.data.country.toString()
          });
          _dataUser.setKey(
              {'key': Name, 'value': upaderesponse.data.fullName.toString()});

          _dataUser.setKey({
            'key': MobileNumber,
            'value': upaderesponse.data.phone.toString()
          });

          //
          _dataUser.setKey({
            'key': ProfileImage,
            'value': upaderesponse.data.image.toString()
          });
          _dataUser.setKey(
              {'key': NOTIFY, 'value': upaderesponse.data.notify.toString()});

          _dataUser.setKey(
              {'key': Token, 'value': upaderesponse.apiToken.toString()});
          _dataUser
              .setKey({'key': Id, 'value': upaderesponse.data.id.toString()});
          _dataUser.setKey(
              {'key': Email, 'value': upaderesponse.data.email.toString()});

          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }

  Future<bool> changenotify(String message) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("in change");
    print(message);
    String token = pref.getString(Token);
    final url = 'http://daillyevent.net/api/upnotify';
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "notify": message,
          }),
          headers: {
            'Authorization':
                'Bearer ${token}', //Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });
      print("--------------------------------");
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData["msg"] == "success") {
          if (message == "1") {
            pref.setString(NOTIFY, "1");

            _dataUser.setKey({'key': NOTIFY, 'value': "1"});
          } else {
            pref.setString(NOTIFY, "0");

            _dataUser.setKey({'key': NOTIFY, 'value': "0"});
          }

          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }

  Future<bool> resendverfiyedCode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("in unction");
    // print(message);
    String token = pref.getString(Token);
    final url = 'http://daillyevent.net/api/resend-phone-verify';
    try {
      final response = await http.post(url, body: {}, headers: {
        'Authorization':
            'Bearer ${token}', //Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("--------------------------------");
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData["msg"] == "success") {
          pref.setString(Confirmed, "1");

          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }

  Future<bool> sendverfiyedCode(String message) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("in unction");
    print(message);
    String token = pref.getString(Token);
    final url = 'http://daillyevent.net/api/phone-verify';
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "code": message,
          }),
          headers: {
            'Authorization':
                'Bearer ${token}', //Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });
      print("--------------------------------");
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData["msg"] == "success") {
          pref.setString("verfied", "1");

          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }

  Future<bool> sendverfiyedCodephone(String message, String phone) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("in unction");
    print(message);
    String token = pref.getString(Token);
    final url = 'http://daillyevent.net/api/verify-forget-password';
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "email": phone,
            "code": message,
          }),
          headers: {
            // 'Authorization':
            //     'Bearer ${token}', //Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });
      print("--------------------------------");
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData["msg"] == "success") {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }
 Future<bool> viewEvent(String message) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("in unction");
    print(message);
    String token = pref.getString(Token);
    final url = 'http://daillyevent.net/api/showevent';
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "event_id": message,
          }),
          headers: {
            // 'Authorization':
            //     'Bearer ${token}', //Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });
      print("--------------------------------");
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData["msg"] == "success") {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }
  Future<bool> contactus(String message) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("in unction");
    print(message);
    String token = pref.getString(Token);
    final url = 'http://daillyevent.net/api/addcontact';
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "message": message,
          }),
          headers: {
            'Authorization':
                'Bearer ${token}', //Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });
      print("--------------------------------");
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData["msg"] == "success") {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }

  Future<bool> addcatogry(
      String name,
      String startdate,
      String enddate,
      String starttime,
      String endtime,
      String countryid,
      String cityid,
      String catid,
      String lat,
      String long,
      String phone,
      String telphone,
      String about,
      String ownername,
      String address,
      File imagefile) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    //String email = pref.getString(Utility.Email);
    print("hhhhhhhhhhhhhhhhhhhhh");
    print(imagefile.path.split('/').last);
    print("Bearer $token");
    Dio dio = new Dio();

    FormData formData = FormData();
    formData.fields..add(MapEntry('api_token', token));
    formData.fields..add(MapEntry('name', name));
    formData.fields..add(MapEntry('start_date', startdate));
    formData.fields..add(MapEntry('end_date', enddate));
    formData.fields..add(MapEntry('start_time', starttime));
    formData.fields..add(MapEntry('end_time', endtime));
    formData.fields..add(MapEntry('country_id', countryid));
    formData.fields..add(MapEntry('city_id', cityid));
    formData.fields..add(MapEntry('cat_id', catid));
    formData.fields..add(MapEntry('lng', lat));
    formData.fields..add(MapEntry('lat', long));
    formData.fields..add(MapEntry('address', address));
    formData.fields..add(MapEntry('phone', phone));
    formData.fields..add(MapEntry('telephone', telphone));
    formData.fields..add(MapEntry('about', about));
    formData.fields..add(MapEntry('owner_name', ownername));

    formData.files.add(MapEntry(
      'image',
      await MultipartFile.fromFile(imagefile.path,
          filename: imagefile.path.split('/').last),
    ));

    print("befor");
    print("Bearer $token");
    try {
      final response = await dio.post(
        "http://daillyevent.net/api/addevent",
        data: formData,
        onSendProgress: (int sent, int total) {
          print("$sent $total");
        },
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print("after");
      print("ssssssssssssssssssssssssss");
      print(response);
      if (response.data["msg"] == "success") {
        return true;
      } else if (response.data["msg"] == "error") {
        //errormessage = response.data['data'].toString();
        return false;
      }
    } catch (e) {
      print("-------add room function error");
      print(e);
      return null;
    }
  }

  Future<bool> editeProfile(String name, String phone, String lat, String long,
      String address, String email, File imagefile) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    //String email = pref.getString(Utility.Email);
    print("hhhhhhhhhhhhhhhhhhhhh");
    // print(imagefile.path.split('/').last);
    print("Bearer $token");
    Dio dio = new Dio();

    FormData formData = FormData();
    formData.fields..add(MapEntry('api_token', token));
    formData.fields..add(MapEntry('full_name', name));
    formData.fields..add(MapEntry('phone', phone));
    formData.fields..add(MapEntry('country_id', lat));
    formData.fields..add(MapEntry('city_id', long));
    //  'city_id': lat,
    //       'country_id': long,
    // formData.fields..add(MapEntry('address', address));
    formData.fields..add(MapEntry('email', email));

    if (imagefile != null) {
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(imagefile.path,
            filename: imagefile.path.split('/').last),
      ));
    }

    print("befor");
    print("Bearer $token");
    try {
      final response = await dio.post(
        "http://daillyevent.net/api/editprofile",
        data: formData,
        onSendProgress: (int sent, int total) {
          print("$sent $total");
        },
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print("after");
      print("ssssssssssssssssssssssssss");
      print(response);
      if (response.statusCode == 200) {
        // final responseData = json.decode(response.data);

        if (response.data["msg"] == "success") {
          //
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }

  Future<bool> getProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    // print(password);

    final url = 'http://daillyevent.net/api/profile';
    try {
      final response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${token}', //Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("--------------------------------");
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData["msg"] == "success") {
          var upaderesponse = RegesterModel.fromJson(responseData);

          pref.setString(Id, upaderesponse.data.id.toString());
          pref.setString(Email, upaderesponse.data.email.toString());
          pref.setString(NOTIFY, upaderesponse.data.notify.toString());
          pref.setString(ProfileImage, upaderesponse.data.image.toString());
          _dataUser.setKey({
            'key': ProfileImage,
            'value': upaderesponse.data.image.toString()
          });
          _dataUser.setKey(
              {'key': NOTIFY, 'value': upaderesponse.data.notify.toString()});

          _dataUser
              .setKey({'key': Id, 'value': upaderesponse.data.id.toString()});
          _dataUser.setKey(
              {'key': Email, 'value': upaderesponse.data.email.toString()});
          //
          pref.setString(Name, upaderesponse.data.fullName.toString());

          pref.setString(CityId, upaderesponse.data.cityId.toString());
          pref.setString(CityName, upaderesponse.data.city.toString());
          pref.setString(Countryid, upaderesponse.data.countryId.toString());

          pref.setString(Countryname, upaderesponse.data.country.toString());
          // _dataUser.setKey(
          //     {'key': Name, 'value': upaderesponse.data.fullName.toString()});
          _dataUser.setKey(
              {'key': CityId, 'value': upaderesponse.data.cityId.toString()});
          _dataUser.setKey(
              {'key': CityName, 'value': upaderesponse.data.city.toString()});
          _dataUser.setKey({
            'key': Countryid,
            'value': upaderesponse.data.countryId.toString()
          });
          _dataUser.setKey({
            'key': Countryname,
            'value': upaderesponse.data.country.toString()
          });
          _dataUser.setKey({
            'key': MobileNumber,
            'value': upaderesponse.data.phone.toString()
          });
          pref.setString(MobileNumber, upaderesponse.data.phone.toString());

          //
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }

  Future<bool> sendEmail(String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    final url = 'http://daillyevent.net/api/send-forget-password';
    try {
      final response = await http.post(
        url,
        headers: {
          // 'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: {
          'email': email,
        },
      );
      print("--------------------------------");
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData["msg"] == "success") {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }

  Future<bool> login(String phone, String password, String googletoken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    print(password);

    final url = 'http://daillyevent.net/api/login';
    try {
      final response = await http.post(
        url,
        body: {
          'phone': phone,
          'password': password,
          'google_token': googletoken,
        },
      );
      print("--------------------------------");
      // print(json.decode(response.body));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("----------------------1111111111111111111111111111112");
        if (responseData["msg"] == "success") {
          print("----------------------111111111111111111111111111111");
          print(responseData["country_id"].toString());
          var upaderesponse = RegesterModel.fromJson(responseData);

          pref.setString(Token, upaderesponse.apiToken.toString());
          pref.setString(Confirmed, "1");
          pref.setString(Id, upaderesponse.data.id.toString());
          pref.setString(Email, upaderesponse.data.email.toString());
          pref.setString(NOTIFY, upaderesponse.data.notify.toString());
          pref.setString(ProfileImage, upaderesponse.data.image.toString());
          _dataUser.setKey({
            'key': ProfileImage,
            'value': upaderesponse.data.image.toString()
          });
          _dataUser.setKey({
            'key': MobileNumber,
            'value': upaderesponse.data.phone.toString()
          });
          pref.setString(MobileNumber, upaderesponse.data.phone.toString());
          _dataUser.setKey(
              {'key': NOTIFY, 'value': upaderesponse.data.notify.toString()});
          _dataUser.setKey(
              {'key': Token, 'value': upaderesponse.apiToken.toString()});
          _dataUser
              .setKey({'key': Id, 'value': upaderesponse.data.id.toString()});
          _dataUser.setKey(
              {'key': Email, 'value': upaderesponse.data.email.toString()});
          print("----------------------111111111111111111111111111111");
          // print(responseData["country_id"].toString());

          pref.setString(Name, upaderesponse.data.fullName.toString());
          pref.setString(CityId, upaderesponse.data.cityId.toString());
          pref.setString(CityName, upaderesponse.data.city.toString());
          pref.setString(Countryid, upaderesponse.data.countryId.toString());

          pref.setString(Countryname, upaderesponse.data.country.toString());
          // _dataUser.setKey(
          //     {'key': Name, 'value': upaderesponse.data.fullName.toString()});
          _dataUser.setKey(
              {'key': CityId, 'value': upaderesponse.data.cityId.toString()});
          _dataUser.setKey(
              {'key': CityName, 'value': upaderesponse.data.city.toString()});
          _dataUser.setKey({
            'key': Countryid,
            'value': upaderesponse.data.countryId.toString()
          });
          _dataUser.setKey({
            'key': Countryname,
            'value': upaderesponse.data.country.toString()
          });
          _dataUser.setKey(
              {'key': Name, 'value': upaderesponse.data.fullName.toString()});

          _dataUser.setKey({
            'key': MobileNumber,
            'value': upaderesponse.data.phone.toString()
          });

          //
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("-----------------error login------------");
      print(e);
      return null;
    }
  }

  Future<NotifcatinModel> getNotifcation() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://daillyevent.net/api/notifications';
    try {
      final response = await http.get(url, headers: {
        'Authorization':
            'Bearer $token', //Twfo7yQ2mYLiwhDLe3JTzT6ncmOgcSiFjN1VKBxj81EFWi7eQIdcIEnx0IkjVneV2DBDQrgwpzMhg5IGOMFgKosjLvr9etV6JHW9', //$token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      //  final responseData = json.decode(response.body);
      //    print(responseData);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          var data = NotifcatinModel.fromJson(responseData);
          return data;
        } else {
          print(responseData.toString());
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<FavouriteMocel> getfavorite() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://daillyevent.net/api/myfavourites';
    try {
      final response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${token}', // 'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          var data = FavouriteMocel.fromJson(responseData);
          return data;
        } else {
          print(responseData.toString());
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<SettingModel> getsetting() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://daillyevent.net/api/settinginfo';
    try {
      final response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${token}', //  'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          var data = SettingModel.fromJson(responseData);
          return data;
        } else {
          print(responseData.toString());
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<HomeModel> getHomeData2(String countryid, String cityid) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    // String token = pref.getString(Token);
    print("mahmoudl");
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    // print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://daillyevent.net/api/unauthhome';
    try {
      final response = await http.post(url, body: {
        "city_id": cityid,
        "country_id": countryid,
      }, headers: {
        // 'Authorization':
        //       'Bearer ${token}',//'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          var data = HomeModel.fromJson(responseData);
          return data;
        } else {
          print(responseData.toString());
          return null;
        }
      } else {
        print("hhhhhhhhhhhhhhhhh");
        print(response.statusCode);
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<HomeModel> getHomeData() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    print("mahmoudl");
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://daillyevent.net/api/home';
    try {
      final response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${token}', //'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          var data = HomeModel.fromJson(responseData);
          return data;
        } else {
          print(responseData.toString());
          return null;
        }
      } else {
        print("hhhhhhhhhhhhhhhhh");
        print(response.statusCode);
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<SearchMModel> getsearchdata() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://daillyevent.net/api/searchdate';
    try {
      final response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${token}', // 'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          var data = SearchMModel.fromJson(responseData);
          return data;
        } else {
          print(responseData.toString());
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<CountryModel> getCounry() async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://daillyevent.net/api/countries';
    try {
      final response = await http.get(url, headers: {
        'Authorization':
            'Bearer ${token}', // 'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          var data = CountryModel.fromJson(responseData);
          return data;
        } else {
          print(responseData.toString());
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<SearchResult> getsearch(String catid, String countryid, String cityid,
      String startdate, String enddate) async {
    print("get joinde search function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);

    final url = 'http://daillyevent.net/api/search';
    try {
      final response = await http.post(url, body: {
        if (catid.toString() != "null") "cat_id": catid.toString(),
        if (countryid.toString() != "null") "country_id": countryid.toString(),
        if (cityid.toString() != "null") "city_id": cityid.toString(),
        if (startdate.toString() != "null") "start_date": startdate.toString(),
        if (enddate.toString() != "null") "end_date": enddate.toString(),
      }, headers: {
        'Authorization':
            'Bearer ${token}', //   'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          var data = SearchResult.fromJson(responseData);
          return data;
        } else {
          print(responseData.toString());
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<bool> geletefavorite(String id) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
    print(id);

    final url = 'http://daillyevent.net/api/deletefavourite';
    try {
      final response = await http.post(url, body: {
        "fav_id": id.toString()
      }, headers: {
        'Authorization':
            'Bearer ${token}', //   'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          // var data = CategoryModel.fromJson(responseData);
          return true;
        } else {
          print(responseData.toString());
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<bool> deletenotifcation(String id) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print(id);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://daillyevent.net/api/deletenotification';
    try {
      final response = await http.post(url, body: {
        "not_id": id.toString()
      }, headers: {
        'Authorization':
            'Bearer ${token}', // 'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") { 
          print("data");

          // var data = CategoryModel.fromJson(responseData);
          return true;
        } else {
          print(responseData.toString());
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<bool> changepassword2(String password, String phone) async {
    print("get joinde room function ");
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // String token = pref.getString(Token);
    // String phone = pref.getString(MobileNumber);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    // print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
    print(phone);
    print(password);

    final url = 'http://daillyevent.net/api/rechangepass';
    try {
      final response = await http.post(url, body: {
        "email": phone,
        "new_pass": password.toString(),
        "confirm_pass": password.toString(),
      }, headers: {
        // 'Authorization':
        //  'Bearer ${token}',// 'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      print("--------------mahmoud");
         final responseData = json.decode(response.body);
         print(responseData);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          // var data = CategoryModel.fromJson(responseData);
          return true;
        } else {
          // print(responseData.toString());
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<bool> changepassword(String password) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    String phone = pref.getString(MobileNumber);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://daillyevent.net/api/rechangepass';
    try {
      final response = await http.post(url, body: {
        "email": phone,
        "new_pass": password.toString(),
        "confirm_pass": password.toString(),
      }, headers: {
        'Authorization':
            'Bearer ${token}', // 'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          // var data = CategoryModel.fromJson(responseData);
          return true;
        } else {
          print(responseData.toString());
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<bool> setfavorite(String id) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://daillyevent.net/api/addfavourite';
    try {
      final response = await http.post(url, body: {
        "sub_id": id.toString()
      }, headers: {
        'Authorization':
            'Bearer ${token}', // 'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          // var data = CategoryModel.fromJson(responseData);
          return true;
        } else {
          print(responseData.toString());
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<CategoryModel> getCatergory2(
      String id, String cityid, String countryid) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");
    print(id);
    print(cityid);
    print(countryid);
    final url = 'http://daillyevent.net/api/showunauthcategory';
    try {
      final response = await http.post(url, body: {
        "cat_id": id.toString(),
        'city_id': cityid.toString(),
        "country_id": countryid.toString()
      }, headers: {
        // 'Authorization':
        //     'Bearer ${token}', //'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          var data = CategoryModel.fromJson(responseData);
          return data;
        } else {
          print(responseData.toString());
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }

  Future<CategoryModel> getCatergory(String id) async {
    print("get joinde room function ");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString(Token);
    print("hhhhhhhhhhhhhhhhhhhhhhh");
    print(token);
    print("hhhhhhhhhhhhhhhhhhhhhhhq2");

    final url = 'http://daillyevent.net/api/showcategory';
    try {
      final response = await http.post(url, body: {
        "cat_id": id.toString()
      }, headers: {
        'Authorization':
            'Bearer ${token}', //'Bearer Ae1yIjbfO75e3K670cq8knv6VBBYaj6C0yXfVgmNidOZteaxoAZB68MWpr5j44IXwD5SSVmjF2q8d9VKkn86tUDHQHaRcw06uRm8', //$token',
        // 'Content-Type': 'application/json',
        'Accept': 'application/json'
      });
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        print(responseData);
        if (responseData["msg"] == "success") {
          print("data");

          var data = CategoryModel.fromJson(responseData);
          return data;
        } else {
          print(responseData.toString());
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("----------------discution function-------------");
      print(e);
      return null;
    }
  }
}
