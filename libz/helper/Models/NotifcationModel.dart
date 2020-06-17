import 'package:events/helper/Models/eventEventModel.dart';

class NotifcatinModel {
  String msg;
  List<Data> data;

  NotifcatinModel({this.msg, this.data});

  NotifcatinModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Not not;
  List<EventModel> event;

  Data({this.not, this.event});

  Data.fromJson(Map<String, dynamic> json) {
    not = json['not'] != null ? new Not.fromJson(json['not']) : null;
    if (json['event'] != null) {
      event = new List<EventModel>();
      json['event'].forEach((v) {
        event.add(new EventModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.not != null) {
      data['not'] = this.not.toJson();
    }
    if (this.event != null) {
      data['event'] = this.event.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Not {
  int id;
  String title;
  String body;
  int subId;
  String createdAt;
  String updatedAt;

  Not(
      {this.id,
      this.title,
      this.body,
      this.subId,
      this.createdAt,
      this.updatedAt});

  Not.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    subId = json['sub_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['sub_id'] = this.subId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Event {
  int id;
  String name;
  String phone;
  String telephone;
  String startDate;
  String endDate;
  Null lat;
  Null lng;
  String address;
  String about;
  String startTime;
  String endTime;
  String ownerName;
  Null userId;
  int catId;
  int cityId;
  String city;
  String country;
  int countryId;
  String image;
  String createdAt;
  String updatedAt;

  Event(
      {this.id,
      this.name,
      this.phone,
      this.telephone,
      this.startDate,
      this.endDate,
      this.lat,
      this.lng,
      this.address,
      this.about,
      this.startTime,
      this.endTime,
      this.ownerName,
      this.userId,
      this.catId,
      this.cityId,
      this.city,
      this.country,
      this.countryId,
      this.image,
      this.createdAt,
      this.updatedAt});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    telephone = json['telephone'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    about = json['about'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    ownerName = json['owner_name'];
    userId = json['user_id'];
    catId = json['cat_id'];
    cityId = json['city_id'];
    city = json['city'];
    country = json['country'];
    countryId = json['country_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['telephone'] = this.telephone;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    data['about'] = this.about;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['owner_name'] = this.ownerName;
    data['user_id'] = this.userId;
    data['cat_id'] = this.catId;
    data['city_id'] = this.cityId;
    data['city'] = this.city;
    data['country'] = this.country;
    data['country_id'] = this.countryId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}