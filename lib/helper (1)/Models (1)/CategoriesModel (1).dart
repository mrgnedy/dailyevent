


import 'eventEventModel (1).dart';

class CategoryModel {
  String msg;
  Data data;

  CategoryModel({this.msg, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<EventModel> currentevents;
  List<EventModel> notcurrentevents;
  List<EventModel> finishevents;

  Data({this.currentevents, this.notcurrentevents, this.finishevents});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['currentevents'] != null) {
      currentevents = new List<EventModel>();
      json['currentevents'].forEach((v) {
        currentevents.add(new EventModel.fromJson(v));
      });
    }
    if (json['notcurrentevents'] != null) {
      notcurrentevents = new List<EventModel>();
      json['notcurrentevents'].forEach((v) {
        notcurrentevents.add(new EventModel.fromJson(v));
      });
    }
    if (json['finishevents'] != null) {
      finishevents = new List<EventModel>();
      json['finishevents'].forEach((v) {
        finishevents.add(new EventModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentevents != null) {
      data['currentevents'] =
          this.currentevents.map((v) => v.toJson()).toList();
    }
    if (this.notcurrentevents != null) {
      data['notcurrentevents'] =
          this.notcurrentevents.map((v) => v.toJson()).toList();
    }
    if (this.finishevents != null) {
      data['finishevents'] = this.finishevents.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Currentevents {
  int id;
  String name;
  String phone;
  String telephone;
  String startDate;
  String endDate;
  String lat;
  String lng;
  String address;
  String about;
  String startTime;
  String endTime;
  String ownerName;
  int userId;
  int catId;
  int cityId;
  String city;
  String country;
  int countryId;
  String image;
  Null views;
  String createdAt;
  String updatedAt;

  Currentevents(
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
      this.views,
      this.createdAt,
      this.updatedAt});

  Currentevents.fromJson(Map<String, dynamic> json) {
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
    views = json['views'];
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
    data['views'] = this.views;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}