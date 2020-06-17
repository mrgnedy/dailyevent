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
  EventModel event;

  Data({this.not, this.event});

  Data.fromJson(Map<String, dynamic> json) {
    not = json['not'] != null ? new Not.fromJson(json['not']) : null;
    event = json['event'] != null ? new EventModel.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.not != null) {
      data['not'] = this.not.toJson();
    }
    if (this.event != null) {
      data['event'] = this.event.toJson();
    }
    return data;
  }
}

class Not {
  int id;
  String title;
  String body;
  int subId;
  int userId;
  String delete;
  String createdAt;
  String updatedAt;

  Not(
      {this.id,
      this.title,
      this.body,
      this.subId,
      this.userId,
      this.delete,
      this.createdAt,
      this.updatedAt});

  Not.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    subId = json['sub_id'];
    userId = json['user_id'];
    delete = json['delete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['sub_id'] = this.subId;
    data['user_id'] = this.userId;
    data['delete'] = this.delete;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

