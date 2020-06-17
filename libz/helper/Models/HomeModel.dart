import 'package:events/helper/Models/eventEventModel.dart';

class HomeModel {
  String msg;
  Data data;

  HomeModel({this.msg, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<Ads> ads;
  List<EventModel> todayevents;
  List<Categories> categories;
  List<EventModel> recommendevents;

  Data({this.ads, this.todayevents, this.categories, this.recommendevents});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ads'] != null) {
      ads = new List<Ads>();
      json['ads'].forEach((v) {
        ads.add(new Ads.fromJson(v));
      });
    }
    if (json['todayevents'] != null) {
      todayevents = new List<EventModel>();
      json['todayevents'].forEach((v) {
        todayevents.add(new EventModel.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['recommendevents'] != null) {
      recommendevents = new List<EventModel>();
      json['recommendevents'].forEach((v) {
        recommendevents.add(new EventModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ads != null) {
      data['ads'] = this.ads.map((v) => v.toJson()).toList();
    }
    if (this.todayevents != null) {
      data['todayevents'] = this.todayevents.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.recommendevents != null) {
      data['recommendevents'] =
          this.recommendevents.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ads {
  int id;
  String image;
  String createdAt;
  String updatedAt;

  Ads({this.id, this.image, this.createdAt, this.updatedAt});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Todayevents {
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

  Todayevents(
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

  Todayevents.fromJson(Map<String, dynamic> json) {
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

class Categories {
  int id;
  String name;
  String image;
  String createdAt;
  String updatedAt;

  Categories({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}