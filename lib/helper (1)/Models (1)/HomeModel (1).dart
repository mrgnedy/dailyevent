
import 'eventEventModel (1).dart';

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
  List<EventModel> ads;
  List<EventModel> todayevents;
  List<Categories> categories;
  List<EventModel> recommendevents;

  Data({this.ads, this.todayevents, this.categories, this.recommendevents});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ads'] != null) {
      ads = new List<EventModel>();
      json['ads'].forEach((v) {
        ads.add(new EventModel.fromJson(v));
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


class Categories {
  int id;
  String name;
  String image;
  String ad;
  String createdAt;
  String updatedAt;

  Categories({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ad=json["ad"];
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