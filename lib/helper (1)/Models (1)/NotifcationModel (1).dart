

  import 'eventEventModel (1).dart';

class NotifcatinModel {
  String msg;
  Data data;

  NotifcatinModel({this.msg, this.data});

  NotifcatinModel.fromJson(Map<String, dynamic> json) {
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
  List<Eventnots> eventnots;
  List<Citynots> citynots;
  List<Countrynots> countrynots;
  List<Usersnots> usersnots;

  Data({this.eventnots, this.citynots, this.countrynots, this.usersnots});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['eventnots'] != null) {
      eventnots = new List<Eventnots>();
      json['eventnots'].forEach((v) {
        eventnots.add(new Eventnots.fromJson(v));
      });
    }
    if (json['citynots'] != null) {
      citynots = new List<Citynots>();
      json['citynots'].forEach((v) {
        citynots.add(new Citynots.fromJson(v));
      });
    }
    if (json['countrynots'] != null) {
      countrynots = new List<Countrynots>();
      json['countrynots'].forEach((v) {
        countrynots.add(new Countrynots.fromJson(v));
      });
    }
    if (json['usersnots'] != null) {
      usersnots = new List<Usersnots>();
      json['usersnots'].forEach((v) {
        usersnots.add(new Usersnots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eventnots != null) {
      data['eventnots'] = this.eventnots.map((v) => v.toJson()).toList();
    }
    if (this.citynots != null) {
      data['citynots'] = this.citynots.map((v) => v.toJson()).toList();
    }
    if (this.countrynots != null) {
      data['countrynots'] = this.countrynots.map((v) => v.toJson()).toList();
    }
    if (this.usersnots != null) {
      data['usersnots'] = this.usersnots.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Eventnots {
  Not not;
  EventModel event;

  Eventnots({this.not, this.event});

  Eventnots.fromJson(Map<String, dynamic> json) {
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
  int cityId;
  int type;
  int countryId;
  String createdAt;
  String updatedAt;

  Not(
      {this.id,
      this.title,
      this.body,
      this.subId,
      this.userId,
      this.delete,
      this.cityId,
      this.type,
      this.countryId,
      this.createdAt,
      this.updatedAt});

  Not.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    subId = json['sub_id'];
    userId = json['user_id'];
    delete = json['delete'];
    cityId = json['city_id'];
    type = json['type'];
    countryId = json['country_id'];
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
    data['city_id'] = this.cityId;
    data['type'] = this.type;
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

 
class Citynots {
  int id;
  String title;
  String body;
  int  subId;
  int userId;
  String delete;
  int cityId;
  int type;
  int countryId;
  String createdAt;
  String updatedAt;

  Citynots(
      {this.id,
      this.title,
      this.body,
      this.subId,
      this.userId,
      this.delete,
      this.cityId,
      this.type,
      this.countryId,
      this.createdAt,
      this.updatedAt});

  Citynots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    subId = json['sub_id'];
    userId = json['user_id'];
    delete = json['delete'];
    cityId = json['city_id'];
    type = json['type'];
    countryId = json['country_id'];
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
    data['city_id'] = this.cityId;
    data['type'] = this.type;
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Countrynots {
  int id;
  String title;
  String body;
  Null subId;
  Null userId;
  String delete;
  Null cityId;
  int type;
  int countryId;
  String createdAt;
  String updatedAt;

  Countrynots(
      {this.id,
      this.title,
      this.body,
      this.subId,
      this.userId,
      this.delete,
      this.cityId,
      this.type,
      this.countryId,
      this.createdAt,
      this.updatedAt});

  Countrynots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    subId = json['sub_id'];
    userId = json['user_id'];
    delete = json['delete'];
    cityId = json['city_id'];
    type = json['type'];
    countryId = json['country_id'];
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
    data['city_id'] = this.cityId;
    data['type'] = this.type;
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Usersnots {
  int id;
  String title;
  String body;
  int subId;
  int userId;
  String delete;
  int cityId;
  int type;
  int countryId;
  String createdAt;
  String updatedAt;

  Usersnots(
      {this.id,
      this.title,
      this.body,
      this.subId,
      this.userId,
      this.delete,
      this.cityId,
      this.type,
      this.countryId,
      this.createdAt,
      this.updatedAt});

  Usersnots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    subId = json['sub_id'];
    userId = json['user_id'];
    delete = json['delete'];
    cityId = json['city_id'];
    type = json['type'];
    countryId = json['country_id'];
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
    data['city_id'] = this.cityId;
    data['type'] = this.type;
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}