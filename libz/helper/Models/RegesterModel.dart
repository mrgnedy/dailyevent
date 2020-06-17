class RegesterModel {
  String msg;
  String apiToken;
  Data data;

  RegesterModel({this.msg, this.apiToken, this.data});

  RegesterModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    apiToken = json['api_token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['api_token'] = this.apiToken;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String fullName;
  String email;
  String phone;
  dynamic  lat;
  dynamic lng;
  String address;
  String type;
  String image;
  int notify;
  int confirmed;
  String apiToken;
  String googleToken;
  String updatedAt;
  String createdAt;
  int id;

  Data(
      {this.fullName,
      this.email,
      this.phone,
      this.lat,
      this.lng,
      this.address,
      this.type,
      this.image,
      this.notify,
      this.confirmed,
      this.apiToken,
      this.googleToken,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    type = json['type'];
    image = json['image'];
    notify = json['notify'];
    confirmed = json['confirmed'];
    apiToken = json['api_token'];
    googleToken = json['google_token'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['address'] = this.address;
    data['type'] = this.type;
    data['image'] = this.image;
    data['notify'] = this.notify;
    data['confirmed'] = this.confirmed;
    data['api_token'] = this.apiToken;
    data['google_token'] = this.googleToken;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}