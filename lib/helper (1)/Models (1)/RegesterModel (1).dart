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
  int id;
  String fullName;
  String phone;
  String image;
  String type;
  int confirmed;
  int notify;
  int cityId;
  String city;
  String country;
  int countryId;
  String email;
  Null emailVerifiedAt;
  String apiToken;
  String googleToken;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.fullName,
      this.phone,
      this.image,
      this.type,
      this.confirmed,
      this.notify,
      this.cityId,
      this.city,
      this.country,
      this.countryId,
      this.email,
      this.emailVerifiedAt,
      this.apiToken,
      this.googleToken,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phone = json['phone'];
    image = json['image'];
    type = json['type'];
    confirmed = json['confirmed'];
    notify = json['notify'];
    cityId = json['city_id'];
    city = json['city'];
    country = json['country'];
    countryId = json['country_id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    apiToken = json['api_token'];
    googleToken = json['google_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['type'] = this.type;
    data['confirmed'] = this.confirmed;
    data['notify'] = this.notify;
    data['city_id'] = this.cityId;
    data['city'] = this.city;
    data['country'] = this.country;
    data['country_id'] = this.countryId;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['api_token'] = this.apiToken;
    data['google_token'] = this.googleToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}