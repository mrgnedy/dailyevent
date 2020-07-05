class EventModel {
  int id;
  String name;
  String phone;
  String telephone;
  String startDate;
  String endDate;
  dynamic lat;
  dynamic lng;
  String address;
  String about;
  String startTime;
  String endTime;
  String ownerName;
  dynamic userId;
  int catId;
  int cityId;
  String city;
  String country;
  int countryId;
  String image;
  String createdAt;
  String updatedAt;

  EventModel(
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

  EventModel.fromJson(Map<String, dynamic> json) {
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